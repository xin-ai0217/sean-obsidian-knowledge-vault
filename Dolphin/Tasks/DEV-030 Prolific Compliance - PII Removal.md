---
tags: task, compliance, prolific, blocked
status: blocked
priority: critical
area: recruitment, compliance
---

# DEV-030 Prolific Compliance — PII Removal

## Background
On 2026-04-14, Prolific placed the account on hold after receiving participant reports that the study "Real Prod Test 1" was collecting personally identifiable information (names and email addresses), in violation of Prolific's Researcher Terms.

Contact: Jodie, Prolific Support team.

## Prolific's Requirements (before account is reinstated)
- [ ] Confirm names and email fields have been removed from the study
- [ ] Confirm they will be removed from all future Prolific studies
- [ ] Confirm no identifiable information will be collected in any future Prolific studies

## Technical Status
The name and email fields were already removed from the interview start screen in a previous update (DEV-027). Prolific participants are no longer asked for any PII during the interview flow.

- `components/interview/InterviewRoom.tsx` — name/email form removed ✅
- `app/api/interview/start/route.ts` — `participant_name` and `participant_email` are optional, default to null ✅
- `/join` page collects demographics — but this is for direct/non-Prolific participants only, not accessible via Prolific study links ✅

## Action Items
- [ ] Reply to Jodie confirming the three points above (see draft below)
- [ ] Wait for Prolific to reinstate the account
- [ ] Once reinstated: re-test the Prolific interview flow end-to-end to confirm no PII is requested

## Draft Reply to Prolific

> Hi Jodie,
>
> Thank you for reaching out. I take this very seriously and want to resolve it promptly.
>
> To confirm:
>
> 1. **The name and email fields have been removed** from the study interface. Participants are no longer asked to provide any identifying information at any point during the interview.
>
> 2. **All future studies on Prolific** will follow the same design — no name, email, or other direct identifiers will be requested.
>
> 3. **I will not collect identifiable information** from Prolific participants in any future studies I run on the platform.
>
> The study "Real Prod Test 1" was an early test during development, and the PII fields were part of a prototype that has since been removed from the production platform.
>
> Please let me know if you need any further confirmation or screenshots, and I'd appreciate your help in reinstating my account when you're satisfied.
>
> Best regards,
> [Your name]

## Status Log
- 2026-04-14: Account placed on hold by Prolific. Task created. Awaiting reinstatement.
