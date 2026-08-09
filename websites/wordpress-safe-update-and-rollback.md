# WordPress Safe Update and Rollback Guide

## Purpose

Use this guide to reduce risk when updating WordPress core, themes, or plugins. Follow the site's approved change-management and hosting procedures.

## Before the Change

- [ ] Confirm authorization and define the maintenance window
- [ ] Record the current WordPress, PHP, theme, and plugin versions
- [ ] Review update notes, compatibility requirements, and known issues
- [ ] Confirm required PHP and database versions
- [ ] Check site health, available storage, and existing errors
- [ ] Create a complete file and database backup using the approved method
- [ ] Confirm the backup is accessible and restorable
- [ ] Test the change in staging when available
- [ ] Identify the rollback trigger, responsible person, and recovery steps
- [ ] Notify stakeholders of expected impact

Never share hosting, database, administrator, SFTP, or API credentials in tickets, screenshots, or public repositories.

## Baseline Test

Before updating, verify and record:

- Home page and navigation
- Login and administrator access
- Contact or lead forms
- Search, cart, checkout, or other critical functions
- Mobile and desktop layout
- Browser console and application errors
- Analytics or tracking when applicable

## Update Procedure

1. Enable maintenance mode if the approved procedure requires it.
2. Update one component at a time so failures can be isolated.
3. Start with the approved dependency order for the specific site.
4. After each update, run the relevant smoke tests.
5. Clear only the necessary application, CDN, and browser caches.
6. Record the component, old version, new version, time, and result.
7. Stop if a critical function, layout, security control, or administrator access fails.

Do not directly edit a vendor plugin or parent theme to force compatibility. Use a supported configuration, child theme, tested code change, or escalation path.

## Post-Update Verification

- [ ] Public pages load without visible errors
- [ ] Administrator sign-in works
- [ ] Forms submit and notifications arrive
- [ ] Critical business workflow succeeds
- [ ] Responsive layout works on representative screen sizes
- [ ] No new critical PHP, server, or browser-console errors appear
- [ ] Scheduled tasks and integrations still operate
- [ ] Security and backup tools report healthy status
- [ ] Stakeholder confirms acceptance when required

## Rollback Procedure

Rollback when a defined critical test fails and a safe correction cannot be completed within the maintenance window.

1. Put the site in the approved maintenance or restricted state.
2. Record the failure, time, affected component, and evidence.
3. Restore the affected component or the approved full backup.
4. Restore the database when the failed change modified database structure or content and the recovery plan requires it.
5. Clear relevant caches.
6. Repeat the baseline tests.
7. Confirm public access and critical workflows.
8. Notify stakeholders and document the rollback outcome.

## Escalate When

- The backup cannot be verified or restored.
- The site displays a fatal error or loses administrator access.
- The database may be corrupted.
- A payment, authentication, privacy, or security function fails.
- Malware, unauthorized administrator accounts, or unexpected file changes are discovered.
- Production access or changes exceed the support role.
