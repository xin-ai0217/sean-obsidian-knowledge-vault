---
tags: task
status: planned
priority: p3
area: analysis, ai, reporting
inspired-by: Conveo
---

# DEV-037 Talk to Your Data

## Priority: 🟢 P3 — Strategic

## Why
The most powerful post-interview feature a research platform can offer. Instead of reading transcripts, the researcher just asks: "What did participants say about the onboarding experience?" or "Which users mentioned pricing as a concern?" The AI searches all transcripts and surfaces relevant quotes, patterns, and counts.

Conveo calls this their biggest differentiator. It converts the platform from a data collection tool into a living knowledge base. Every study you run compounds in value because the data stays queryable forever.

This is a larger build but has the highest long-term retention and differentiation value.

## What to Build

### Phase 1 — Within-study chat (simpler)
- Chat interface on each study page: "Ask about this study"
- User types a natural language question
- AI searches all completed transcripts for that study, returns answer with supporting quotes and turn timestamps
- Clickable quotes link back to the original session report

### Phase 2 — Cross-study chat (harder)
- Chat interface from the main studies dashboard
- User selects which studies to include (or "all")
- AI answers questions spanning multiple studies
- Results include which study + which participant said what

## Subtasks
- [ ] Design chat UI component (message thread style, within a study drawer or sidebar)
- [ ] API: `POST /api/studies/[id]/chat` — takes question, fetches all transcripts, calls AI
- [ ] AI prompt: search-and-synthesise across transcripts, cite specific turns with session ID + turn index
- [ ] Quote linking: clicking a quote in the chat navigates to the exact session report + turn
- [ ] Conversation history (so follow-up questions work)
- [ ] Cross-study version (phase 2): select studies, aggregate transcripts, same chat interface
- [ ] Rate limiting / token management for large studies

## Effort Estimate
Large — 4–7 days (complex AI retrieval, cross-study scope, UI work)

## Notes
- Consider using vector embeddings (pgvector in Supabase) for semantic search across transcripts rather than brute-force prompting — much better at scale
- This feature alone could justify a paid tier upgrade
