---
id: BUG-004
severity: 🟠 Sev 1 — Fix soon
status: Open
opened: 2026-04-09
fixed:
linked-task: "[[DEV-007 Prolific Integration Hardening]]"
---

# BUG-004 — Prolific Filter IDs Hardcoded

**Symptom:** Country and gender filters may be silently skipped if Prolific changes their `filter_id` values. Researcher thinks they're targeting a specific country but everyone gets invited.

**Root cause:** `lib/prolific.ts` matches on hardcoded strings like `"current-country-of-residence"` and `"gender"`, and hardcoded choice labels like `"man"`, `"woman"`. Prolific docs explicitly warn that filter IDs are dynamic and must be fetched from `GET /api/v1/filters/`.

**Current mitigation:** We do fetch live filters and cache for 1 hour — but the matching logic still relies on hardcoded ID strings. If the ID changes we silently return no filter.

**Fix:** Make matching more robust with title-based fallback. Log a warning when an expected filter isn't found. See [[DEV-007 Prolific Integration Hardening]].
