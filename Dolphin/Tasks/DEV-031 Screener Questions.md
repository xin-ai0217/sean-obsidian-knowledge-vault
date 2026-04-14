---
tags: task
status: planned
priority: p3
area: study-design, participant-quality
inspired-by: Conveo
---

# DEV-031 Screener Questions

## Priority: 🟢 P3 — Strategic (deprioritised)

## Why
Right now anyone with the study link can start an interview regardless of whether they qualify. Screener questions pre-qualify participants before they enter the interview — wrong-fit participants never start, so researchers get cleaner data and don't waste interview slots on unusable responses.

For Prolific studies this is also a compliance safeguard: only people who match the study criteria get through.

## What to Build
- Add a "Screener" section to the study setup flow, before the main questions
- Screener questions are single-select or multi-select (not open-ended)
- Researcher defines which answer(s) qualify vs. disqualify
- When a participant clicks the interview link:
  1. Screener questions appear first (no AI, just a quick form)
  2. If they pass → proceed to interview
  3. If they fail → shown a polite "thank you, you don't qualify" message and the session is not created
- Screener responses stored on the session row for filtering/analysis later
- For Prolific: screener is shown before the AI greeting

## Subtasks
- [ ] Add `screener_questions` column to `studies` table (JSONB array, each item: `{ question, type, options, qualifying_answers }`)
- [ ] Build screener UI in study setup (add/remove questions, mark qualifying answers)
- [ ] Build participant-facing screener page (shown before InterviewRoom)
- [ ] Disqualification flow: polite message, session not created, Prolific return URL if applicable
- [ ] Store screener responses on session record
- [ ] Show screener pass/fail in sessions list

## Effort Estimate
Medium — 2–3 days
