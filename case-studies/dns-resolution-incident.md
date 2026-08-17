# Case Study: One Windows Device Cannot Resolve Business Sites

## Scenario

This fictional case demonstrates evidence-driven network troubleshooting without exposing a real network.

A user returned from remote work and could open locally cached files, but browsers and a required web application reported that sites could not be found. Other users at the same location were working normally.

## Ticket Snapshot

| Field | Value |
| --- | --- |
| Type | Incident |
| Priority | P3 Normal |
| Scope | One managed Windows 11 laptop |
| Connection | Office Wi-Fi |
| Symptom | IP connectivity succeeds; domain-name resolution fails |
| Recent change | Laptop moved from home network and VPN to office Wi-Fi |

## Evidence Sequence

The technician tested from the lowest-risk layer upward.

```powershell
ipconfig /all
ping 127.0.0.1
ping <default-gateway>
ping 1.1.1.1
Resolve-DnsName example.com
```

| Test | Result | Interpretation |
| --- | --- | --- |
| Loopback | Success | Local TCP/IP stack responding |
| Default gateway | Success | Local Wi-Fi path available |
| Public test IP | Success | External IP connectivity available |
| DNS lookup | Failure | Problem isolated to name resolution rather than general connectivity |
| Second office device | DNS lookup success | No evidence of a site-wide DNS outage |

The address, gateway, and approved DNS-server assignments matched the expected office configuration. That reduced the likelihood of a DHCP or adapter-profile problem.

## Working Diagnosis

The evidence supported a device-local DNS resolver problem after the network transition. It did not prove a permanent root cause, so the ticket recorded a **working diagnosis** rather than claiming an enterprise DNS failure.

## Approved Action

The technician captured the evidence, then cleared the local DNS resolver cache:

```powershell
ipconfig /flushdns
```

No adapter reset, VPN removal, firewall change, or network-stack reset was required.

## Verification

```powershell
Resolve-DnsName example.com
Test-NetConnection example.com -Port 443
```

- DNS resolution returned an address.
- HTTPS port testing succeeded.
- The original business application loaded and authenticated.
- A second unrelated site loaded.
- The user confirmed normal access after reconnecting to Wi-Fi.

## Escalation Plan if the Symptom Returned

If the device failed again, the next record would include adapter details, DNS-server reachability, VPN client state, event timestamps, and results from the [System Health Collector](../automation/windows/README.md). Repetition across devices would trigger infrastructure escalation and a possible problem record.

## Closure Note

> One managed laptop had working local and external IP connectivity but failed DNS lookups after moving from home/VPN to office Wi-Fi. Other office users were unaffected and assigned network settings matched the approved configuration. Captured baseline results, cleared the local DNS resolver cache, and retested name resolution and HTTPS connectivity successfully. Original business application and a second site verified with the user. Working diagnosis: device-local resolver cache issue after network transition. Escalation evidence defined if the symptom recurs.

Related guide: [Windows Connectivity Troubleshooting](../troubleshooting/windows-connectivity-troubleshooting.md).
