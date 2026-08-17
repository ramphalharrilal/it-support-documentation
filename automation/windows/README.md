# Windows System Health Collector

`Collect-SystemHealth.ps1` creates a structured, local JSON snapshot for an authorized support ticket. It is designed to reduce repeated questioning and make escalation evidence easier to review.

## Collected by Default

- Windows version, build, architecture, boot time, and calculated uptime
- Local fixed-disk capacity and available space
- Network-adapter name, description, status, link speed, and MAC address
- Status of selected Windows services commonly relevant to support
- Metadata for up to 50 System-log errors and warnings from the previous 24 hours
- PowerShell edition and version

The event collection excludes message text because messages can contain usernames, paths, hostnames, and application-specific data.

## Excluded by Default

- IP addresses, gateways, and DNS servers
- Wi-Fi profiles and saved networks
- Browser history, documents, email, and message contents
- Passwords, password hashes, authentication tokens, and recovery keys
- Product keys and license secrets

Use `-IncludeNetworkDetails` only when the incident requires IP-layer evidence and collection is authorized.

## Usage

```powershell
.\Collect-SystemHealth.ps1
```

Specify a controlled local destination:

```powershell
.\Collect-SystemHealth.ps1 -OutputPath C:\Temp\system-health.json
```

Include local network configuration:

```powershell
.\Collect-SystemHealth.ps1 -IncludeNetworkDetails
```

## Safety Controls

1. Run the script only on an authorized Windows device.
2. Explain what will be collected when the support process requires user notice.
3. Store the report in the approved local or ticketing location.
4. Open and review the JSON before sharing it.
5. Redact unnecessary device, adapter, address, or event metadata.
6. Delete the local report according to ticket-retention policy.
7. Do not upload reports produced by real devices to this public repository.

The repository `.gitignore` excludes `system-health-*.json`, but local process and judgment remain the primary controls.

## Example Ticket Reference

> Read-only Windows health snapshot collected at 10:42 local time after user authorization. Report reviewed and attached to restricted ticket evidence as `ATT-204`. Network details excluded because the initial symptom did not require IP configuration.

## Compatibility

The script targets Windows PowerShell 5.1 and PowerShell 7+ on Windows. Some commands require standard Windows management modules and access to the System event log. Collection errors are returned inside the report by area so one unavailable command does not erase successful evidence from other sections.
