---
tags: task
status: planned
priority: p1
area: sharing, collaboration
inspired-by: Conveo
---

# DEV-033 Public Sharing Links for Reports

## Priority: 🔴 P1 — High

## Why
Right now session reports are only accessible to the study owner (Clerk auth required). Researchers frequently need to share findings with stakeholders — product managers, executives, clients — who don't have a Dolphin account. A public sharing link removes all friction: click the link, see the report, no login required.

This is also a viral growth mechanism: every shared report is a product demo.

## What to Build
- "Share report" button on the session report page
- Generates a unique, unguessable token (e.g. UUID) stored on the report row
- Public URL: `/share/report/[token]` — renders the full report (quality scores, summary, themes, transcript) without auth
- Researcher can revoke the link (clears the token)
- Optional: expiry date on the link
- No PII exposure risk: report content is already sanitised (no participant email shown)

## Subtasks
- [ ] Add `share_token` column to `reports` table
- [ ] "Share" button + "Copy link" / "Revoke" UI on report page
- [ ] API endpoint: `POST /api/reports/[reportId]/share` → generates token; `DELETE` → revokes
- [ ] Public route: `app/share/report/[token]/page.tsx` (no auth, server-side render)
- [ ] Reuse existing report UI components on the public page
- [ ] Add "Powered by Dolphin" footer on public page (growth)

## Effort Estimate
Small-Medium — 1–2 days
