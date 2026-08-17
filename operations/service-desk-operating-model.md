# Service Desk Operating Model

## Purpose

This model defines how a support ticket moves from intake to closure. It is vendor-neutral and should be adapted to the organization's tools, authority boundaries, service catalog, and service-level agreements.

## Classify the Work

| Record type | Definition | Example |
| --- | --- | --- |
| Incident | An unplanned interruption or reduction in service quality | A managed laptop cannot connect to the approved VPN |
| Service request | A standard request for information, access, or an approved service | A manager requests access for a new employee |
| Security event | An observation that may indicate a security issue | A user reports an unexpected MFA prompt |
| Change | An authorized addition, removal, or modification that may affect a service | Updating a WordPress plugin in a maintenance window |
| Problem | Investigation into the underlying cause of recurring or significant incidents | Multiple devices repeatedly lose DNS resolution after VPN use |

Classification matters because each record type has different approval, evidence, communication, and closure requirements.

## Priority Model

Priority combines **impact** and **urgency**. The example targets below are illustrative portfolio values, not commitments for a real organization.

| Priority | Impact and urgency | Example | Illustrative acknowledgement |
| --- | --- | --- | --- |
| P1 Critical | Organization-wide or safety/security-critical service failure with no viable workaround | Core identity service unavailable for most users | 15 minutes |
| P2 High | Multiple users or a critical role blocked; workaround is limited | A department cannot access a required business application | 30 minutes |
| P3 Normal | One or a few users affected; business can continue with reduced efficiency | One user cannot print to a shared printer | 4 business hours |
| P4 Low | Information request, cosmetic issue, or scheduled standard service | Approved software-installation request | 1 business day |

Never increase priority only because a requester is senior. Base it on documented impact, urgency, security exposure, and agreed business rules.

## Ticket Lifecycle

### 1. Intake

- Capture the user's goal, not only the error message.
- Record the affected user, device, service, location, start time, and contact method.
- Check for safety, security, privacy, or widespread-service indicators.
- Set the next-update expectation before ending the first interaction.

### 2. Scope and Classification

- Determine whether the issue affects one user, one device, one location, or many users.
- Classify the record as incident, request, security event, change, or problem.
- Assign priority from impact and urgency.
- Search approved outage notices and known-error records.

### 3. Diagnosis

- Reproduce or observe the symptom safely when possible.
- Establish a known-good baseline and test one layer at a time.
- Record hypotheses before changing configuration.
- Capture command results, timestamps, error codes, and comparisons that can confirm or reject each hypothesis.

### 4. Action

- Prefer the smallest authorized and reversible change.
- Confirm approval and rollback requirements.
- Warn the user before interruption or restart.
- Change one variable at a time and record the result.
- Stop when risk, permissions, or scope exceeds the support role.

### 5. Verification

- Retest the original failed workflow.
- Test a second related function when appropriate.
- Confirm the user sees normal service.
- Observe long enough to rule out a temporary recovery when the incident is intermittent.

### 6. Resolution and Closure

- State the cause or working diagnosis without claiming more certainty than the evidence supports.
- Record the exact resolution, validation, user confirmation, and closure time.
- Remove temporary access or diagnostic files when required.
- Link a knowledge article, problem record, or follow-up action for recurring issues.

## Communication Cadence

| Situation | Communication expectation |
| --- | --- |
| First response | Confirm impact, ownership, current status, and next update time |
| Investigation continues | Share what is known, what is being tested, and whether the user must act |
| Escalation | Explain why the ticket moved, who owns it, and when the next update is expected |
| Workaround | Label it clearly as temporary and record its limitations |
| Resolution | State what changed, what was verified, and what to do if the symptom returns |

Avoid vague updates such as “we are looking into it.” A useful update gives the user a decision, action, or time expectation.

## Escalation Triggers

Escalate when:

- a security event, data exposure, payment risk, or privileged account is involved;
- multiple users, sites, or a critical service are affected;
- administrative access or infrastructure changes exceed the current role;
- an approved troubleshooting limit or SLA threshold is reached;
- the issue recurs after a verified fix;
- a vendor defect, warranty repair, or specialist skill is required.

Use the [ticket escalation template](../escalation/ticket-escalation-template.md) so the receiving team can act without restarting discovery.

## Quality Measures

| Measure | What it reveals | Watch-out |
| --- | --- | --- |
| First-contact resolution | Whether common issues are solved efficiently | Do not close early merely to improve the number |
| Mean time to acknowledge | How quickly ownership is established | Fast acknowledgement is not the same as resolution |
| Mean time to restore | How quickly service returns | Separate temporary workaround from permanent correction |
| Reopen rate | Whether fixes and verification are reliable | Review closure notes for repeated patterns |
| Escalation quality | Whether the next team receives usable evidence | Track tickets returned for missing information |
| User effort | How much repetition or chasing the user experienced | Reduce repeated identity and symptom questions |

Metrics should improve user outcomes and learning, not punish staff for handling complex incidents.
