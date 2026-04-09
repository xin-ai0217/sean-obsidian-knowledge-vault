# 🐬 Dolphin AI
*Updated: 2026-04-09*

---

→ [[Task Board]]
→ [[Bug Board]]

---

## TECH STACK

| Component | What it does | Provider | Plan | Key (truncated) | Usage |
|-----------|-------------|----------|------|-----------------|-------|
| **LLM** | AI interviewer responses | MiniMax | — | `sk-api-EUB2...` | — |
| **ASR** | Transcribe participant audio | Deepgram | — | `a95a17f8...` | — |
| **TTS** | AI interviewer voice | Deepgram | — | (same key) | — |
| **Auth** | Researcher sign in/up | Clerk | Free / Dev | `pk_test_ZHJp...` | — |
| **Database** | All app data | Supabase | Free | `sb_publishable_g1Hj...` | — |
| **File storage** | Interview audio | Supabase Storage | Free | (same project) | — |
| **Deployment** | Hosting + CI/CD | Vercel | Free | — | — |
| **Payments** | Researcher pays for recruitment | Stripe | Test mode | `sk_test_51SA...` | — |
| **Recruitment pool** | Source participants at scale | Prolific | Pay-per-use | `dEIXY...` | — |
| **Email** | Send interview invites | SendGrid (Resend deprecated) | Free tier | — | — |

> Full keys in `.env.local` — never commit that file.
> Fill in Usage column manually or ask Claude to check.
