# Case Study: Microsoft 365 Access After an MFA Device Change

## Scenario

This is a fictional, privacy-safe incident modeled on a common service-desk pattern.

A remote employee replaced a phone over the weekend. On Monday morning, Outlook and Teams repeatedly requested approval through the old device. The employee could not reach email, calendar, or a scheduled Teams meeting.

## Ticket Snapshot

| Field | Value |
| --- | --- |
| Type | Incident |
| Priority | P2 High |
| Impact | One employee blocked from core communication tools before a scheduled meeting |
| Device | Managed Windows 11 laptop |
| Services | Outlook, Teams, Microsoft 365 web portal |
| Workaround | Manager temporarily forwarded the meeting link through an approved channel |

## Timeline

| Time | Action and evidence |
| --- | --- |
| 08:07 | Ticket received with exact sign-in prompt and callback number |
| 08:11 | User identity verified through the approved process; no password or MFA code requested |
| 08:14 | Service health checked; no active Microsoft 365 incident found |
| 08:18 | Private-browser test reproduced the MFA prompt, showing the issue was not limited to cached Outlook data |
| 08:22 | User confirmed the phone replacement and denied approving any unexpected prompts |
| 08:27 | Authorized identity administrator reviewed the account and required MFA re-registration |
| 08:33 | User registered the approved method from the new phone and completed a fresh web sign-in |
| 08:38 | Outlook synchronization, Teams chat, and meeting access verified with the user |
| 08:42 | Ticket resolved with prevention guidance and complete closure notes |

## Hypotheses and Decisions

| Hypothesis | Evidence | Decision |
| --- | --- | --- |
| Microsoft 365 outage | Only one user affected; service health normal | Rejected |
| Outlook token-cache issue | Web sign-in failed with the same MFA dependency | Rejected as the primary cause |
| Expired password or locked account | The password step succeeded and the MFA challenge appeared | Lower probability |
| Registered MFA method no longer available | User replaced the phone and prompt targeted the previous method | Supported |
| Account compromise | User reported no unexpected approvals or unfamiliar activity | No positive indicator, but security guidance still provided |

## Safe Resolution

The service desk did not ask for the password, read an MFA code, or bypass identity verification. An authorized identity administrator required MFA re-registration through the approved administrative process. The user then enrolled the new device directly.

## Verification

- Microsoft 365 web sign-in completed in a new private-browser session.
- Outlook opened and synchronized new messages.
- Teams chat loaded and the scheduled meeting link opened.
- The user confirmed the old phone was no longer required.
- The user knew how to report an unexpected MFA prompt.

## Closure Note

> User unable to access Microsoft 365 after replacing the registered MFA phone. Identity verified through the approved process. No service-health incident or unexpected MFA activity reported. Authorized identity administrator required MFA re-registration. User enrolled the approved method on the new phone. Web portal, Outlook synchronization, Teams chat, and meeting access verified at 08:38. User confirmed normal service and received MFA-prompt safety guidance.

## What This Demonstrates

- Business-impact prioritization rather than error-message triage
- Separation of authentication, MFA, application cache, and service-health hypotheses
- Identity and MFA safety boundaries
- Clear handoff to an authorized administrator
- Multi-service verification and a closure record another technician can trust

Related guide: [Microsoft 365 Sign-In Troubleshooting](../microsoft-365/m365-sign-in-troubleshooting.md).
