# AI Trends

> Curated significant AI developments. Sourced from [smol.ai](https://news.smol.ai) / [Latent Space](https://www.latent.space/p/2026).

---

## 🧠 Foundation Models

### MiniMax M2.7 — Self-Evolving Agent Model (03-18)
- MiniMax's first model that "deeply participated in its own evolution"
- 56.22% SWE-Pro, 57.0% Terminal Bench 2, 97% skill adherence across 40+ skills
- Matches GLM-5 SOTA performance at **1/3 the cost** (~$176 vs ~$600 for full index)
- Recursive self-improvement: internal harness iteratively improved itself (eval sets, skills, MCP, memory)
- GDPval-AA Elo 1494, ahead of MiMo-V2-Pro (1426), GLM-5 (1406), Kimi K2.5 (1283)
- Available on Ollama Cloud, Trae, OpenRouter, Vercel, Zo, opencode, kilocode
- Hermes Agent added M2.7 support; some users report better long-running agent behavior vs OpenClaw

### NVIDIA Nemotron-Cascade 2 — Reasoning MoE (03-20)
- 30B MoE / 3B active params
- Gold-medal level on **IMO 2025, IOI 2025, ICPC World Finals 2025**
- Beats Qwen3.5-35B-A3B and Qwen3.5-122B-A10B variants
- Powered by Cascade RL + multi-domain on-policy distillation

### Qwen 3.5 Max Preview — Frontier Challenger (03-19)
- Reached **#3 in Math, Top 10 in Arena Expert, Top 15 overall** on Artificial Analysis
- Large gains vs prior Max variants in text, writing, and math

### Xiaomi MiMo-V2-Pro — Efficient Reasoning (03-18)
- 49 on Intelligence Index, 1M context, $1/$3 per 1M tokens
- GDPval-AA Elo 1426; strong token efficiency, lower hallucination

### Cursor Composer 2 — Built on Kimi K2.5 (03-19/20)
- 61.3 CursorBench, 73.7 SWE-bench Multilingual, $0.50/$2.50 per 1M tokens
- ~1/4 compute from Kimi K2.5 base, rest from continued pretraining + high-compute RL
- Sparked industry debate on base model attribution and open-model licensing
- Kimi confirmed partnership publicly

### Mamba-3 — SSM for Inference Era (03-18)
- State-space model optimized for inference-heavy workloads
- Early focus: plugging into transformer hybrids (replacing Gated DeltaNet in next-gen Qwen3.5/Kimi Linear)
- Unlocking Muon for SSMs

### Mistral Small 4 — Hybrid Reasoning + Multimodal (03-20)
- 119B MoE / 6.5B active params
- Trail peers on raw intelligence; hybrid reasoning + multimodality focus

---

## ⚙️ Infra

### OpenAI Acquires Astral — uv, ruff, ty join Codex (03-19)
- Astral team (creator of uv, ruff, ty) joining OpenAI's Codex team
- Broadly seen as OpenAI strengthening developer platform moat through ownership of foundational Python tooling

### Claude Code Channels — Anthropic Goes Ambient (03-19)
- Claude Code expanding beyond terminal into **Telegram & Discord**
- Part of Anthropic's push toward persistent developer workflows and ambient agent access

### LangSmith Fleet — Enterprise Agent OS (03-19)
- Enterprise workspace for managing agent fleets: memory, tools, permissions, channel integrations
- Emphasizes agent identity, credential management, sharing controls, Slack exposure, auditability
- Key signal: "agent" is no longer a useful abstraction — fleet/runtime management is the new center of gravity

### NVIDIA NemoClaw — Safety-First Agent Infra (03-19)
- NVIDIA's answer to OpenClaw-style safety concerns
- Zero permissions by default, sandboxed subagents, infra-enforced private inference

### MCP Momentum vs Skepticism (03-18/19)
- Google Colab MCP server: local agents can drive Colab GPU runtimes
- Google Gemini API: built-in tools + custom functions in one call
- Visible pushback: "MCP was a mistake. Long live CLIs." — skepticism about protocol longevity

### HermesWorkspace v0.2.0 — Local Agent Runtime (03-20)
- One-command startup, UI-based provider/model config, live model catalogs
- Parallel web search/page extraction, workflow recorder/replay
- Prompt-injection defenses via Camel Guard v0.4
- Community comparison: Hermes = compact retrieval-heavy memory vs OpenClaw = larger replayed history

### LangChain Sandboxes + Polly GA (03-18)
- Sandboxes: secure code execution for agents
- Polly GA: in-product debugging/improvement assistant
- Production observability guides for non-deterministic agents

### Late Interaction Retrieval — Systematic Outperformance (03-19)
- Reason-ModifiedColBERT (150M params) achieving near 90% on BrowseComp-Plus
- Outperformed systems up to 54× larger on deep research-style retrieval
- Strong signal: multi-vector / late-interaction retrieval systematically beating dense single-vector approaches

---

## 🚀 Applications

### Manus Teams — Parallel Devins (03-19)
- Devin decomposes work and delegates to **parallel Devins in separate VMs**
- Cognition's approach to scaling agent coordination

### Agent Operating System Abstraction (03-19)
- Industry shifting from "single agent" to AI operating system metaphor: allocates work, resources, execution contexts
- Agent-native enterprise apps emerging: Rippling AI analyst, Claude for Excel/PowerPoint

### Headless SaaS — Agent-First APIs (03-18)
- Traditional software rebuilt as agent-first APIs with no human UI
- Meeting-notes apps evolving into broader AI context/data applications

### Chandra OCR 2 — New SOTA OCR (03-19)
- 85.9% on olmOCR bench, 90+ languages, 4B params
- Supports handwriting, math, forms, tables, image caption extraction

### GLM-OCR 0.9B — Lightweight OCR (03-19)
- Small OCR model reportedly beating Gemini on OCR benchmarks

### LiteParse — Local Layout-Aware Parser (03-19)
- LlamaIndex open-sourced: local, layout-aware parser for PDFs, Office docs, images
- Zero Python dependencies, built-in OCR options, spatial layout preservation
- Targets agent pipelines specifically

### Skills Solidify as Cross-Platform Abstraction (03-18)
- Skills becoming shared abstraction across agent stacks (Claude Code, OpenClaw, Manus, etc.)
- Progressive disclosure, trace inspection, session distillation, CI-triggered skills, self-improving skills
- MCP resources as distribution mechanism for skills (solves staleness/versioning)
