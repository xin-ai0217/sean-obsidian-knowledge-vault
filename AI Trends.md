# AI Trends

_Daily AI trends, startup ideas, and emerging patterns. Updated daily._

---

## 🌍 Models & Research

### <span style="color: #FF9800">hermes-agent — The Agent That Grows With You</span>
> *"The agent that grows with you."* — [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent) · March 31, 2026 · 18.2k stars, +1,892/day

**💡 What this means:**
- **In plain language:** An open-source agent framework from NousResearch designed to adapt and improve over time — learning from its interactions, expanding its capabilities, and personalizing to the user's workflow.
- **For AI founders:** "Self-improving agents" is the holy grail. hermes-agent shows it's technically achievable. The startup angle: pre-built self-improving agents for specific domains where the agent gets better the more you use it (coding, research, sales). The winner will be whoever builds the best "learning loop" infrastructure.

### <span style="color: #FF9800">claude-code-best-practice — The Definitive Claude Code Guide</span>
> *"Best practices and patterns for using Claude Code effectively."* — [shanraisshan/claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) · March 31, 2026 · 25.7k stars, +1,458/day

**💡 What this means:**
- **In plain language:** A comprehensive guide to getting the most out of Claude Code — patterns, prompts, workflows, and techniques collected from the community.
- **For AI founders:** This is the "collective knowledge" of the Claude Code ecosystem. It signals that AI coding agents have reached a maturity level where "how to use them effectively" is a standalone content category. The commercial angle: build the paid version — structured courses, certifications, and consulting for enterprises learning to use AI coders.

### claude-mem — Memory That Persists Across Sessions
> *"Memory management for Claude Code that persists across sessions."* — [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) · March 31, 2026 · 43.5k stars, +1,087/day

**💡 What this means:**
- **In plain language:** A tool that gives Claude Code persistent memory — so the agent remembers your preferences, past conversations, and project context across different sessions.
- **For AI founders:** Memory across sessions is the difference between "smart for 5 minutes" and "smart for 5 months." claude-mem proves the demand. The product angle: build the polished, enterprise-ready version — with permission controls, team memory sharing, and compliance audit logs.

