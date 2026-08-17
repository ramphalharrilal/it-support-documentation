# Printer Troubleshooting

## Purpose

Use this guide for common local, shared, and network printer problems such as offline status, stuck jobs, poor output, or failure to print.

## Safety

- Follow the printer manufacturer's safety instructions.
- Do not touch the fuser or other hot internal components.
- Do not force jammed paper or disassemble equipment outside the support role.
- Use approved toner, drivers, and installation packages.

## Triage

Determine:

- Whether one user or multiple users are affected
- Whether one document, one application, or all print jobs fail
- Whether the printer is USB, network, or print-server connected
- The printer name, model, location, and displayed error
- Whether anything recently changed

## Troubleshooting Steps

### 1. Check the device

- Confirm power, paper, toner or ink, and a ready status.
- Check the display for a jam, open door, empty tray, or maintenance warning.
- Confirm the correct tray and paper size are selected.
- Print a device configuration or test page if available and authorized.

If the printer cannot print its own test page, the issue is likely with the printer rather than the computer.

### 2. Check Windows

- Confirm the intended printer is selected.
- Open the print queue and note any error.
- Resume the printer if paused and clear only the affected user's failed jobs when authorized.
- Make sure **Use Printer Offline** is not enabled unexpectedly.
- Print a Windows test page.

### 3. Check the connection

For USB printers:

- Reseat the cable.
- Try an approved known-good cable or port.
- Avoid unapproved USB hubs.

For network printers:

- Confirm the computer has network access.
- Verify the printer has the expected address using its display or configuration page.
- Test reachability when policy permits:

```powershell
ping <printer-address>
```

- Confirm the printer port or print-server queue matches the approved configuration.

### 4. Restart the print path

Try in this order:

1. Close and reopen the source application.
2. Power-cycle the printer according to procedure.
3. Restart the user's computer if practical.
4. Restart the Windows Print Spooler only with authorization and awareness that it may affect other jobs.
5. Remove and reinstall the printer or approved driver only if earlier steps fail.

### 5. Investigate output quality

- Check toner or ink levels and installation.
- Run the approved cleaning or alignment routine.
- Confirm paper type and print-quality settings.
- Compare a printer test page with the user's document.
- Escalate repeated streaking, mechanical noise, damage, or maintenance-kit warnings.

## Verification

Print a test page and the user's original document. Confirm correct printer selection, page count, orientation, color, duplex behavior, and output quality.

## Escalate When

- Multiple users or printers are affected.
- The printer or print server is unreachable.
- Hardware damage, repeated jams, leaks, smoke, unusual heat, or electrical concerns exist.
- Administrative access, driver packaging, print-server changes, or vendor repair is required.
- The issue returns after a documented fix.

