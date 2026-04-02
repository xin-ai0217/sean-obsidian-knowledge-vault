# AI Trends

_Daily AI trends, startup ideas, and emerging patterns. Updated daily._

---

## 🌍 Models & Research

### hermes-agent — The Agent That Grows With You
> *"The agent that grows with you."* — [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent) · March 31, 2026 · 18.2k stars, +1,892/day

**💡 What this means:**
- **In plain language:** An open-source agent framework from NousResearch designed to adapt and improve over time — learning from its interactions, expanding its capabilities, and personalizing to the user's workflow.
- **For AI founders:** "Self-improving agents" is the holy grail. hermes-agent shows it's technically achievable. The startup angle: pre-built self-improving agents for specific domains where the agent gets better the more you use it (coding, research, sales). The winner will be whoever builds the best "learning loop" infrastructure.

### claude-code-best-practice — The Definitive Claude Code Guide
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

### <span style="color: #FF9800">Arcee Trinity-Large-Thinking — Open Weights SOTA Reasoning Model</span>
> *"400B total / 13B active MoE, Apache 2.0 open weights, #2 on PinchBench behind Opus 4.6."* — [Arcee AI](https://x.com/arcee_ai/status/2039369121591120030) · April 1, 2026

**💡 What this means:**
- **In plain language:** Arcee released a state-of-the-art reasoning model with open weights under Apache 2.0 license — a 400B total / 13B active mixture-of-experts model that ranks #2 on PinchBench, behind only Claude Opus 4.6. OpenRouter immediately made it available.
- **For AI founders:** This is a major milestone for "American open source" AI. The opportunity: enterprises that want to inspect, host, distill, and post-train their own reasoning models now have a serious alternative to closed APIs. The business angle: hosting/distillation services, enterprise support, and specialized fine-tuned variants for specific industries.

### <span style="color: #FF9800">Claude Code Source Leak Reveals Agent Architecture</span>
> *"4-layer context compression stack, 40+ tool modular architecture, streaming + parallel tool execution."* — [ZhihuFrontier](https://x.com/ZhihuFrontier/status/2039229986339688581) · April 1, 2026

**💡 What this means:**
- **In plain language:** An accidental leak of Claude Code's source revealed Anthropic's minimalist agent core — a single while(true) loop with sophistication pushed into context management, tooling, and instrumentation. Key features: 4-layer context compression (HISTORY_SNIP, Microcompact, CONTEXT_COLLAPSE, Autocompact), streaming tool execution, and task budget management.
- **For AI founders:** This is the most detailed look at how frontier AI companies build production agents. The insight: the agent loop itself is simple — the differentiation is in context management and tooling. Build better tooling/instrumentation layers for your vertical.

---

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

### Deep-Live-Cam — Real-Time AI Face Swap Goes Mainstream
> *"Deep-Live-Cam is a deep learning-based real-time face replacement project with camera support, primarily for research, entertainment, and visual effects experiments."* — [hacksider/Deep-Live-Cam](https://github.com/hacksider/Deep-Live-Cam) · March 29, 2026 · 85.1k stars, +971/day

**💡 What this means:**
- **In plain language:** An open-source project that enables real-time face swapping using deep learning — now with camera support for live video calls, streams, and content creation. It runs locally, preserving privacy.
- **For AI founders:** Real-time face manipulation is moving from academic labs to any developer's laptop. The implications are massive for content creation, entertainment, and accessibility (helping people who can't make certain facial expressions). The startup angle: pre-built face AI tools for specific verticals — virtual avatars for remote work, personalized video messaging at scale, or accessibility tools for the speech-impaired.

### <span style="color: #FF9800">learn-coding-agent — Open-Source Coding Agent Research</span>
> *"Research on Coding Agents. 10,961 stars in first week."* — [sanbuphy/learn-coding-agent](https://github.com/sanbuphy/learn-coding-agent) · April 2, 2026

**💡 What this means:**
- **In plain language:** An open-source repository aggregating research on coding agents — patterns, architectures, techniques, and implementations from the frontier of AI-assisted software development.
- **For AI founders:** The "coding agent" category is exploding. This repo shows the breadth of research happening. The opportunity: synthesize this research into actionable guides, build specialized coding agents for specific languages/frameworks, or create tooling that implements the latest patterns.

### <span style="color: #FF9800">openclaude — Claude Code for Any LLM</span>
> *"Claude Code opened to any LLM — OpenAI, Gemini, DeepSeek, Ollama, and 200+ models."* — [Gitlawb/openclaude](https://github.com/Gitlawb/openclaude) · April 2, 2026 · 6,074 stars

**💡 What this means:**
- **In plain language:** An open-source project that lets you use Claude Code's agentic capabilities with any LLM provider — not just Anthropic's models. Supports OpenAI, Gemini, DeepSeek, Ollama, and 200+ other models.
- **For AI founders:** This proves the "agent framework" layer is separable from the "model" layer. The opportunity: build better agent frameworks that work with any model, or specialize the framework for specific verticals/use cases while letting users choose their model.

---

## 🚀 Applications

### Agentplace — Create Specialized AI Agents for Real Tasks
> *"Create specialized AI agents for real tasks and workflows."* — [Product Hunt](https://www.producthunt.com/products/agentplace) · March 31, 2026 · 708 votes

**💡 What this means:**
- **In plain language:** A platform that lets non-technical users create AI agents specialized for specific tasks — from customer support to data entry to sales outreach. Point, click, configure, and deploy.
- **For AI founders:** This is the "no-code agent builder" wave. Agentplace proves the market wants "agent creation for everyone." The opportunity: go vertical. Instead of "build any agent," build "build agents for X" — agents for law firms, agents for real estate teams, agents for healthcare clinics. Domain-specific agents beat generic ones out of the box.

### Tobira.ai — A Network Where AI Agents Find Deals
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

### Clico — Every Textbox, Supercharged
> *"Every textbox, supercharged"* — [Product Hunt](https://www.producthunt.com/products/clico) · March 29, 2026 · 414 votes

**💡 What this means:**
- **In plain language:** A Chrome extension that adds AI superpowers to every textbox on the web — rewriting, shortening, expanding, or transforming text wherever you type.
- **For AI founders:** This is the "AI everywhere" pattern — embedding AI directly into existing workflows rather than asking users to switch contexts. The lesson: the best AI product might not be a new app, but a layer that makes existing apps smarter. Any "X + AI" where X is something people use 100x/day is a massive market.

### SUN AI — Personalized AI Audio Lessons On Demand
> *"Personalized AI audio lessons generated on demand"* — [Product Hunt](https://www.producthunt.com/products/sun-ai) · March 29, 2026 · 348 votes

**💡 What this means:**
- **In plain language:** An app that generates personalized audio lessons on any topic on-demand — the AI creates the lesson, the voice speaks it, and you learn by listening.
- **For AI founders:** Audio learning is the "sleep gym" of AI — content consumed while doing other things (commuting, exercising, cooking). This proves demand for audio-first AI education. The vertical opportunity: audio courses for specific domains (medical boards, language learning, compliance training) where the content is structured and the voice matters.

### AI-Scientist-v2 — Sakana AI's Research Agent
> *"AI-Scientist-v2 from Sakana AI — automating scientific discovery with AI agents."* — [SakanaAI/AI-Scientist-v2](https://github.com/SakanaAI/AI-Scientist-v2) · April 1, 2026 · Trending

**💡 What this means:**
- **In plain language:** Sakana AI released version 2 of their AI Scientist — an agent that can autonomously conduct scientific research, from literature review to hypothesis generation to running experiments.
- **For AI founders:** AI-driven scientific discovery is moving from concept to reality. The opportunity: vertical research agents for specific domains (drug discovery, materials science, quantitative finance) that can read papers, design experiments, and analyze results faster than human researchers.

### phantom — AI Co-Worker with Persistent Memory
> *"An AI co-worker with its own computer. Self-evolving, persistent memory, MCP server, secure credential collection, email identity."* — [ghostwright/phantom](https://github.com/ghostwright/phantom) · April 1, 2026

**💡 What this means:**
- **In plain language:** An AI agent that's designed as a "co-worker" — it has its own persistent memory, can authenticate with services, manages credentials securely, and can act on your behalf in email and other systems.
- **For AI founders:** The "AI employee" is closer than we think. phantom shows the pattern: agents that don't just assist but actually do work autonomously. The startup angle: pre-configured "employees" for specific roles (research assistant, sales development rep, customer support agent) that come with all the integrations built in.

### <span style="color: #FF9800">Roger AI — Your Friendly Screen Guide</span>
> *"Your friendly screen guide for any task!"* — [Product Hunt](https://www.producthunt.com/products/roger-ai-2) · April 1, 2026

**💡 What this means:**
- **In plain language:** A screen guidance AI that helps users navigate and complete tasks on their computer — providing real-time assistance and walking through complex processes.
- **For AI founders:** This is the "AI onboarding" category — helping users learn new software. The pattern: AI that watches what you're doing and teaches you in real-time. Opportunity: vertical versions for specific software (CRM onboarding, coding environment setup, design tool tutorials).

### <span style="color: #FF9800">Mode AI — AI Mode for Your Workflow</span>
> *"AI-powered workflow optimization"* — [Product Hunt](https://www.producthunt.com/products/mode-ai) · April 1, 2026

**💡 What this means:**
- **In plain language:** An AI tool that optimizes your workflow — identifying bottlenecks, suggesting improvements, and automating repetitive tasks.
- **For AI founders:** Workflow AI is a crowded space. The differentiator is vertical specialization. Build workflow AI for specific professions (lawyer document review, accountant reconciliation, nurse scheduling) with deep domain knowledge.

### <span style="color: #FF9800">Lightning V3 — Text-to-Speech for Voice Agents</span>
> *"Text-to-Speech built for Voice Agents"* — [Product Hunt](https://www.producthunt.com/products/smallest-ai) · March 9, 2026

**💡 What this means:**
- **In plain language:** A TTS model specifically optimized for voice AI agents — lower latency, more natural prosody, and better handling of the specific patterns voice agents use.
- **For AI founders:** Voice agents need voice AI that's built for them, not repurposed from human TTS. The opportunity: build the voice layer for specific agent use cases (customer service, telemedicine, education) with custom voice characteristics.

---

## 💡 AI Startup Ideas

_Generated daily based on trends observed. Not financial advice — just an AI founder thinking out loud._

_Criteria: (1) MVP-executable, solves a real pain point in a niche market (2) Long-term bet, not a short-term whim (3) Doesn't compete with OpenAI, Google, or Anthropic._

---

### <span style="color: #FF9800">AgentForge — Build Your First AI Employee in Hours</span>
**Problem:** phantom shows AI co-workers are possible, but building one from scratch takes weeks of engineering. Small businesses want "an AI that does X" but can't hire a developer to build it.
**Market:** 30M+ small businesses in the US alone, each wanting automation but lacking engineering resources. The "no-code AI employee" market is untapped.
**Why now:** The building blocks exist (MCP, persistent memory, credential management). What's missing: a no-code builder that lets anyone create an AI employee for their specific business need in hours, not weeks.
**MVP hint:** A drag-and-drop builder where users select: (1) Role (sales rep, researcher, assistant) (2) Integrations (email, CRM, Slack, calendar) (3) Memory (what the agent remembers about customers, tasks, preferences). Output: a working API-key-authenticated agent that connects to their tools.
**Why this wins long-term:** Every small business wants "one more employee but can't afford one." The winner is whoever makes it fastest to create an AI employee. Network effects: templates shared between users build a marketplace of best-practice AI employees.

---

### <span style="color: #FF9800">ResearchGraph — AI Research Synthesis for Decision Makers</span>
**Problem:** last30days-skill proves multi-source research works, but the output is raw. Decision makers (CEOs, investors, policy makers) need synthesized, actionable insights — not just a list of links.
**Market:** Decision makers who pay for research: institutional investors ($50B+ research budgets), strategy consultants ($30B), corporate executives ($100B+ in strategic planning). Each needs "research I can act on."
**Why now:** The technical capability exists (multi-source AI research). The gap: turning research output into decision-grade insights with source verification, confidence scoring, and executive-ready formatting.
**MVP hint:** Input: a strategic question ("Will AI agents replace software engineers by 2028?"). Output: a 5-page memo with: (1) Answer with confidence level (2) Supporting evidence with sources (3) Key assumptions (4) What would change the answer. Use last30days-style multi-source + LLM synthesis + human-editor review loop. Charge $2K/research or $10K/year subscription.
**Why this wins long-term:** The "AI analyst" replaces the junior analyst. Every decision maker needs research, but few have teams. Subscription model creates predictable revenue. Moat: proprietary training data from thousands of research memos.

---

### <span style="color: #FF9800">SkillMarket — Verified Prompt Engineering Marketplace</span>
**Problem:** Every company building AI agents needs skilled prompt engineers, but there's no way to verify "expertise." Companies hire expensive prompt engineers who underperform. Engineers claim "prompt engineering" on resumes without proof.
**Market:** 50k+ companies building AI products, each needing 1-10 prompt engineers. The market for AI talent is $10B+ and growing.
**Why now:** open-agent-sdk and similar tools make prompt engineering "skill-based" rather than "art-based." This enables verifiable skill testing. The gap: a marketplace that certifies prompt engineers and connects them with companies.
**MVP hint:** A platform where prompt engineers take standardized tests (build an agent that does X, optimize a prompt for Y). Scoring is automated. Engineers get a "certified" badge. Companies post jobs or commission prompts directly. Take 10% commission on placements.
**Why this wins long-term:** Talent marketplaces are winner-take-most. The first-mover that builds credentialing credibility wins. Network effects: more tested engineers attract more companies, which attracts more engineers.

---

### <span style="color: #FF9800">ContextVault — Enterprise Context Management for AI Agents</span>
**Problem:** lean-ctx shows context compression works, but enterprises need more: they need audit trails, access control, compliance, and multi-agent context sharing. Current solutions are either too simple (just compression) or too complex (full vector DB).
**Market:** Enterprises deploying AI agents: Fortune 500 companies (thousands of agents each), regulated industries (finance, healthcare, legal) requiring audit trails. The enterprise agent infrastructure market is $10B+.
**Why now:** As enterprises deploy more agents, context management becomes the bottleneck. Regulations require explainability. Current tools don't meet enterprise needs.
**MVP hint:** A context management platform that: (1) Compresses context using lean-ctx-style techniques (2) Maintains audit logs of what context was used for which decisions (3) Provides role-based access control to context (4) Enables multi-agent context sharing. Self-hosted or SaaS. $50K/year enterprise seat.
**Why this wins long-term:** The "Datadog for agent context" — every enterprise deploying agents needs this. Moat: compliance certifications, enterprise integrations, and context governance expertise.

---

### <span style="color: #FF9800">AgentSOP — Build and Execute Standard Operating Procedures with AI Agents</span>
**Problem:** Companies have Standard Operating Procedures (SOPs) — but they're static documents. AI agents exist, but there's no way to turn an SOP into an executable agent that follows the procedure exactly.
**Market:** Every company with SOPs: banks (AML/KYC procedures), healthcare (clinical workflows), manufacturing (quality control), logistics (fulfillment). The SOP management market is $5B+.
**Why now:** The gap between "documented procedures" and "executed procedures" is massive. AI agents can bridge this, but they need a way to "read" and "execute" SOPs.
**MVP hint:** A platform where users upload SOPs (PDF, Notion, Confluence) and the system converts them into executable agent workflows. The agent follows the exact steps, flags deviations, and reports completion. Integrations with enterprise systems (ticketing, CRM, ERP). $2K/month per SOP workflow.
**Why this wins long-term:** Every company has SOPs that aren't followed. The "AI that follows your procedures" is a massive market. Moat: SOP format parsers, enterprise system integrations, and compliance mapping.
