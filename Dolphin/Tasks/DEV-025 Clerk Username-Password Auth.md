# DEV-025 Clerk Username + Password Auth (No Email Required)

## Status
Done

## Summary
Configured Clerk to allow researchers to sign up with just a username and password — no email or phone required — for privacy-first onboarding.

## Clerk Dashboard Settings Applied
- Sign-up with email: ON (optional, not required)
- Require email address: OFF
- Sign-in with email: OFF
- Sign-up with username: ON
- Require username: ON
- Sign-in with username: ON
- Sign-up with password: ON
- Client Trust: OFF (disabled to prevent lockout for users with no email on new devices)

## Notes
- Client Trust was disabled because it demands a second factor (OTP/magic link) on new device logins — users without email would be permanently locked out
- Password recovery is not available for username-only accounts (no email = no reset path)
- Related: [[DEV-023 Re-evaluate Email Requirement at Sign-up]]
