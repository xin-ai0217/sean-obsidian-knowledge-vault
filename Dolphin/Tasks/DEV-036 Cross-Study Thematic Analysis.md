---
tags: task
status: planned
priority: p2
area: analysis, reporting
inspired-by: Conveo
---

# DEV-036 Cross-Study Thematic Analysis

## Priority: 🟡 P2 — Medium

## Why
Right now every session report is siloed. A researcher running 20 interviews has to read 20 separate reports to find patterns. Thematic analysis aggregates all sessions in a study into a single view: recurring themes, how many participants mentioned each one, representative quotes per theme, and AI-generated patterns.

This is the jump from "interview tool" to "research platform." It's what makes Dolphin worth returning to after the first study.

## What to Build
- "Study Analysis" tab on each study page (alongside the session list)
- After N sessions are complete (e.g. 3+), researcher can trigger "Analyse study"
- AI processes all completed session transcripts together:
  - Identifies 5–10 recurring themes across all participants
  - For each theme: short title, 1-sentence description, participant count, top 3 supporting quotes
  - Overall sentiment distribution across the study
  - Key patterns / contradictions / surprises
- Results stored in a new `study_analyses` table
- Regenerate button (re-runs as more sessions complete)
- Export to PDF / copy to clipboard

## Subtasks
- [ ] `study_analyses` table: `study_id`, `status`, `content` (JSONB), `created_at`
- [ ] API: `POST /api/studies/[id]/analyse` — triggers background analysis job
- [ ] AI prompt: aggregate all transcripts, extract themes, quotes, sentiment
- [ ] Study analysis page component
- [ ] "Analyse Study" button on study detail page (appears when ≥3 completed sessions)
- [ ] Progress/pending state while analysis runs
- [ ] Export options

## Effort Estimate
Large — 3–5 days (significant AI prompt engineering + new DB table + UI)
