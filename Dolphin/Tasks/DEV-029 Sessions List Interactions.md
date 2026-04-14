# DEV-029 Sessions List — Filter, Sort, Rename, Delete

## Status
Done

## Summary
Replaced the static sessions list in the Direct campaign page with a fully interactive client component.

## Features Built

### Filters
- Search by participant name (live, client-side)
- Status filter: All / Completed / In Progress / Pending / Abandoned
- Sort: Newest first / Oldest first / Longest duration / Shortest duration
- Live count showing "X of Y" matching sessions

### Per-Session Actions
- **Rename**: inline edit with ✓/✗ buttons; Enter to save, Escape to cancel
- **Delete**: inline "Delete? Yes / Cancel" confirmation — no modal
- Duration shown in minutes for completed sessions

## Files
- `components/dashboard/SessionsList.tsx` — new client component
- `app/api/studies/[id]/sessions/[sessionId]/route.ts` — new API
  - `PATCH`: rename participant_name
  - `DELETE`: delete session (cascades to turns/reports via FK)
