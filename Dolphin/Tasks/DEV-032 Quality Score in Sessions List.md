---
tags: task
status: planned
priority: p1
area: sessions, reporting
inspired-by: Conveo
---

# DEV-032 Quality Score in Sessions List

## Priority: 🔴 P1 — High

## Why
We already generate a quality score (0–10) with rating (excellent/good/fair/poor) per session as part of the report. But it's buried inside the individual session report page — researchers have to open each one to find it. Surfacing the score directly in the sessions list lets researchers instantly spot weak interviews, prioritise which to read first, and filter out low-quality responses before analysis.

Low-effort: the data already exists in `reports.content.interview_quality`.

## What to Build
- Show quality badge (excellent / good / fair / poor) on each session row in the sessions list
- Show the numeric score (e.g. 7.4) alongside the badge
- Allow filtering/sorting the sessions list by quality score
- Greyed-out / "pending" state for sessions where the report is still processing

## Subtasks
- [ ] Update SessionsList component to fetch quality score from reports table (join on session_id)
- [ ] Add quality badge column to the session row UI
- [ ] Add "Sort by quality" option to the sort dropdown
- [ ] Add quality filter (all / excellent & good / fair & poor)
- [ ] Handle pending/no-report state gracefully

## Effort Estimate
Small — 1 day (data already exists, mostly UI work)
