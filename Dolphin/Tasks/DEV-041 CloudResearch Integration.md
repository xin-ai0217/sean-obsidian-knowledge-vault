# DEV-041 CloudResearch Integration

## Status
In Progress

## Started
2026-04-15

## Summary
Integrate CloudResearch Connect as an alternative recruitment panel while Prolific access is suspended. Same-day US-focused recruiting, 40% service fee, RedirectUrl completion flow.

## What's Done

### Platform adapter (`lib/platforms/cloudresearch.ts`)
- Full `PlatformAdapter` implementation: `createCampaign`, `getCampaignStatus`, `pauseCampaign`, `resumeCampaign`
- `createProject` → `POST /api/v1/project` with name, projectUrl, payment, estimatedTimeInMinutes, participants, systemRequirements, completionSettings
- `publishProject` → `POST /api/v1/project/{id}/update-status { status: "Live" }`
- `getProjectStatus` → `GET /api/v1/project/{id}`
- Cost estimation: `reward × participants × 1.4` (40% fee, no API)
- `checkEligibility` returns 100,000 constant (CR has no eligibility count API)

### Registration (`lib/recruitment.ts`)
- Added to `ALL_PLATFORMS` registry
- Added `CLOUDRESEARCH_API_KEY` check in `getActivePlatforms()`

### DB migration (`supabase/migrations/0006_cloudresearch.sql`)
- `studies.cloudresearch_project_id TEXT`
- `studies.cloudresearch_completion_url TEXT`
- `sessions.source TEXT NOT NULL DEFAULT 'direct'` — distinguishes direct / prolific / cloudresearch
- Backfill: existing `participant_id IS NOT NULL` sessions → `source = 'prolific'`
- Indexes on `sessions(source)` and `sessions(study_id, source)`

### Interview entry flow (`app/i/[token]/page.tsx`)
- Reads `participantId`, `assignmentId`, `projectId` URL params (CloudResearch auto-appends these)
- Determines source: `pid` → prolific, `participantId` → cloudresearch, else direct
- Builds `completionRedirectUrl = cloudresearch_completion_url + participant params`
- Passes `source` and `completionRedirectUrl` to `InterviewRoom`

### Interview completion (`components/interview/InterviewRoom.tsx`)
- Added `source` and `completionRedirectUrl` props
- On completion, if `completionRedirectUrl` set: auto-redirects after 2.5s + shows manual redirect button
- Otherwise shows standard "You're all done" screen

### Session tracking
- `app/api/interview/start/route.ts` — persists `source` field on session creation
- `components/dashboard/StudySessions.tsx` — per-source badges (Direct sky, Prolific violet, CloudResearch blue)
- Session counts by source in aggregate stats

### Campaign pages
- `app/(dashboard)/studies/[id]/page.tsx` — CloudResearch card alongside Direct + Prolific
- `app/(dashboard)/studies/[id]/campaign/cloudresearch/page.tsx` — full campaign page: setup form, stat cards, progress bar, session list
- `components/dashboard/CloudResearchSetupForm.tsx` — participant count + reward input + cost breakdown (40% fee visible)
- `components/dashboard/CloudResearchCampaignActions.tsx` — pause/resume buttons
- `app/api/studies/[id]/recruit/cloudresearch/route.ts` — POST to create campaign
- `app/api/studies/[id]/campaign/cloudresearch/route.ts` — GET status, PATCH pause/resume

## Pending

### Migration not yet applied
Run this SQL in Supabase Studio (copy from `supabase/migrations/0006_cloudresearch.sql`):
```sql
ALTER TABLE studies ADD COLUMN IF NOT EXISTS cloudresearch_project_id TEXT;
ALTER TABLE studies ADD COLUMN IF NOT EXISTS cloudresearch_completion_url TEXT;
ALTER TABLE sessions ADD COLUMN IF NOT EXISTS source TEXT NOT NULL DEFAULT 'direct';
UPDATE sessions SET source = 'prolific' WHERE participant_id IS NOT NULL AND source = 'direct';
CREATE INDEX IF NOT EXISTS idx_sessions_source ON sessions(source);
CREATE INDEX IF NOT EXISTS idx_sessions_study_source ON sessions(study_id, source);
```

### CR API key needed
Add to `.env.local` and Vercel env vars:
```
CLOUDRESEARCH_API_KEY=<your key>
```
Get it from: CloudResearch Dashboard → Account → API Keys

### End-to-end test
- [ ] Create a study
- [ ] Go to CloudResearch campaign tab
- [ ] Launch campaign (verify API call succeeds)
- [ ] Use the generated study link with `?participantId=test&assignmentId=test`
- [ ] Complete the interview
- [ ] Verify redirect to completion URL works
- [ ] Verify session is created with `source = 'cloudresearch'`

## Files Changed
- `lib/platforms/cloudresearch.ts` (new)
- `lib/recruitment.ts`
- `supabase/migrations/0006_cloudresearch.sql` (new)
- `types/database.ts`
- `app/i/[token]/page.tsx`
- `components/interview/InterviewRoom.tsx`
- `app/api/interview/start/route.ts`
- `app/(dashboard)/studies/[id]/page.tsx`
- `app/(dashboard)/studies/[id]/campaign/cloudresearch/page.tsx` (new)
- `components/dashboard/CloudResearchSetupForm.tsx` (new)
- `components/dashboard/CloudResearchCampaignActions.tsx` (new)
- `app/api/studies/[id]/recruit/cloudresearch/route.ts` (new)
- `app/api/studies/[id]/campaign/cloudresearch/route.ts` (new)
- `components/dashboard/StudySessions.tsx`
