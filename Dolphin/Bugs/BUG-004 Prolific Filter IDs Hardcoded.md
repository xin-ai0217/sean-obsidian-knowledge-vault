---
id: BUG-004
severity: 🟠 Sev 1 — Fix soon
status: Fixed
opened: 2026-04-09
fixed: 2026-04-10
linked-task: "[[DEV-007 Prolific Integration Hardening]]"
---

# BUG-004 — Prolific Filter IDs Hardcoded

**Status: Fixed** ✅

**Symptom:** Country and gender filters may be silently skipped if Prolific changes their `filter_id` values. Researcher thinks they're targeting a specific country but everyone gets invited.

**Root cause:** `lib/prolific.ts` matched on hardcoded strings like `"current-country-of-residence"` and hardcoded choice labels like `"man"`, `"woman"`. Prolific docs explicitly warn that filter IDs are dynamic and must be fetched from `GET /api/v1/filters/`.

**Fix implemented:**
1. **`FILTER_REGISTRY`** — single source of truth for 9 filter definitions, each with a primary `prolificId` + `titleKeywords` fallback array. If Prolific renames a filter ID, we fall back to title keyword matching and log a warning.
2. **`getRawFilters()`** — fetches and caches the *entire* Prolific filter list (not just extracted maps), 1hr TTL, stale-on-error fallback.
3. **`resolveChoiceId()`** — keyword-based choice resolution against live Prolific choice labels. No hardcoded `"male" → "0"` mapping.
4. **`getAvailableFilters()`** — new public function exposing resolved filter options for the UI via `GET /api/prolific/filters`.
5. **Extended demographics** — added ethnicity, education, employment, first language, student status to both `RecruitmentCriteria` and the UI (`RecruitParticipants.tsx` "Advanced demographics" section).
6. **UI loads options live** — country dropdown and all advanced demographic checkboxes are populated from the Prolific API, not hardcoded lists.
