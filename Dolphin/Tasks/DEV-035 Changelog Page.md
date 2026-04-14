---
tags: task
status: planned
priority: p2
area: marketing, trust
inspired-by: Conveo
---

# DEV-035 Changelog Page

## Priority: 🟡 P2 — Medium

## Why
A public changelog builds trust and signals momentum. When a researcher visits and sees recent updates, it tells them: this is an active product, the team ships fast, someone is listening. Conveo's changelog is one of the first things enterprise buyers check.

Near-zero engineering cost — a static markdown-based page. The habit of writing changelog entries is the harder part.

## What to Build
- Public page at `/changelog`
- Each entry: date, tag (new-feature / improvement / fix), title, short description, optional author
- Entries stored as MDX files or in a simple JSON/markdown file (no DB needed)
- Reverse chronological order
- Accessible from the landing page footer and from within the dashboard
- Tags filter (optional v2)

## Subtasks
- [ ] Create `/changelog` route and page component
- [ ] Define entry format (MDX or JSON)
- [ ] Backfill with the last 10–15 major features shipped (DEV-008 through DEV-031)
- [ ] Add "Changelog" link to landing page footer
- [ ] Add "What's new" link in dashboard sidebar or header
- [ ] Commit to writing a changelog entry every time something ships

## Effort Estimate
Small — half a day for the page, then ongoing habit
