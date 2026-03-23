# AI Trends

> Curated AI developments from [smol.ai](https://news.smol.ai) / [Latent Space](https://www.latent.space/p/2026). Auto-updated daily. See [GitHub](https://github.com/xin-ai0217/sean-obsidian-knowledge-vault) for full history.

---

## 🧠 Foundation Models

Model releases, benchmarks, weights, training breakthroughs. Sorted alphabetically by provider.

---

### Cartesia

- **Mamba-3** — SSM optimized for inference-heavy workloads. Hybrid transformer integration: replacing Gated DeltaNet in next-gen Qwen3.5 / Kimi Linear, unlocking Muon for SSMs.
  > *"Unlocking Muon for SSMs in next-gen Qwen3.5 / Kimi Linear."* — [Cartesia](https://x.com/cartesia/status/2034338862559121475) · Mar 18

---

### Kimi / Moonshot

- **K2.5** — Kimi publicly confirmed the Cursor partnership after controversy. Framed as open-model ecosystem win: K2.5 provided foundation, Cursor added continued pretraining + RL, Fireworks supplied hosted RL/inference.
  > *"K2.5 provided the foundation, Cursor added continued pretraining and RL."* — [Kimi Moonshot](https://x.com/Kimi_Moonshot/status/2035074972943831491) · Mar 20

---

### MiniMax

- **M2.7** — Self-evolving agent model. First MiniMax model that "deeply participated in its own evolution." Recursive self-improvement: internal harness iteratively improved eval sets, skills, MCP, memory. Matches GLM-5 SOTA at **1/3 cost** (~$176 vs ~$600). 56.22% SWE-Pro, 57.0% Terminal Bench 2, 97% skill adherence.
  > *"First model deeply participated in its own evolution."* — [MiniMax](https://x.com/MiniMax_AI/status/2034315320337522881) · Mar 18
  > *"Matches GLM-5 SOTA at 1/3 cost."* — [Artificial Analysis](https://x.com/ArtificialAnlys/status/2034313314420019462) · Mar 18

---

### NVIDIA

- **Nemotron-Cascade 2** — 30B MoE / 3B active params. Gold-medal level on IMO 2025, IOI 2025, ICPC World Finals 2025. Beats Qwen3.5-35B-A3B and Qwen3.5-122B-A10B. Cascade RL + multi-domain on-policy distillation.
  > *"Best-in-class math/code/alignment, beats Qwen3.5-35B-A3B."* — [NVIDIA](https://x.com/_weiping/status/2034877099908243746) · Mar 20

---

### OpenAI

- **Model releases** — OpenAI moving down-stack with Astral acquisition (see Infra). Broader push toward persistent developer workflows and ambient agent access.
  > *"OpenAI strengthening its developer platform moat through ownership of foundational Python tooling."* — [Simon Willison](https://x.com/simonw/status/2034672725088997879) · Mar 19

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

Dev tools, SDKs, orchestration, model serving, cloud platforms, safety tooling, developer infrastructure. Sorted alphabetically.

---

### LangChain

- **LangSmith Fleet** — Enterprise agent fleet management OS. Agent identity, credential management, permissions, Slack exposure, audit trails. Key signal: "agent" abstraction expanding toward fleet/runtime management.
  > *"Agent identity, credentials, permissions, Slack exposure, auditability."* — [LangChain](https://x.com/LangChain/status/2034679590250258855) · Mar 19
- **LangSmith Sandboxes + Polly GA** — Secure code execution for agents; in-product debugging/improvement assistant for production AI systems.
  > *"Secure code execution for agents."* — [LangChain](https://x.com/samecrowder/status/2034123616720421210) · Mar 18
- **MCP momentum** — Google Colab MCP server enabling local agents to drive Colab GPU runtimes; Gemini API adding built-in tools + custom functions in one call. But visible skepticism: *"MCP was a mistake. Long live CLIs."*
  > *"MCP was a mistake. Long live CLIs."* — [skirano](https://x.com/skirano/status/2034269154404868314) · Mar 18

---

### LlamaIndex

- **LiteParse** — Local, zero-dependency PDF/Office parser for agents. Layout-aware, spatial preservation, built-in OCR options, targets agent pipelines.
  > *"Layout-aware, spatial preservation, built-in OCR options."* — [LlamaIndex](https://x.com/llama_index/status/2034661997644808638) · Mar 19

---

### NVIDIA

- **NemoClaw** — Safety-first agent infra. Zero permissions by default, sandboxed subagents, infra-enforced private inference. NVIDIA's answer to OpenClaw-style safety concerns.
  > *"Zero permissions by default, sandboxed subagents, infra-enforced private inference."* — [Baseten](https://x.com/baseten/status/2034649896523874356) · Mar 19

---

### OpenAI

- **Astral (uv/ruff/ty) acquisition** — Astral team (creator of uv, ruff, ty) joining OpenAI Codex. Python tooling moat via ownership of foundational devtools.
  > *"Strengthening developer platform moat through Python tooling ownership."* — [Simon Willison](https://x.com/simonw/status/2034672725088997879) · Mar 19

---

### Skills / Agent Abstraction

- **Skills as cross-platform abstraction** — Skills solidifying across agent stacks (Claude Code, OpenClaw, Manus, etc.): progressive disclosure, session distillation, CI-triggered skills, self-improving skills. MCP resources as distribution mechanism solves staleness/versioning.
  > *"Progressive disclosure, session distillation, CI-triggered, self-improving."* — [mstockton](https://x.com/mstockton/status/2034095691648098606) · Mar 18
- **Anthropic Skills** — Anthropic's public agent skills repo. 99.9k stars, trending +686/day on GitHub. Standardized skill format for Claude Code: folder with scripts/assets/data, trigger conditions in description.
  > *"Public repository for Agent Skills."* — [Anthropics](https://github.com/anthropics/skills) · Mar 22

---

### Trending GitHub — Notable AI Repos

- **everything-claude-code** — Agent harness optimization system for Claude Code, Codex, Opencode, Cursor. 97k stars, **+3.6k/day**. Skills, instincts, memory, security, and research-first development.
  > *"Agent harness performance optimization system."* — [affaan-m](https://github.com/affaan-m/everything-claude-code) · Mar 22
- **deer-flow** (ByteDance) — Open-source SuperAgent harness for research, coding, creation. 34.9k stars, +2.5k/day. Sandboxes, memories, tools, skills, subagents.
  > *"An open-source SuperAgent harness that researches, codes, and creates."* — [bytedance](https://github.com/bytedance/deer-flow) · Mar 22
- **TradingAgents** — Multi-Agents LLM Financial Trading Framework. 36.8k stars, +1.4k/day. Finance-specific multi-agent system with real-world trading integration.
  > *"Multi-Agents LLM Financial Trading Framework."* — [TauricResearch](https://github.com/TauricResearch/TradingAgents) · Mar 22
- **claude-peers-mcp** — TypeScript. Allow all Claude Codes to message each other ad-hoc. 728 stars. Peer-to-peer agent communication.
  > *"Allow all your Claude Codes to message each other ad-hoc."* — [louislva](https://github.com/louislva/claude-peers-mcp) · Mar 23
- **weixin-agent-sdk** — TypeScript. WeChat agent SDK — enables AI agents to interact via WeChat. 663 stars.
  > *"WeChat agent SDK."* — [wong2](https://github.com/wong2/weixin-agent-sdk) · Mar 23
- **claude-plugin-weixin** — TypeScript. Claude Code plugin for WeChat integration. 487 stars.
  > *"Claude Code plugin for WeChat."* — [m1heng](https://github.com/m1heng/claude-plugin-weixin) · Mar 23

---

## 🚀 Applications

User-facing products and agents — end-users interact with these directly. Sorted alphabetically.

---

### Anthropic

- **Claude Code Channels** — Claude Code expanding beyond terminal into Telegram & Discord. Ambient agent access for developers in messaging platforms.
  > *"Persistent developer workflows and ambient agent access."* — [Anthropic](https://x.com/neilhtennek/status/2034762196576805123) · Mar 19

---

### Chandra

- **Chandra OCR 2** — New SOTA OCR. 85.9% on olmOCR bench, 90+ languages, 4B params. Supports handwriting, math, forms, tables, image caption extraction.
  > *"85.9% on olmOCR bench, 90+ languages."* — [nathanhabib1011](https://x.com/nathanhabib1011/status/2034565076963991910) · Mar 19

---

### Cognition

- **Manus Teams** — Devin decomposes work and delegates to parallel Devins in separate VMs. Agentic product scaling coordination via work decomposition.
  > *"Agent coordination via work decomposition."* — [Cognition](https://x.com/cognition/status/2034679897084264659) · Mar 19

---

### Cursor

- **Composer 2** — AI coding product built on Kimi K2.5. ~1/4 compute from Kimi base, rest from continued pretraining + high-compute RL. Sparked debate on base model attribution and open-model licensing.
  > *"1/4 compute from Kimi base, rest from continued pretraining + RL."* — [Cursor](https://x.com/cursor_ai/status/2034668950240329837) · Mar 19

---

### Headless SaaS

- **Agent-first APIs** — Traditional software rebuilt as agent-first APIs with no human UI. Meeting-notes apps evolving into broader AI context/data apps. Rippling launching AI analyst.
  > *"No human UI, just agent-accessible APIs."* — [ivanburazin](https://x.com/ivanburazin/status/2034042095548187072) · Mar 18
