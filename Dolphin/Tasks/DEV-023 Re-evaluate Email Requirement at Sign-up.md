# DEV-023 Re-evaluate Email Requirement at Sign-up

## Status
Planned

## Priority
🟡 Medium — Security and operational control

## Summary
Currently email is optional at sign-up to allow privacy-first username + password accounts. Revisit whether to enforce email as required for security and researcher management purposes.

## Background
Email was made optional to support researchers who don't want to share personal info upfront. However, removing email as a required field has trade-offs:

## Reasons to Re-enforce Email
- **Password recovery** — no email = no reset path, users get permanently locked out if they forget their password
- **Account control** — harder to reach researchers for product updates, billing issues, or abuse cases
- **Security** — email verification adds a layer of identity assurance (no bots/throwaway accounts)
- **Invite flow** — email-based participant invite features assume researcher has a verified email
- **Compliance** — may be required depending on jurisdiction or data handling policies

## Current State
- Sign-up with email: ON (optional)
- Require email address: OFF
- Sign-in with email: OFF
- Username: required
- Password: required
- Client Trust: OFF

## Options
- **A) Re-enable required email** — full security, breaks username-only flow
- **B) Soft prompt** — allow username-only sign-up but surface "Add email for account recovery" banner in dashboard post sign-up
- **C) Keep as-is** — accept the trade-off, document the lockout risk clearly

## Notes
- Clerk setting takes effect immediately, no redeploy needed
- If email is re-enforced, also re-enable "Sign-in with email" for consistency
