# Phishing First Response

## Purpose

Use this guide for initial service-desk handling when a user reports a suspicious email, link, attachment, login page, call, or message. Follow the organization's incident-response plan and security-team direction.

## Immediate User Guidance

Ask the user to:

1. Stop interacting with the message, page, or attachment.
2. Do not reply, forward it to coworkers, or approve related MFA prompts.
3. Keep the message available for the approved reporting method; do not delete evidence unless directed.
4. Disconnect the device from the network if an attachment ran, malware is suspected, or the security procedure requires isolation.
5. Use a different trusted device to contact support if the affected device may be compromised.

Do not tell the user to investigate the sender, reopen the attachment, or revisit the link.

## Triage Questions

- What type of message or interaction occurred?
- Did the user click a link, open an attachment, enable macros, run a file, reply, send money, or enter credentials?
- Did the user approve an MFA prompt?
- What device, account, and application were involved?
- When did the event occur?
- Are there unexpected sign-ins, password resets, sent messages, rules, pop-ups, or device behavior?
- Did anyone else receive or interact with the same message?

## Severity Indicators

Escalate immediately according to policy when any of these apply:

- Credentials or MFA approval were provided
- An attachment, installer, script, or macro ran
- Money, tax, payroll, health, customer, or other sensitive data is involved
- The account sent unexpected messages or created unfamiliar forwarding rules
- Multiple users received or acted on the message
- The device shows malware or remote-control behavior
- An executive, administrator, shared mailbox, or privileged account is affected

## Evidence Collection

Use only approved tools and collect the minimum required information:

- Original message through the approved reporting method
- Sender and recipient details
- Subject and received timestamp
- Message headers when requested
- Link address without opening it
- Attachment name and hash when collected by authorized tools
- Screenshot of the warning or page with sensitive data redacted
- User actions and their timestamps

Do not paste active malicious links or sensitive headers into public systems or repositories.

## Authorized Containment Actions

Depending on role and procedure, authorized teams may:

- Isolate the device
- Reset the password after identity verification
- Revoke active sessions and tokens
- Review MFA methods and sign-in activity
- Quarantine or remove the message from mailboxes
- Block malicious senders, domains, links, or file hashes
- Run endpoint detection and antivirus scans
- Review mailbox rules, delegated access, and sent items

Do not perform account, mailbox, endpoint, or network changes beyond your authorization.

## Verification and Follow-Up

- Confirm containment actions completed successfully.
- Confirm the user can access the account through a trusted device.
- Monitor for recurrence using approved security tools.
- Tell the user what signs to report immediately.
- Document the final security-team disposition and required follow-up.

## Ticket Notes

Record scope, impact, timeline, user actions, evidence location, containment, escalation destination, and communication. Classify the ticket according to security policy and restrict access to sensitive incident details.
