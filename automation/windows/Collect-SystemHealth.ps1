<#
.SYNOPSIS
Collects a privacy-conscious snapshot of common Windows health indicators.

.DESCRIPTION
Creates a local JSON report containing read-only operating-system, disk,
network-adapter, service, and recent System event information. IP addressing
and DNS configuration are excluded unless IncludeNetworkDetails is supplied.

The script does not collect passwords, Wi-Fi profiles, browser data, email,
documents, message contents, product keys, or authentication tokens.

.PARAMETER OutputPath
Path for the generated JSON report. The default uses the current directory and
a timestamped filename.

.PARAMETER IncludeNetworkDetails
Includes local IPv4, gateway, and DNS-server configuration. Use only when the
ticket requires it and policy permits collection.

.EXAMPLE
.\Collect-SystemHealth.ps1

.EXAMPLE
.\Collect-SystemHealth.ps1 -IncludeNetworkDetails -OutputPath C:\Temp\health.json
#>
[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$OutputPath = (Join-Path $PWD ("system-health-{0}.json" -f (Get-Date -Format "yyyyMMdd-HHmmss"))),

    [Parameter()]
    [switch]$IncludeNetworkDetails
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Invoke-SafeCollection {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [scriptblock]$Action,

        [Parameter(Mandatory)]
        [string]$Area
    )

    try {
        & $Action
    }
    catch {
        [pscustomobject]@{
            Area  = $Area
            Error = $_.Exception.Message
        }
    }
}

$operatingSystem = Invoke-SafeCollection -Area "Operating system" -Action {
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    [pscustomobject]@{
        Caption      = $os.Caption
        Version      = $os.Version
        BuildNumber  = $os.BuildNumber
        Architecture = $os.OSArchitecture
        LastBootTime = $os.LastBootUpTime
        UptimeHours  = [math]::Round(((Get-Date) - $os.LastBootUpTime).TotalHours, 1)
    }
}

$disks = Invoke-SafeCollection -Area "Local disks" -Action {
    Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType = 3" |
        Sort-Object DeviceID |
        ForEach-Object {
            [pscustomobject]@{
                Drive        = $_.DeviceID
                SizeGB       = [math]::Round($_.Size / 1GB, 1)
                FreeGB       = [math]::Round($_.FreeSpace / 1GB, 1)
                FreePercent  = if ($_.Size -gt 0) {
                    [math]::Round(($_.FreeSpace / $_.Size) * 100, 1)
                } else {
                    0
                }
            }
        }
}

$networkAdapters = Invoke-SafeCollection -Area "Network adapters" -Action {
    Get-NetAdapter |
        Sort-Object Name |
        Select-Object Name, InterfaceDescription, Status, LinkSpeed, MacAddress
}

$networkDetails = if ($IncludeNetworkDetails) {
    Invoke-SafeCollection -Area "Network configuration" -Action {
        Get-NetIPConfiguration |
            Where-Object { $_.NetAdapter.Status -eq "Up" } |
            ForEach-Object {
                [pscustomobject]@{
                    InterfaceAlias = $_.InterfaceAlias
                    IPv4Address    = @($_.IPv4Address.IPAddress)
                    IPv4Gateway    = @($_.IPv4DefaultGateway.NextHop)
                    DnsServers     = @($_.DNSServer.ServerAddresses)
                }
            }
    }
} else {
    "Excluded. Rerun with -IncludeNetworkDetails when authorized and necessary."
}

$serviceState = Invoke-SafeCollection -Area "Core services" -Action {
    $names = "Dnscache", "EventLog", "LanmanWorkstation", "Spooler", "Winmgmt", "wuauserv"
    Get-Service -Name $names -ErrorAction SilentlyContinue |
        Sort-Object Name |
        Select-Object Name, DisplayName, Status, StartType
}

$recentSystemEvents = Invoke-SafeCollection -Area "Recent System events" -Action {
    $since = (Get-Date).AddHours(-24)
    Get-WinEvent -FilterHashtable @{ LogName = "System"; Level = 2, 3; StartTime = $since } -MaxEvents 50 |
        Select-Object TimeCreated, ProviderName, Id, LevelDisplayName
}

$report = [ordered]@{
    SchemaVersion       = "1.0"
    CollectedAt         = (Get-Date).ToString("o")
    CollectionNotice    = "Review and redact this local report before attaching it to a ticket."
    PowerShell          = [pscustomobject]@{
        Edition = $PSVersionTable.PSEdition
        Version = $PSVersionTable.PSVersion.ToString()
    }
    OperatingSystem     = $operatingSystem
    LocalDisks          = $disks
    NetworkAdapters     = $networkAdapters
    NetworkDetails      = $networkDetails
    CoreServices        = $serviceState
    RecentSystemEvents  = $recentSystemEvents
}

$parent = Split-Path -Parent $OutputPath
if ($parent -and -not (Test-Path -LiteralPath $parent)) {
    throw "Output directory does not exist: $parent"
}

$report |
    ConvertTo-Json -Depth 6 |
    Set-Content -LiteralPath $OutputPath -Encoding UTF8

Write-Host "System health report created: $OutputPath" -ForegroundColor Green
Write-Host "Review and redact the report before sharing it." -ForegroundColor Yellow
