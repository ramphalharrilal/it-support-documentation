# Security and Privacy

This public repository contains generalized support procedures, fictional case studies, templates, and a read-only diagnostic script. It must not be used to store live ticket evidence.

## Do Not Submit

Do not open an issue or pull request containing:

- passwords, MFA codes, recovery keys, session tokens, API keys, or private keys;
- real user names, email addresses, phone numbers, or employee identifiers;
- tenant IDs, internal hostnames, private addresses, VPN details, or network diagrams;
- unredacted screenshots, event logs, message headers, diagnostic reports, or ticket exports;
- customer, employer, payment, health, education, or other confidential information.

Use fictional identifiers and documentation-safe ranges such as `example.com` and `<default-gateway>`.

## Reporting a Repository Security Concern

Use the repository owner's private contact route listed on the [portfolio website](https://ramphalharrilal.github.io/) rather than placing sensitive details in a public issue. Provide only the minimum information needed to explain the concern.

## Tooling Boundary

`Collect-SystemHealth.ps1` performs read-only collection, writes the report locally, and excludes network addressing unless explicitly requested. The operator is responsible for authorization, review, redaction, secure transfer, retention, and deletion.