### VibeVoice — Microsoft's Open-Source Voice Model
> *"VibeVoice is Microsoft's open-source voice model for speech recognition, synthesis, and understanding. Supports large-scale training and inference, building intelligent voice systems that integrate with multi-modal models."* — [microsoft/VibeVoice](https://github.com/microsoft/VibeVoice) · March 29, 2026 · 26.8k stars, +1,491/day

**💡 What this means:**
- **In plain language:** Microsoft released an open-source voice AI model that handles transcription, synthesis, and understanding in one package. It's designed to scale and work with other multi-modal models — essentially giving developers a building block for voice-first AI apps.
- **For AI founders:** Voice AI is moving from proprietary APIs to open-source foundations. VibeVoice signals that the "voice layer" of AI is becoming commoditized. The startup opportunity shifts from "build the voice AI" to "build the voice application" — voice-first interfaces for specific verticals (healthcare dictation, field services, accessibility).

### deer-flow — ByteDance's Open-Source SuperAgent
> *"An open-source SuperAgent harness that researches, codes, and creates. With sandboxes, memories, tools, skills and subagents, it handles different levels of tasks."* — [bytedance/deer-flow](https://github.com/bytedance/deer-flow) · March 29, 2026 · 52.4k stars, +12,247/day

**💡 What this means:**
- **In plain language:** ByteDance's open-source agent framework that can research, code, and create — using sandboxes for isolation, memory systems, tools, skills, and sub-agents to handle tasks ranging from minutes to hours.
- **For AI founders:** deer-flow shows that SuperAgents (agents that do everything) are going open-source. The competitive moat shifts from "build the agent" to "optimize the agent for your use case" and "build the workflow around the agent." The real opportunity: pre-built agent configurations for specific verticals that beat generic agents out of the box.

## ⚙️ Infra

### lean-ctx — Context Optimizer Cuts LLM Token Use by 89-99%
> *"Hybrid Context Optimizer — Shell Hook + MCP Server. Reduces LLM token consumption by 89-99%. Single Rust binary, zero dependencies."* — [yvgude/lean-ctx](https://github.com/yvgude/lean-ctx) · March 30, 2026

**💡 What this means:**
- **In plain language:** A new Rust-based tool that dramatically shrinks the amount of context (conversation history, code files) sent to LLMs — saving up to 99% in tokens. It's a single binary with no dependencies, so it runs anywhere.
- **For AI founders:** This is the clearest signal yet that token efficiency is becoming a first-class engineering concern. As agents run longer tasks with more context, every 10x reduction in token usage translates directly to lower API costs and faster responses. Expect "context compression" to become a standard layer in agent pipelines — build the abstraction that sits between your agent and the LLM API.

### mcp-brasil — MCP Server for 41 Brazilian Public APIs
> *"MCP Server para 41 APIs públicas brasileiras."* — [jxnxts/mcp-brasil](https://github.com/jxnxts/mcp-brasil) · March 26, 2026

**💡 What this means:**
- **In plain language:** A Model Context Protocol (MCP) server that gives AI agents plug-and-play access to 41 Brazilian government and public service APIs — everything from weather to official databases.
- **For AI founders:** MCP is becoming the USB-C of AI tool integration. This project shows the pattern of verticalizing MCP servers for specific countries/regions. There's a real business in building "MCP servers for X" — where X is a specific industry, government, or data ecosystem that doesn't have standardized API access. The market: MCP servers as building blocks for region-specific AI agents.

### Glance — AI-Powered Browser Automation MCP for Claude Code
> *"AI-powered browser automation MCP server for Claude Code. Navigate, click, screenshot, test — all from your terminal."* — [DebugBase/glance](https://github.com/DebugBase/glance) · March 27, 2026

**💡 What this means:**
- **In plain language:** An MCP server that lets AI coding agents directly control a browser — clicking, typing, taking screenshots, running tests — all from the command line without human involvement.
- **For AI founders:** Browser control is one of the holy grails for AI agents. This makes it a commodity MCP server component. The strategic implication: browser-based workflows (testing, data scraping, form filling, UI validation) can now be automated by agents using standard tools. Any startup doing "AI does your web tasks" is now working on top of commoditized browser automation primitives.

### Omnex — The Memory Substrate for the Agentic Era
> *"Omnex is not a search tool. It is the memory substrate for the agentic era — the missing layer between ephemeral context and static embeddings."* — [omnex/omnex](https://github.com/omnex/omnex) · March 26, 2026

**💡 What this means:**
- **In plain language:** A new category of memory system specifically designed for AI agents — sitting between short-term conversation context and long-term embeddings. It manages what agents remember across sessions, how they recall relevant information, and how they update their understanding over time.
- **For AI founders:** Memory is the unsolved problem in agentic AI. Most agents either lose context (too short) or dump everything (too expensive). Omnex represents a third path: purpose-built memory architecture for agents. The startup opportunity: memory-as-a-service for specific agent use cases (coding, research, sales).

### memoryos — Episodic + Semantic Memory Backend for Long-Running AI Agents
> *"Episodic + semantic memory backend for long-running AI agents."* — [syedmusa/memoryos](https://github.com/syedmusa/memoryos) · March 26, 2026

**💡 What this means:**
- **In plain language:** A backend that gives AI agents two types of memory: episodic (what happened when) and semantic (what facts they know). This lets agents maintain coherent understanding over long conversations and multiple sessions.
- **For AI founders:** The "long-running agent" is the next big thing — but only if memory works. memoryos shows the pattern: dual-memory architecture for agents that need to work for hours/days, not minutes. Build the vertical variant: memory for legal research agents, memory for customer support agents, memory for coding agents.

### <span style="color: #FF9800">Deep-Live-Cam — Real-Time AI Face Swap Goes Mainstream</span>
> *"Deep-Live-Cam is a deep learning-based real-time face replacement project with camera support, primarily for research, entertainment, and visual effects experiments."* — [hacksider/Deep-Live-Cam](https://github.com/hacksider/Deep-Live-Cam) · March 29, 2026 · 85.1k stars, +971/day

**💡 What this means:**
- **In plain language:** An open-source project that enables real-time face swapping using deep learning — now with camera support for live video calls, streams, and content creation. It runs locally, preserving privacy.
- **For AI founders:** Real-time face manipulation is moving from academic labs to any developer's laptop. The implications are massive for content creation, entertainment, and accessibility (helping people who can't make certain facial expressions). The startup angle: pre-built face AI tools for specific verticals — virtual avatars for remote work, personalized video messaging at scale, or accessibility tools for the speech-impaired.

## 🚀 Applications

### <span style="color: #FF9800">Agentplace — Create Specialized AI Agents for Real Tasks</span>
> *"Create specialized AI agents for real tasks and workflows."* — [Product Hunt](https://www.producthunt.com/products/agentplace) · March 31, 2026 · 708 votes

**💡 What this means:**
- **In plain language:** A platform that lets non-technical users create AI agents specialized for specific tasks — from customer support to data entry to sales outreach. Point, click, configure, and deploy.
- **For AI founders:** This is the "no-code agent builder" wave. Agentplace proves the market wants "agent creation for everyone." The opportunity: go vertical. Instead of "build any agent," build "build agents for X" — agents for law firms, agents for real estate teams, agents for healthcare clinics. Domain-specific agents beat generic ones out of the box.

### <span style="color: #FF9800">Tobira.ai — A Network Where AI Agents Find Deals</span>
> *"A network where AI agents find deals for their humans."* — [Product Hunt](https://www.producthunt.com/products/tobira-ai) · March 31, 2026 · 708 votes

**💡 What this means:**
- **In plain language:** A marketplace/network where AI agents actively find deals, leads, and opportunities for their human users — essentially a "digital workforce" platform where agents do business development.
- **For AI founders:** This is the first "agent marketplace" that positions agents as active deal-finders, not passive assistants. The pattern: agents that work while you sleep, scanning for opportunities and presenting them. The startup angle: build the vertical version — "agents that find your next deal" for specific industries (VC deal flow, real estate off-market leads, B2B sales prospects).

### Crossnode — Paywall Your Vibe-Coded AI Agents
> *"Vibe code AI agents and put them behind a payment wall."* — [Product Hunt](https://www.producthunt.com/products/crossnode) · March 29, 2026 · 414 votes

**💡 What this means:**
- **In plain language:** A no-code tool that lets you build AI agents with vibe coding (natural language, iterative prompting) and then monetize them behind a payment gate. Essentially: turn your agent workflow into a product you can sell.
- **For AI founders:** This is the "Shopify for AI agents" pattern. As more people vibe-code their own agents, the next step is monetization. Crossnode proves there's a market for agent-to-product infrastructure — helping builders package, price, and distribute their AI workflows. The opportunity: build the infrastructure layer for agent marketplaces and creator economies.

### CrabTalk — 8MB Agent Daemon That's Fully Transparent
> *"The agent daemon that hides nothing. 8MB. Open Source."* — [Product Hunt](https://www.producthunt.com/products/crabtalk) · March 29, 2026 · 197 votes

**💡 What this means:**
- **In plain language:** A tiny (8MB), open-source agent daemon built for transparency — every action is visible and auditable. It's designed for developers who want to understand what their agents are actually doing.
- **For AI founders:** The 8MB size signals a new wave of lightweight, portable AI agents that don't require heavyweight infrastructure. "Transparent by default" is a design philosophy gaining traction as companies need to audit AI behavior for compliance. This is a precursor to AI agents that are trustworthy in regulated industries — the more auditable, the more deployable in finance, healthcare, and legal.

### oh-my-claudecode — Teams Multi-Agent Orchestration
> *"Teams-first Multi-agent orchestration for Claude Code."* — [Yechan-Heo/oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) · March 29, 2026 · 15.8k stars, +1,308/day

**💡 What this means:**
- **In plain language:** A framework for running multiple Claude Code agents as a team — assigning roles, coordinating workflows, and letting agents collaborate on complex tasks rather than working solo.
- **For AI founders:** Multi-agent orchestration is the next frontier. Instead of one agent doing everything, teams of specialized agents divide labor. This pattern unlocks significantly more capable AI systems for enterprise workflows. The startup angle: orchestration layers for specific domains (legal research team, code review team, sales automation team) — build the role definitions and coordination logic for your vertical.

### last30days-skill — Research Any Topic Across the Open Web
> *"AI agent skill that researches any topic across Reddit, X, YouTube, HN, Polymarket, and the web — then synthesizes a grounded summary."* — [mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill) · March 29, 2026 · 15.1k stars, +9,725 this week

**💡 What this means:**
- **In plain language:** An AI agent that simultaneously queries Reddit, X, YouTube, Hacker News, and Polymarket to research any topic and produce a synthesized, grounded report.
- **For AI founders:** Multi-source web research is a $10B+ market opportunity (analysts, consultants, investors all do this manually). This skill proves the technical feasibility — the commercial gap is a polished, branded product with superior synthesis quality, source credibility scoring, and deliverable formats (PDF reports, slide decks, alerts). Niche verticals like "legal due diligence research" or "investment thesis research" are wide open.

### Notion MCP — Your Notion Workspace, Inside Every AI Agent
> *"Your Notion workspace, inside every AI agent."* — [Product Hunt](https://www.producthunt.com/products/notion-mcp) · March 3, 2026

**💡 What this means:**
- **In plain language:** An MCP server that connects any AI agent directly to your Notion workspace — letting agents read, write, and organize your notes, docs, and databases without you in the loop.
- **For AI founders:** Notion is the "second brain" for millions of knowledge workers. Connecting that brain to AI agents is a $1B+ infrastructure opportunity. Notion MCP shows: the integration is trivial (it's just an API wrapper). The moat is polish, security (don't leak company secrets), and enterprise features (SSO, audit logs, permission mapping).

### VibeTalent — Find Vibe Coders Who Actually Ship
> *"Find vibe coders who actually ship."* — [Product Hunt](https://www.producthunt.com/products/vibetalent) · March 29, 2026

**💡 What this means:**
- **In plain language:** A job platform specifically for "vibe coders" — developers who build with AI first, ship fast, iterate on prompts instead of architecture, and don't follow traditional dev processes.
- **For AI founders:** The "vibe coder" is emerging as a distinct category in tech hiring. VibeTalent proves there's a market for matching companies who want AI-native builders with builders who ship with AI. The opportunity: skill verification, portfolio demos, "vibe coding as a service" marketplaces.

### <span style="color: #FF9800">Clico — Every Textbox, Supercharged</span>
> *"Every textbox, supercharged"* — [Product Hunt](https://www.producthunt.com/products/clico) · March 29, 2026 · 414 votes

**💡 What this means:**
- **In plain language:** A Chrome extension that adds AI superpowers to every textbox on the web — rewriting, shortening, expanding, or transforming text wherever you type.
- **For AI founders:** This is the "AI everywhere" pattern — embedding AI directly into existing workflows rather than asking users to switch contexts. The lesson: the best AI product might not be a new app, but a layer that makes existing apps smarter. Any "X + AI" where X is something people use 100x/day is a massive market.

### <span style="color: #FF9800">SUN AI — Personalized AI Audio Lessons On Demand</span>
> *"Personalized AI audio lessons generated on demand"* — [Product Hunt](https://www.producthunt.com/products/sun-ai) · March 29, 2026 · 348 votes

**💡 What this means:**
- **In plain language:** An app that generates personalized audio lessons on any topic on-demand — the AI creates the lesson, the voice speaks it, and you learn by listening.
- **For AI founders:** Audio learning is the "sleep gym" of AI — content consumed while doing other things (commuting, exercising, cooking). This proves demand for audio-first AI education. The vertical opportunity: audio courses for specific domains (medical boards, language learning, compliance training) where the content is structured and the voice matters.

---

## 💡 AI Startup Ideas

_Generated daily based on trends observed. Not financial advice — just an AI founder thinking out loud._

_Criteria: (1) MVP-executable, solves a real pain point in a niche market (2) Long-term bet, not a short-term whim (3) Doesn't compete with OpenAI, Google, or Anthropic._

---

### <span style="color: #FF9800">DealHunter — AI Agents That Find Your Next Deal</span>
**Problem:** Tobira.ai shows agents can find deals, but no one has built a vertical product for specific deal flows. VCs miss deal flow, real estate investors miss off-market properties, B2B sellers miss inbound leads.
**Market:** Deal-driven professionals: VCs ($50B AUM+ actively investing), real estate investors ($1T+ market), B2B sellers ($1.5T+ in US). Each needs "eyes everywhere" that humans can't scale to.
**Why now:** Tobira proved the pattern. The infrastructure (web scraping, API monitoring, data aggregation) is commoditized. The gap: vertical-specific deal agents that understand each industry's deal signals, sources, and qualification criteria.
**MVP hint:** Start with one vertical (e.g., "VC deal flow agent" that monitors 50+ sources and flags startups matching your thesis). Use web scraping APIs + LLM for qualification + notification to your phone/email. Charge $500/month for "always-on deal sourcing."
**Why this wins long-term:** Deal flow is the lifeblood of finance and sales. Once you're the "source of truth" for deal flow in a vertical, switching costs are massive — you know the market, the sources, the quality. Network effects: every user's deal criteria makes the agent smarter for everyone.

---

### <span style="color: #FF9800">ContextBank — Token-Efficient Context Management for Agents</span>
**Problem:** Every agentic app faces the same trade-off: longer context = better performance but 10x higher API costs. lean-ctx shows 89-99% token reduction is possible, but it's a DIY tool for engineers. No one offers "context optimization as a service" for agent builders.
**Market:** Every company building AI agents: coding assistants (Cursor, Copilot), research agents (Perplexity, Arc), customer support agents (Intercom, Zendesk). The market is 50k+ companies spending $1B+ on LLM tokens.
**Why now:** lean-ctx proves the technical breakthrough. But it's a tool, not a product. The startup gap: a managed service that sits between your agent and the LLM, automatically compressing context, prioritizing relevant info, and reducing your token bill by 90%.
**MVP hint:** A middleware (Python library + API) that wraps any LLM call. It analyzes the conversation, applies compression strategies, and returns the same response with 90% fewer tokens. Charge based on token savings (50% of savings = $10K/month for a company spending $20K).
**Why this wins long-term:** Every agent company is your potential customer. The more tokens you save them, the more they pay. Moat: your compression models get better with more data, creating a flywheel. Eventually, you become the "Akamai of LLM context" — every agent passes through you.

---

### <span style="color: #FF9800">AgentAudit — Compliance Layer for Enterprise AI Agents</span>
**Problem:** Enterprises want to deploy AI agents but can't because they can't audit what the agent did. Financial services, healthcare, and legal need every agent decision logged, explainable, and reconcilable. Current agents are black boxes.
**Problem (deeper):** crabtalk shows lightweight, auditable agents are technically possible. But no one offers "audit layer for enterprise" — the middleware that sits between the agent and corporate systems and logs everything.
**Market:** Regulated enterprises: banks ($200B compliance budget), healthcare ($100B), legal ($50B). Each has explicit AI governance requirements now.
**Why now:** New regulations (EU AI Act, SEC AI disclosure rules) require enterprises to explain AI decisions. crabtalk proves "transparent by default" is achievable. The gap: production-grade audit layers for enterprise agent deployments.
**MVP hint:** An MCP server that wraps any agent and logs all inputs/outputs to a tamper-proof audit trail (blockchain or append-only log). Provides dashboard for compliance teams to search, replay, and export agent sessions. Charge per agent-seat-month.
**Why this wins long-term:** Compliance is a forced adopter market — once regulation requires auditability, every enterprise agent needs an audit layer. Network effects: your audit data improves your anomaly detection, which improves your product.