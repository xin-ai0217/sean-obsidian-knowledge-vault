# DEV-026 Participant Join Flow

## Status
Done

## Summary
Built a self-registration page for participants who want to join the platform independently, separate from being invited to a specific study.

## What Was Built
- `/join` page with demographics form
- `/api/participants/register` POST route
- `participants` table in Supabase (migration `0005_participants.sql`)
- Landing page "Join as a participant" buttons updated to link to `/join`

## Form Fields
- Email (required, unique)
- Age (optional)
- Sex (optional): Male / Female / Non-binary / Prefer not to say
- Country of residence (optional): dropdown of ~25 countries
- Highest education level (optional)
- Employment status (optional)

## Notes
- Duplicate email returns 409 with friendly message
- Supabase RLS: publicly insertable, no auth required
- TypeScript types not regenerated — `as any` cast used for participants table insert
