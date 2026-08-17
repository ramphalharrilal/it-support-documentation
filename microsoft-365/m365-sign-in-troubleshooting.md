# Microsoft 365 Sign-In Troubleshooting

## Purpose

Use this guide when a user cannot sign in to Microsoft 365, Outlook, Teams, OneDrive, or another approved Microsoft application.

## Security Rules

- Never ask the user to send or disclose a password or MFA code.
- Never approve an unexpected MFA prompt.
- Verify the user's identity through the organization's approved process before password, MFA, or account changes.
- Use only authorized administrative tools and follow least privilege.
- Treat unexpected MFA prompts or unfamiliar sign-in activity as a possible security incident.

## Triage Questions

1. What exact error message or code appears?
2. Does the issue affect one application or all Microsoft 365 services?
3. Can the user sign in through the approved Microsoft 365 web portal?
4. Is the user on the office network, home network, or VPN?
5. Did the issue begin after a password, device, phone, or licensing change?
6. Are other users affected?

## Troubleshooting Steps

### 1. Check scope and service health

- Check the organization's service-health dashboard if authorized.
- If multiple users are affected, document the scope and escalate as a possible service incident.

### 2. Test browser sign-in

- Confirm the username is the correct work or school account.
- Try the approved Microsoft 365 web portal in a private browser window.
- Confirm the device date, time, and time zone are correct.
- If browser sign-in works but the desktop application fails, focus on application updates, cached sessions, or profile configuration.

### 3. Check password and account status

Authorized support staff should check whether:

- The account is enabled.
- The password is expired or a reset is required.
- The account is locked by repeated attempts.
- The correct Microsoft 365 license is assigned.
- Conditional access or location policy is blocking the request.

Perform resets or account changes only after identity verification and approval.

### 4. Check MFA

- Confirm the user is responding to a sign-in they initiated.
- Confirm the registered method is available.
- Use the approved recovery or re-registration process if the device or phone number changed.
- Escalate unexpected prompts, repeated prompts, or unfamiliar locations to the security team.

### 5. Troubleshoot the affected application

Try one change at a time:

1. Close and reopen the application.
2. Install approved Microsoft 365 and Windows updates.
3. Sign out of the affected application, restart it, and sign in again.
4. Confirm Windows Settings > Accounts > Access work or school shows the expected account.
5. Repair the application using the organization's approved process.
6. Recreate an Outlook profile or clear stored credentials only when authorized and after confirming the effect on saved settings.

Do not delete profiles, cached data, or credentials before confirming backups and organizational procedure.

## Verification

- Confirm the user can sign in without an error.
- Test the original service and one related service when appropriate.
- For Outlook or OneDrive, confirm synchronization resumes.
- For Teams, confirm chat or meeting access.
- Ask the user to confirm normal operation.

## Escalate With

- User principal name or approved account identifier
- Affected application and version
- Device and operating system
- Exact error code and timestamp
- Network and location context
- Whether web and desktop sign-in behave differently
- Service-health findings
- Troubleshooting steps and results

Do not include passwords, MFA codes, session tokens, or unnecessary personal information.

