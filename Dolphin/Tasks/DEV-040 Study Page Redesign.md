# DEV-040 Study Page Redesign

## Status
Done

## Completed
2026-04-16

## Summary
Redesigned the study detail page layout: three clear sections (Campaigns, Questions, Interviews), flat questions section with inline probing labels, probing editor restored to match study creation UI, and a new aggregated Interviews section with source distinction.

## Changes

### Questions section
- Removed card/box wrapper in view mode — section is now flat and consistent with the rest of the page
- Metadata (`N questions · X min max`) moved from the page header into the Questions section header, inline with the Edit button
- Each question now shows its probing label on the right: **No follow-up** / **Light probe** / **Deep probe**
- **Bug fix**: editing questions was silently stripping probing settings (saving as plain strings). Now correctly preserves `{ text, probing }` objects on save

### Edit mode
- Uses the same probing pill selector UI as study creation (`NewStudyForm`) — No follow-up / Light probe / Deep probe
- Edit mode wrapped in a subtle card to visually contain the form; view mode remains flat

### Interviews section (new)
- New `StudySessions` client component, placed below Questions
- Aggregate stats always visible: `N completed · N in progress · N abandoned · N direct · N from panel`
- Section is collapsed by default; click to expand the full session list
- Each row shows:
  - **Source badge**: Direct (sky blue) or Panel (violet)
  - Status badge (completed / in progress / pending / abandoned)
  - Participant name or "Anonymous"
  - Date, duration
  - "View report" link for completed sessions
- Sessions query upgraded to include `participant_name`, `started_at`, `completed_at`, `created_at`
- Named "Interviews" in UI (clearer than "Sessions" for researchers); "sessions" remains the DB term

### Page header
- Removed redundant metadata row (question count, duration, total completed) — this info now lives in the relevant sections

### Bug fix (unrelated)
- Fixed conflicting dynamic route segment names under `app/api/reports/` — `[sessionId]` and `[reportId]` at the same path level caused a Next.js/Turbopack error. Consolidated to `[id]` with internal aliasing.

## Files Changed
- `app/(dashboard)/studies/[id]/page.tsx`
- `components/dashboard/EditQuestions.tsx`
- `components/dashboard/StudySessions.tsx` (new)
- `app/api/reports/[id]/route.ts` (renamed from `[sessionId]`)
- `app/api/reports/[id]/share/route.ts` (renamed from `[reportId]`)
