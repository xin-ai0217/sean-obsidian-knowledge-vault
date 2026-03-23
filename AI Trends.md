# AI Trends

> Curated AI developments from [smol.ai](https://news.smol.ai) / [Latent Space](https://www.latent.space/p/2026). Auto-updated daily. See [GitHub](https://github.com/xin-ai0217/sean-obsidian-knowledge-vault) for full history.

---

## 🧠 Foundation Models

Entries sorted alphabetically by topic. Cross-listed items show "→ also in [Section]" note.

---

### Anthropic

- **Claude** — Anthropic expands Claude Code beyond terminal into Telegram & Discord channels, pushing toward persistent developer workflows and ambient agent access.
  > *"Persistent developer workflows and ambient agent access."* — [Anthropic](https://x.com/neilhtennek/status/2034762196576805123) · Mar 19

---

### Astral

- **uv / ruff / ty** — Acquired by OpenAI Codex team. Widely seen as OpenAI strengthening its developer platform moat through ownership of foundational Python tooling.
  > *"Strengthening developer platform moat through Python tooling ownership."* — [Simon Willison](https://x.com/simonw/status/2034672725088997879) · Mar 19
  → *also in ⚙️ Infra*

---

### Cartesia

- **Mamba-3** — SSM optimized for inference-heavy workloads. Early focus on hybrid transformer integration: replacing Gated DeltaNet in next-gen Qwen3.5 / Kimi Linear, unlocking Muon for SSMs.
  > *"Unlocking Muon for SSMs in next-gen Qwen3.5 / Kimi Linear."* — [Cartesia](https://x.com/cartesia/status/2034338862559121475) · Mar 18

---

### Cognition

- **Manus Teams** — Devin decomposes work and delegates to parallel Devins running in separate VMs, scaling agent coordination.
  > *"Agent coordination via work decomposition."* — [Cognition](https://x.com/cognition/status/2034679897084264659) · Mar 19
  → *also in 🚀 Applications*

---

### Cursor

- **Composer 2** — Built on Kimi K2.5. ~1/4 compute from Kimi base, rest from continued pretraining + high-compute RL. Sparked industry-wide debate on base model attribution and open-model licensing.
  > *"1/4 compute from Kimi base, rest from continued pretraining + RL."* — [Cursor](https://x.com/cursor_ai/status/2034668950240329837) · Mar 19
  → *also in 🚀 Applications*

---

### Kimi / Moonshot

- **K2.5** — Kimi publicly confirmed the Cursor partnership after controversy. Framed as open-model ecosystem win: K2.5 provided foundation, Cursor added continued pretraining + RL, Fireworks supplied hosted RL/inference.
  > *"K2.5 provided the foundation, Cursor added continued pretraining and RL."* — [Kimi Moonshot](https://x.com/Kimi_Moonshot/status/2035074972943831491) · Mar 20

---

### LangChain

- **LangSmith Fleet** — Enterprise agent fleet management OS. Agent identity, credential management, permissions, Slack exposure, audit trails. Key signal: "agent" is no longer a useful abstraction — fleet/runtime management is the new center of gravity.
  > *"Agent identity, credentials, permissions, Slack exposure, auditability."* — [LangChain](https://x.com/LangChain/status/2034679590250258855) · Mar 19
  → *also in ⚙️ Infra*

---

### MiniMax

- **M2.7** — Self-evolving agent model. First MiniMax model that "deeply participated in its own evolution." Recursive self-improvement: internal harness iteratively improved eval sets, skills, MCP, memory. Matches GLM-5 SOTA performance at **1/3 the cost** (~$176 vs ~$600). 56.22% SWE-Pro, 57.0% Terminal Bench 2, 97% skill adherence.
  > *"First model deeply participated in its own evolution."* — [MiniMax](https://x.com/MiniMax_AI/status/2034315320337522881) · Mar 18
  > *"Matches GLM-5 SOTA at 1/3 cost."* — [Artificial Analysis](https://x.com/ArtificialAnlys/status/2034313314420019462) · Mar 18

---

### NVIDIA

- **Nemotron-Cascade 2** — 30B MoE / 3B active params. Gold-medal level on IMO 2025, IOI 2025, ICPC World Finals 2025. Beats Qwen3.5-35B-A3B and Qwen3.5-122B-A10B variants. Cascade RL + multi-domain on-policy distillation.
  > *"Best-in-class math/code/alignment, beats Qwen3.5-35B-A3B."* — [NVIDIA](https://x.com/_weiping/status/2034877099908243746) · Mar 20
  → *also in ⚙️ Infra*

---

### OpenAI

- **Astral acquisition** — Acquired Astral (uv, ruff, ty) into OpenAI Codex team. Broader push down-stack toward developer platform ownership.
  > *"OpenAI strengthening its developer platform moat through ownership of foundational Python tooling."* — [Simon Willison](https://x.com/simonw/status/2034672725088997879) · Mar 19
  → *also in ⚙️ Infra*

---

### Qwen / Alibaba

- **Qwen 3.5 Max Preview** — Reached #3 in Math, Top 10 in Arena Expert, Top 15 overall. Large gains vs prior Max variants in text, writing, math.
  > *"Large gains vs prior Max variants in text, writing, math."* — [Arena](https://x.com/arena/status/2034653740465336407) · Mar 19

---

### Xiaomi

- **MiMo-V2-Pro** — API-only reasoning model. 49 on Intelligence Index, 1M context, $1/$3 per 1M tokens. GDPval-AA Elo 1426. Stronger token efficiency, lower hallucination vs peers.
  > *"Stronger token efficiency, lower hallucination vs peers."* — [Artificial Analysis](https://x.com/ArtificialAnlys/status/2034239267052896516) · Mar 18

---

## ⚙️ Infra

---

### Anthropic

- **Claude Code Channels** — Beyond terminal into Telegram & Discord. Part of Anthropic's ambient agent vision.
  > *"Persistent developer workflows and ambient agent access."* — [Anthropic](https://x.com/neilhtennek/status/2034762196576805123) · Mar 19

---

### LangChain

- **LangSmith Fleet** — Enterprise fleet OS: memory, tools, permissions, channel integrations. Shift from "single agent" to fleet management as the primary abstraction.
  > *"Agent identity, credentials, permissions, Slack exposure, auditability."* — [LangChain](https://x.com/LangChain/status/2034679590250258855) · Mar 19
- **LangSmith Sandboxes + Polly GA** — Secure code execution for agents; in-product debugging/improvement assistant.
  > *"Secure code execution for agents."* — [LangChain](https://x.com/samecrowder/status/2034123616720421210) · Mar 18

---

### NVIDIA

- **NemoClaw** — Safety-first agent infra. Zero permissions by default, sandboxed subagents, infra-enforced private inference.
  > *"Zero permissions by default, sandboxed subagents, infra-enforced private inference."* — [Baseten](https://x.com/baseten/status/2034649896523874356) · Mar 19

---

### OpenAI

- **Astral (uv/ruff/ty) acquisition** — OpenAI acquiring Astral team into Codex. Python tooling moat via foundational devtool ownership.
  > *"Strengthening developer platform moat through Python tooling ownership."* — [Simon Willison](https://x.com/simonw/status/2034672725088997879) · Mar 19

---

## 🚀 Applications

---

### Anthropic

- **Claude Code Channels** — Ambient agent access via Telegram & Discord.
  > *"Persistent developer workflows and ambient agent access."* — [Anthropic](https://x.com/neilhtennek/status/2034762196576805123) · Mar 19

---

### Chandra

- **Chandra OCR 2** — New SOTA OCR. 85.9% on olmOCR bench, 90+ languages, 4B params. Supports handwriting, math, forms, tables, image caption extraction.
  > *"85.9% on olmOCR bench, 90+ languages."* — [nathanhabib1011](https://x.com/nathanhabib1011/status/2034565076963991910) · Mar 19

---

### Cursor

- **Composer 2** — Built on Kimi K2.5. Controversy over base model attribution. Product differentiation shifting toward domain-specific RL/evals/UX.
  > *"1/4 compute from Kimi base, rest from continued pretraining + RL."* — [Cursor](https://x.com/cursor_ai/status/2034668950240329837) · Mar 19

---

### LlamaIndex

- **LiteParse** — Local, zero-dependency PDF/Office parser for agents. Layout-aware, spatial preservation, built-in OCR options, targets agent pipelines.
  > *"Layout-aware, spatial preservation, built-in OCR options."* — [LlamaIndex](https://x.com/llama_index/status/2034661997644808638) · Mar 19

---

### Manus

- **Manus Teams** — Parallel Devins in separate VMs. Agent coordination via work decomposition.
  > *"Agent coordination via work decomposition."* — [Cognition](https://x.com/cognition/status/2034679897084264659) · Mar 19

---

### OpenAI

- **Headless SaaS** — Traditional software rebuilt as agent-first APIs with no human UI.
  > *"No human UI, just agent-accessible APIs."* — [ivanburazin](https://x.com/ivanburazin/status/2034042095548187072) · Mar 18

---

### Skills / MCP Ecosystem

- **Skills as abstraction** — Skills solidifying as shared cross-platform abstraction (Claude Code, OpenClaw, Manus, etc.). Progressive disclosure, session distillation, CI-triggered, self-improving. MCP gaining adoption but visible skepticism: *"MCP was a mistake. Long live CLIs."*
  > *"Progressive disclosure, session distillation, CI-triggered, self-improving."* — [mstockton](https://x.com/mstockton/status/2034095691648098606) · Mar 18
  > *"MCP was a mistake. Long live CLIs."* — [skirano](https://x.com/skirano/status/2034269154404868314) · Mar 18

---

### Xiaomi

- **MiMo-V2-Pro** — Efficient reasoning model with strong token efficiency, lower hallucination.
  > *"Stronger token efficiency, lower hallucination vs peers."* — [Artificial Analysis](https://x.com/ArtificialAnlys/status/2034239267052896516) · Mar 18
