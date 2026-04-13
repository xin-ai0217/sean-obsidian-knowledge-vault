# DEV-022 Guest / Trial Mode for Researchers

## Status
Planned

## Priority
🟢 Low — Nice-to-have, not blocking growth

## Summary
Allow researchers to try Dolphin AI without creating a Clerk account — a lightweight "Continue without account" flow that lets them explore the product and create a test study before committing to sign-up.

## Background
Clerk does **not** support anonymous/guest users natively. It's sitting in their Backlog with 484 upvotes (`feedback.clerk.com/roadmap`). There is no `useSignUp({ strategy: "anonymous" })` or similar API available.

## Options

### Option A — Roll your own guest mode
- "Try without account" button on sign-in page
- Generate UUID, store in `localStorage`
- Create DB record with `guest_id` (no Clerk `userId`)
- 7-day expiry, prompt to save work before expiry
- Show persistent "You're in guest mode — sign up to save" banner

### Option B — Lower sign-up friction instead
- Promote Google OAuth as primary (1-click)
- Add a read-only demo study on the landing page
- No guest sessions needed

### Option C — Keep Clerk gate as-is (current)
- Participants already have zero-auth access via `/i/:token`
- Researchers creating studies reasonably need accounts for data persistence

## Recommendation
**Option C for now.** Researchers should have accounts to track their data. Revisit Option A or B if sign-up drop-off becomes measurable.

## Notes
- Clerk docs URL `https://clerk.com/docs/authentication/configuration/anonymous-users` returns 404 — feature was never shipped
- Check `feedback.clerk.com/roadmap` periodically; when Clerk ships this, implementation becomes trivial
