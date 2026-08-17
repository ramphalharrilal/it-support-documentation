# Windows Connectivity Troubleshooting

## Purpose

Use this guide to investigate a Windows device that cannot reach a website, business application, network share, or the internet.

## Safety and Scope

- Confirm whether the issue affects one application, one device, one location, or multiple users.
- Ask whether the user is connected by Wi-Fi, Ethernet, VPN, or a mobile hotspot.
- Record recent changes, error messages, and the time the issue began.
- Do not disable security controls, change production network equipment, or reset adapters without authorization.
- Warn the user before any step that may interrupt their connection.

## Troubleshooting Flow

### 1. Confirm the symptom

- Test a second website or approved application.
- Determine whether the problem is internet access, name resolution, VPN access, or a single service.
- Check for a known service or site outage using the organization's approved status source.

### 2. Check the physical and wireless connection

- Confirm airplane mode is off.
- Confirm Wi-Fi is enabled and connected to the correct network.
- For Ethernet, reseat the cable and check link lights if available.
- If permitted, test another known-good cable, port, or network.
- Disconnect an unneeded VPN temporarily only when policy allows it.

### 3. Inspect the network configuration

Open Command Prompt and run:

```powershell
ipconfig /all
```

Check for:

- An expected IPv4 address
- A default gateway
- DNS server addresses
- An address beginning with `169.254`, which can indicate that DHCP did not provide an address

Do not post the full command output publicly because it may contain internal network details.

### 4. Test each connection layer

Run the following tests in order:

```powershell
ping 127.0.0.1
ping <default-gateway>
ping 1.1.1.1
nslookup example.com
```

| Result | Likely area to investigate |
| --- | --- |
| Loopback fails | Local TCP/IP stack |
| Gateway fails | Wi-Fi, cable, adapter, local network, or VLAN |
| Public IP succeeds but name lookup fails | DNS configuration or DNS service |
| All tests succeed but one application fails | Application, proxy, browser, certificate, or service issue |

Some networks block ping, so combine these results with browser and application tests.

### 5. Apply low-risk fixes

Try one change at a time and record the result:

1. Toggle Wi-Fi off and on or reconnect the Ethernet cable.
2. Forget and reconnect to the Wi-Fi network only if the approved credentials are available.
3. Restart the affected application or browser.
4. Restart the computer if it will not interrupt unsaved work.
5. Flush cached DNS records:

```powershell
ipconfig /flushdns
```

6. Renew the DHCP lease when authorized:

```powershell
ipconfig /release
ipconfig /renew
```

Use network resets only as an approved last step because they can remove configuration and require a restart:

```powershell
netsh winsock reset
netsh int ip reset
```

## Verification

- Confirm the original website, application, share, or VPN resource works.
- Test a second network resource.
- Confirm the fix remains after reconnecting or restarting when relevant.
- Ask the user to verify normal service.

## Escalate When

- Multiple users or an entire site are affected.
- DHCP, DNS, gateway, switch, firewall, access point, or VPN infrastructure is suspected.
- Administrative changes are required outside the support role.
- The device repeatedly loses connectivity.
- There are signs of malware, an unauthorized proxy, or suspicious network activity.

## Ticket Notes

Record the connection type, scope, error message, relevant test results, actions taken, outcome, and user confirmation. Redact passwords, private keys, tokens, and unnecessary internal addresses.

