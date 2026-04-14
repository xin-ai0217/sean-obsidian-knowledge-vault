---
tags: task
status: planned
priority: p2
area: study-design, onboarding
inspired-by: Conveo
---

# DEV-034 Study Templates

## Priority: 🟡 P2 — Medium

## Why
Right now every study starts from a blank form. New researchers face "blank page anxiety" — they're not sure what makes a good interview guide, how many questions to ask, or how to phrase things. Templates give them a proven starting point, reduce time-to-first-study, and encode research best practices.

Also useful as a marketing/sales tool: a "User Onboarding Research" template on the homepage communicates use cases without requiring a wall of text.

## What to Build
- A library of pre-built study templates (5–10 to start), e.g.:
  - User onboarding experience
  - Feature feedback
  - Brand perception
  - Concept testing
  - Customer churn / why they left
  - Job-to-be-done discovery
- "New study" page gets a template picker step before the blank form
- Each template includes: title, description, suggested duration, pre-filled questions with probing levels
- Researcher can edit any field after selecting a template
- "Save as template" option on existing studies (power user feature, v2)

## Subtasks
- [ ] Design and write 5 starter templates (content work)
- [ ] Add template picker UI to new study flow
- [ ] Template data: static JSON file or DB table (`study_templates`)
- [ ] "Use this template" → pre-fill NewStudyForm with template data
- [ ] Template preview card (shows question count, suggested duration, description)

## Effort Estimate
Medium — 2 days (mostly content + UI, minimal backend)
