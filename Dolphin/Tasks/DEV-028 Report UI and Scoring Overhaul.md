# DEV-028 Report UI and Scoring Overhaul

## Status
Done

## Summary
Overhauled the interview quality scoring scale, the AI prompt rubric, and the report UI for clarity and rigor.

## Scoring Scale Change (0–100 → 0–10)
- All heuristic formulas divided by 10
- Rating thresholds updated: excellent ≥8.5, good ≥7.0, fair ≥5.0, poor <5.0
- AI prompt updated to score 0–10 (a strong interview = 7–8, not 70–80)

## AI Prompt Rubric — New Per-Dimension Criteria
Each dimension now has 5-level anchor descriptions (0–2, 3–4, 5–6, 7–8, 9–10):
- **Relevance**: does each answer actually address the question asked?
- **Consistency**: are positions coherent and non-contradictory across the interview?
- **Completeness**: did participant engage with the full scope of each question?
- **Expressiveness**: specific, concrete, quotable language — not just word count
- **Insightfulness**: non-obvious perspectives with genuine research value
- Overall score is a defined weighted average (completeness 25%, others 20%/15%)
- Strengths/concerns require transcript evidence — generic outputs rejected via examples

## Report UI Changes
- Removed rationale paragraph (the AI-written summary of quality)
- Removed large overall score number
- Kept the rating badge (Good / Excellent / Fair / Poor)
- Progress bars: thinner (`h-1.5`), neutral color, correct width (`score * 10%`)
- Scores display as `/10` not `/100`
- Strengths: green `↑` bullet; Concerns: amber `↓` bullet
- Removed `max-w-3xl` — report now uses full dashboard width
- Token budget increased from 1500 → 2000 for richer output
