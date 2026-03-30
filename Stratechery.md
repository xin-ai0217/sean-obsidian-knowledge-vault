# Stratechery Notes — March 2026

> **整理原则**：以 AI 投资人 / 创始人视角提炼关键信息，聚焦技术突破、竞争格局变化与市场机会；弱化轶事与闲聊。关键术语保留英文，重要数字尽量保留原文。跨公司文章在每个相关公司章节下单独出现，但只收录与该公司直接相关的内容。

---

# 🔧 一、HARDWARE: Chips / Semiconductors / Infrastructure

---

## Nvidia

### Jensen Huang and Andy Grove, Groq LPUs and Vera CPUs, Hotel California
*Mar 18, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Jensen%20Huang%20and%20Andy%20Grove%2C%20Groq%20LPUs%20and%20Vera%20CPUs%2C%20Hotel%20California%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/jensen-huang-and-andy-grove-groq-lpus-and-vera-cpus-hotel-california/)*

本文是 Ben Thompson 对 GTC 2026 主题演讲的深度分析，以 Andy Grove（Intel 前 CEO）的战略思想为框架解读 Nvidia 的新布局。

**核心论点：Nvidia 的 "Paranoid Survivor" 策略**

Huang 与 Grove 的相似之处：两者都在行业拐点时认清了"只有偏执狂才能生存"——不能仅靠现有优势，必须主动颠覆自己。Nvidia 在 GPU 市场绝对主导的情况下，同时推进 CPU（Vera）和低延迟推理加速（Groq LPU），填补竞争对手可能的切入点。

**Groq LPU 架构的技术差异化**：
- Groq 的 LPU 使用片上 SRAM（On-die SRAM），在编译时确定所有调度和数据移动，实现极低延迟和高确定性的 Token 生成
- 关键优势：对 LLM Inference 中串行依赖的 Decode 阶段（Auto-regressive generation）处理极为高效
- 历史局限：内存容量受限，需要多颗 Groq 芯片联网工作才能运行大模型

**Vera CPU + Groq LPU 的组合逻辑（Disaggregated Inference）**：
- Vera Rubin（GPU）处理 Prefill 阶段（高度并行，适合 GPU）
- Groq 架构处理 Decode 的 Attention 部分（极低延迟）和 Feed-forward 计算
- Vera Rubin 管理 KV Cache（长上下文推理的关键瓶颈）
- Vera CPU 调度整个 Agentic 工作流（模型调用 + 确定性工具）
- 整个系统形成完整的 Disaggregated Inference 流水线，覆盖从极高吞吐到极低延迟的完整 Pareto Frontier

**"Hotel California" 策略（CUDA 生态护城河）**：
- Groq 收购后，其架构被整合进 CUDA 生态体系，竞争对手无法再以"低延迟 ASIC"为切入点
- 类比 Mellanox 收购：Nvidia 将核心软件栈迁移进 Mellanox 网络芯片，使 NVLink 规模化成为可能
- 结论：一旦进入 CUDA 生态，"You Can Never Leave"——每一个新架构都是 CUDA 延伸，而非替代

**对竞争对手的影响**：
- Cerebras（OpenAI 合作）：晶圆级芯片方案与 Groq 同属低延迟赛道，但 Nvidia 通过收购 Groq 已形成应对
- AMD：在 GPU 上难以逾越 CUDA 护城河；CPU 侧（EPYC）仍有市场但与 Vera 定位不同
- Intel：Gaudi 系列商业化受挫，NVLink Fusion 开放给 Intel x86 意味着 Nvidia 并不需要取代 Intel，而是让 Intel 成为自己体系的附属

---

### Interview with Jensen Huang — Accelerated Computing & Groq Acquisition
*Mar 17, 2026 · Interview · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/An%20Interview%20with%20Nvidia%20CEO%20Jensen%20Huang%20About%20Accelerated%20Computing%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/an-interview-with-nvidia-ceo-jensen-huang-about-accelerated-computing/)*

**定位：不是 GPU 公司，是 Accelerated Computing 公司**

AI 是 **Five-Layer Cake**（Huang 提出的框架）：① Power → ② Chips → ③ Infrastructure → ④ Models → ⑤ Applications。Nvidia 目标是在每一层都建立领先，而非被锁在芯片层。AI Agents 即将调用人类已有的工具（Excel、SQL、Photoshop），这些工具都需要加速，CUDA-X 库的拓展逻辑与此前完全相同。

**Reasoning 是过去一年最关键的技术突破**：
- Generative AI 早期幻觉严重，Reasoning 能力让模型可以做 Reflection、Retrieval、Search，实现了"Grounding"
- 从"提供信息"跨越到"替你做事"——代码生成是最佳验证
- Nvidia 100% 软件工程师已使用 Coding Agents，"很多人已很久没有手写代码"
- 代码生成必须 Compile 并执行，这是比文本生成更高的可验证性门槛，AI 天然适合这类有明确对错的任务

**Vera CPU 的设计理念（关键数字）**：
- 传统云 CPU 优化目标：核心数量（按 Instance 出租），性能次要
- Vera 优化目标：**单线程性能 + I/O 带宽**
- **Vera 的 I/O bandwidth-per-core 是现有任何 CPU 的 3 倍**
- 逻辑：Agent 工具调用时 GPU 在等待 CPU，CPU 成为整个系统的瓶颈；CPU 被拖慢意味着数百万美元的 GPU 在空转

**Groq 收购详情**：
- 收购对象：Groq **团队** + **技术授权**（不含其 Cloud 服务业务）
- 目标场景：极低延迟 + 极高 Token 生成速率（Coding Agent 是核心用例）
- Huang 说："如果 Anthropic 推出让 Coding 速度提升 10 倍的 Claude Code 高级版，我会毫不犹豫付费"
- 非 OpenAI/Cerebras 合作的反应：Nvidia 两三年前已在研究 Disaggregated Inference，Dynamo 发布一年前，与 Groq 接触始于约六个月前
- 类比 Mellanox：将核心计算软件栈整合进专用硬件

**供应链与规模**：
- 1 GW AI 工厂总投资约 **$50–60B**，其中基础设施（土地/电力/外壳）约 **$15–17B**，其余为计算/网络/存储
- 当前整个 AI 供应链"**接近满负荷**"——电力、芯片、内存均无法翻倍
- Nvidia 与"几百个"供应链合作伙伴有长期协议
- 最大瓶颈：数据中心土地、电力、建筑批复速度

**中国 & 出口管制**：
- Huang 立场明确：**美国 Tech Stack 必须留在中国市场**
- 美国限制 H20 后，华为取得公司历史最高营收；同期中国有 5–6 家 AI 芯片公司 IPO
- 中国贡献全球最多开源软件，50% 的 AI 研究者来自中国（DeepSeek、Kimi、Qwen 均有重要贡献）
- AI 是 Five-Layer Cake，每一层都要赢，不能因顶层捆绑而损失底层市场

---

### Anthropic's Skyrocketing Revenue, A Contract Compromise, Nvidia Earnings *(Nvidia 部分)*
*Mar 4, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Anthropic%E2%80%99s%20Skyrocketing%20Revenue%2C%20A%20Contract%20Compromise_%2C%20Nvidia%20Earnings%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/anthropics-skyrocketing-revenue-a-contract-compromise-nvidia-earnings/)*

本文第三部分覆盖 Nvidia Q4 FY2026 财报（截至 2026 年 1 月的季度）。

**关键财报数据**：
- Q4 FY2026 收入：**$68.1B**（+73% YoY，+20% QoQ），超出分析师预期
- FY2026 全年收入：**$215.9B**（+65% YoY）
- Data Center 收入（FY2026 全年）：**$194B**（+68% YoY）
- AI 基础设施需求持续加速，无"触顶"迹象

**Thompson 的解读**：Nvidia 的持续超预期与其 Supply Chain 掌控力直接相关——Nvidia 预先锁定了上游产能，竞争对手和客户无法绕开。当前 AI 支出的主要驱动来自 Agentic AI 带来的 Token 需求指数级增长（每个 Agent 多个步骤，每步多个 Token），直接转化为 GPU/CPU 需求。

---

## Arm

### Interview with Rene Haas — Arm Sells Its First Chip
*Mar 26, 2026 · Interview · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/An%20Interview%20with%20Arm%20CEO%20Rene%20Haas%20About%20Selling%20Chips%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/an-interview-with-arm-ceo-rene-haas-about-selling-chips/)*

**战略转型：IP Licensing → 直接销售芯片**

Arm 在 "Arm Everywhere" 发布会上宣布 **Arm AGI CPU**——公司 35 年来首次直接销售芯片。

**决策时间线**：
- 2023–2024：推出 CSS（Compute Subsystem）产品线，CSS 包含约 **95% 的芯片 IP**，节省客户 **1–1.5 年**设计验证时间
- 2025 年中：Meta 在谈 CSS 授权时提出"能否直接做完整芯片"，Arm 同意，条件是可卖给其他客户
- 决定到发布约 9–12 个月，速度极快（CSS 已验证了大部分 IP）

**Arm AGI CPU vs Nvidia Vera 定位对比**：

| 维度 | Arm AGI CPU | Nvidia Vera |
|------|------------|------------|
| 搭配对象 | 通用数据中心，不绑定特定 GPU | 专为 Rubin GPU 设计，NVLink Fusion |
| 散热方案 | **风冷机架**（首款，与 Meta 合作） | 液冷 256-CPU 机架 |
| 适用场景 | 通用 CPU 市场（Cloudflare、SAP 等） | GPU Companion，最大化 GPU 利用率 |
| 核心数 | **136 核**，路线图含 256/512 核 | 256 核液冷版 |
| 工艺 | TSMC 3nm | TSMC 同代 |
| 内存 | 标准 DDR（优先容量和成本） | LPDDR（优先带宽） |
| vs x86 | **2x 性能功耗比**（Graviton/Cobalt/Axion 均验证） | — |

**CPU 在 Agentic AI 时代的需求爆炸**：
- Token 生成量增加 → Token 调度、分发、编排全是 CPU 任务
- Agentic AI 下每个核心可能运行独立 Agent 或 Hypervisor
- 核心数趋势：64 → 128 → **192**（Graviton 5）→ 256/512（路线图）
- Amazon 云原生新部署 **>50% 已是 ARM 架构**

**供应链瓶颈：Memory 而非 TSMC 产能**：
- TSMC 3nm 产能：通过 ASIC 后端合作伙伴获得，**不是问题**
- **Memory 是主要瓶颈**：HBM 占用内存产能 + CPU 需求爆炸推高 DDR 需求
- 如果内存供应更充足，可以卖更多芯片
- 宏观 CapEx 背景（Haas 引用）：Amazon/Google 各约 **$200B**；Anthropic 在 3–4 个月内营收增加约 **$6B**

**新业务风险与运营变化**：
- 新风险：库存管理、RMA、产线问题——IP 授权公司从未面对的挑战
- OpEx 过去几个季度增长约 **25% YoY**（发布后预计趋缓）
- 高管团队大量来自 Broadcom、Marvell、Nvidia 背景
- 中国约占 Arm **15% 收入**，以 Royalty 为主（小米、阿里、字节、腾讯、比亚迪、小鹏）

---

### Arm Launches Own CPU, Arm's Motivation, Constraints and Systems
*Mar 25, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Arm%20Launches%20Own%20CPU%2C%20Arm%E2%80%99s%20Motivation%2C%20Constraints%20and%20Systems%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/arm-launches-own-cpu-arms-motivation-constraints-and-systems/)*

本文为 Ben Thompson 在 Arm Everywhere 发布后撰写的分析文章，补充了采访中未展开的战略视角。

**ARM 转型的历史逻辑**：
- Arm 的演进路径：IP 授权（ISA）→ 自研核心（Cortex）→ Compute Subsystem（CSS）→ 完整芯片
- 每一步都是在"计算机定义的边界"扩大时，跟随系统层面的价值重心移动
- Thompson 的核心论点：**"The Chip is Not the Product, the System Is"**——Arm 作为 ISA 平台，有义务与软件生态保持更紧密的关系

**Agentic AI 带来的 CPU 需求拐点**：
- 数据中心 CPU 核心密度估算：每 GW 从 **3,000 万核**上升至 **1.2 亿核**（约 4 倍）
- Agents 每次调用产生的 Token 是人类查询的约 **15 倍**
- 这使 CPU 从数据中心的边缘设备变回核心组件

**ARM vs x86 的系统性竞争格局**：
- ARM 在 Cloud-Native 场景上已建立实质优势（Amazon Graviton 2019 年起，Red Hat ARM Production Linux Distro 2018–2019 年）
- x86 护城河剩余在：传统 On-Prem 遗留软件（COBOL 等）
- Nvidia 全面转向 ARM 生态（Grace Hopper → Grace Blackwell → Vera），使数据中心 AI Stack 的 Head Node 已是 ARM 主导

**多供应商策略的形成**：
- Hyperscaler 将并行采购：Nvidia GPU + Arm AGI CPU（通用）+ 自研芯片（差异化）
- 这并非零和竞争，而是 CPU 市场的规模扩张
- Arm 进入芯片市场，意味着客户（如 Cloudflare、SAP）终于有了 ARM 架构的现成服务器可以购买，而此前根本没有这个选项

---

## Apple

### MacBook Neo, The (Not-So) Thin MacBook, Apple and Memory
*Mar 9, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/MacBook%20Neo%2C%20The%20%28Not-So%29%20Thin%20MacBook%2C%20Apple%20and%20Memory%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/macbook-neo-the-not-so-thin-macbook-apple-and-memory/)*

**产品：MacBook Neo（$599）**

| 规格 | MacBook Neo | MacBook Air M5 |
|------|------------|----------------|
| 价格 | **$599** | $1,099 |
| 处理器 | A18 Pro（iPhone 16 Pro 芯片）| M5 |
| 内存 | 8GB | 16GB 起 |
| 屏幕 | 13.0 英寸 | 13.6 英寸 |
| 电池 | 36.5 Wh | 53.8 Wh |

- Apple 首次在 Mac 中使用智能手机芯片，利用 **Binning**（有瑕疵的 A18 Pro 良品筛选）实现低成本
- A18 Pro 芯片面积约为 M 系芯片的 2/3，每块晶圆可出更多芯片，直接降低单位成本

**投资人视角：Cloud AI 使本地硬件商品化**

Thompson 的核心论点：MacBook Neo 拥有"有史以来消费级设备最强大的算力"——不是因为本地芯片，而是因为它可以访问 Claude 和 ChatGPT 客户端。Cloud-based AI 从根本上改变了个人电脑的价值等式：
- 本地内存不再是 AI 能力的决定因素
- 最复杂的推理在云端完成，终端设备只需显示和 I/O
- AI 让 Apple 终于愿意卖"低端产品"（此前 Jobs 时代明确反对）

**对 AI 基础设施的含义**：
- **Thin Client 模型正在验证**：AI 工作负载向云端集中，而非边缘分散
- 这验证了 Nvidia/Arm 在数据中心的投资逻辑，而非 Edge AI 的叙事
- Memory 在所有设备（PC、手机、游戏机）上的价格因 AI 需求而上涨，但 Cloud AI 消解了本地内存的重要性
- AI 让低端设备市场重新有了足够大的价值主张

---

# 💻 二、SOFTWARE: LLM / Hyperscalers / Applications / Media

---

## Anthropic

### Copilot Cowork, Anthropic's Integration, Microsoft's New Bundle *(Anthropic 部分)*
*Mar 10, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Copilot%20Cowork%2C%20Anthropic%E2%80%99s%20Integration%2C%20Microsoft%E2%80%99s%20New%20Bundle%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/copilot-cowork-anthropics-integration-microsoft-bundle/)*

**Anthropic 通过 Microsoft 获得企业分发规模**

- Microsoft Copilot Cowork 基于 **Claude Cowork** 开发（Anthropic 的桌面协作产品）
- M365 Copilot 中增加了 **Claude Sonnet 模型**（此前仅 OpenAI 模型），实现多模型策略
- Anthropic 在微软企业生态中的独特竞争优势：**专有 Harness（编排软件层）**——这是竞争对手暂时无法复制的基础设施层
- Microsoft Work IQ + Claude Cowork 的整合，使 Anthropic 通过 Active Directory 的身份和权限体系直接触及企业数据
- **对 Anthropic 的战略意义**：在不独立建设销售渠道的情况下，获得了 Microsoft 企业关系带来的大规模分发；同时通过 Harness 层维持了差异化

**投资人关注**：
- Anthropic 从 OpenAI 手中分走了部分 Microsoft 平台份额——这是模型商品化竞争的一个缩影
- Harness/编排层是 Anthropic 相对于纯 API 模型公司最可防御的 IP
- Microsoft 的策略是商品化模型（同时引入 OpenAI 和 Anthropic），自己赚平台分发和治理的钱

---

### Interview with Gregory Allen — Anthropic and the U.S. Government
*Mar 5, 2026 · Interview · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/An%20Interview%20with%20Gregory%20Allen%20About%20Anthropic%20and%20the%20U.S.%20Government%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/an-interview-with-gregory-allen-about-anthropic-and-the-u-s-government/)*

*嘉宾：Gregory C. Allen，CSIS Wadhwani AI Center 高级顾问、AI 政策播客主持人*

**Anthropic 与 DoD 合同争议的背景**

- 2025 年 7 月，Anthropic 与 Trump 政府签署合同，拒绝条款包括：国内大规模监控、**无人工监督**的致命自主武器操作（注：Anthropic 支持自主武器的**研发**，仅拒绝无监督的操作部署）
- 2026 年 3 月，DoD/Pentagon 将 Anthropic 列为"Supply-Chain Risk"，威胁引用 Defense Production Act
- Allen 指出：Anthropic 的合同条款实际上比 DoD 在此前数月与竞争对手签署的条款**更为宽松**；Anthropic 还主动删除了攻击性网络战的限制

**核心分析框架：AI 是"计算机类比"还是"核武器类比"？**

Allen 提出两种 AI 发展路径：

**情景 A（计算机类比）**：AI 成为通用技术，从专用应用逐步扩展到所有防务系统（类比 Colossus 密码破解机 → 现代通用计算机，80+ 年演变）

**情景 B（核武器类比）**—— Allen 认为这更值得担忧：
- AI 性能正沿四条并行的"摩尔定律"同步提升：
  1. **芯片性能**：Nvidia 硬件不到 10 年提升 1000 倍
  2. **训练规模**：GPT-3 用约 1 万张 V100；现在部署数百万张 Blackwell
  3. **数据可用性**：互联网规模 + 强化学习
  4. **算法效率**：用同等算力提取更多智能
- 结果：进展可能不是 2-4-8-16（摩尔定律），而是 10-100-1,000-10,000
- **国家安全含义**：当前能力与"战略性变革"AGI/ASI 之间的差距，可能以年而非十年来衡量

**战略威胁案例：NSA 黑客能力**
- NSA 目前拥有约 5,000 名顶级黑客（约 1.5 万总员工中）
- 培养一名世界级黑客需要十年
- AI 理论上可将能力扩展至 **500 万个 AI 增强的等效黑客**
- 这不是生产力提升，而是"战略性地缘政治相关的新能力"

**政府控制的权力逻辑**

Allen 识别的核心矛盾：
- 政府希望对 AI 有完全控制权，但**没有资助 AI 的研发**（不同于核武器从一开始就是政府资金）
- AI 公司规模足够大后，将成为与国家竞争的权力实体（类比 SpaceX/Starlink）

**Starlink 案例（2022 年 9 月）**：
- Elon Musk **未经美国政府同意**，单方面切断了乌克兰军队的 Starlink 服务（正值收复俄占领土的关键时期）
- 乌克兰军队的炮兵瞄准和无人机协调严重依赖 Starlink
- **政府的应对**：签署 $500M+ 合同（Starshield），建立经济杠杆以确保服务连续性
- **对 AI 的含义**：政府必须在 AI 公司拥有不可约束的能力之前建立经济杠杆

**政府-行业合同模式的三种选择**：
1. **Arsenal Model**：政府自建工厂 → 完全控制，成本最高
2. **Own-at-End-of-Life**：私人承包商建造，政府购买后拥有所有权（波音 WGS 卫星模式）
3. **Service Model**：政府购买即服务，提供商保留所有权和控制权（SpaceX Starlink 模式）

Thompson 的观点：**政府不能期待以 Service Model 的价格获得 Arsenal Model 的控制权**。

**自主武器的技术定义（DoD Directive 3000.09）**：
- 自主武器 = "激活后，无需进一步人工干预，自主选择和攻击目标"
- AI 用于目标**识别**不算自主；必须**选择并交战**才算
- 关键更新：俄罗斯军队已在乌克兰战场部署**AI 使能的进攻性致命自主武器**（来自乌克兰情报）

**投资人关键风险点**：
1. **监管/政治风险是真实的**：AI 公司在接近 AGI 能力时面临潜在国家安全控制
2. **先发优势关键**：Anthropic 是美国唯一运营中的分类 LLM 提供商；xAI 有分类服务器合同但尚未运营
3. **权力动态正在转变**：当前政府以经济杠杆谈判；随着 AI 重要性提升，控制将趋于收紧
4. **硅谷-国防关系脆弱**：Allen 警告，妖魔化 Anthropic 会损害科技公司与 DoD 的整体合作关系

---

### Anthropic's Skyrocketing Revenue, A Contract Compromise, Nvidia Earnings *(Anthropic 部分)*
*Mar 4, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Anthropic%E2%80%99s%20Skyrocketing%20Revenue%2C%20A%20Contract%20Compromise_%2C%20Nvidia%20Earnings%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/anthropics-skyrocketing-revenue-a-contract-compromise-nvidia-earnings/)*

**Anthropic 收入爆炸式增长**

| 时间节点 | 年化收入（ARR）|
|---------|--------------|
| 2025 年末 | ~$9B |
| 几周后 | ~$14B |
| 2026 年 3 月初 | **$19B+** |

- 增长主要由 **Claude Code** 的企业端采用和企业订阅驱动
- 根据 Ramp 数据，Anthropic 在 API 支出和企业订阅两个维度上均超越 OpenAI
- Anthropic 在 App Store 排名 **#1**（超越 OpenAI）
- 企业 CTO 更倾向 Anthropic：企业客户对生产力明确付费，消费者不愿意

**竞争格局**：
- Anthropic 有望超过 OpenAI 的 $20B 年化收入（OpenAI 于 2026 年 1 月达到）
- 核心优势：在企业 Coding 场景建立了约 **6 个月的绝对动能领先**
- OpenAI 正在执行"损失控制"——Anthropic 已在政府合同中替代了 OpenAI 的部分位置
- 企业订阅模式 vs. 消费者模式：企业端价值明确（生产力提升），消费者端货币化仍是挑战

**三个 Token 消耗拐点（Thompson 的框架）**：
1. LLM/ChatGPT 普及
2. Reasoning Model（o1 等）
3. **Agentic AI**（当前）——每个 Agent 多步骤 × 每步多 Token，Token 需求指数级"平方"

**政府合同争议（简述）**：
- DoD 将 Anthropic 列为 Supply-Chain Risk 后，双方正朝向妥协方向谈判（明确的合同条款而非无限制访问）
- Dario Amodei 在 Morgan Stanley 会议上的表态：支持负责任的政府合作，但需要边界清晰的合同
- Anthropic 的核心立场：**不是拒绝与政府合作，而是要求明确的合同条款**

---

### Technological Scale and Government Control *(交叉参考)*
*Mar 3, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Technological%20Scale%20and%20Government%20Control%2C%20Paramount%20Outbids%20Netflix%20for%20Warner%20Bros.%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/technological-scale-and-government-control-paramount-outbids-netflix-for-warner-bros/)*

> 📎 完整政策框架分析见「📋 其他 → VC / 政策 / 行业格局」章节。本文为 Gregory Allen 采访（Mar 5）的政策背景文章，直接相关内容已整合入上方采访摘要。

---

### Interview with Bill Gurley *(交叉参考：AI 模型公司策略)*
*Feb 26, 2026 · Interview · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/An%20Interview%20with%20Bill%20Gurley%20About%20Runnin%E2%80%99%20Down%20a%20Dream%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/an-interview-with-bill-gurley-about-runnin-down-a-dream/)*

> 📎 完整 VC 市场与行业分析见「📋 其他 → VC / 政策 / 行业格局」章节。**Anthropic 相关核心判断**：OpenAI 和 Anthropic 都意识到只做"中间层 Model 公司"风险极高，Anthropic 已开始与最好的客户竞争（案例：Cursor 开始研究替代 Anthropic 的模型）。一旦市场进入 Optimization 阶段，开源和低成本替代方案将构成压力。

---

## Microsoft

### Copilot Cowork, Anthropic's Integration, Microsoft's New Bundle *(Microsoft 部分)*
*Mar 10, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Copilot%20Cowork%2C%20Anthropic%E2%80%99s%20Integration%2C%20Microsoft%E2%80%99s%20New%20Bundle%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/copilot-cowork-anthropics-integration-microsoft-bundle/)*

**Microsoft 的多模型平台策略**

- **Copilot Cowork** 发布：基于 Anthropic Claude Cowork，为云端执行版本（vs Claude Cowork 的本地优先版本），整合进 M365
- **M365 Copilot 新增 Claude Sonnet**：打破 OpenAI 独家，实现多模型（OpenAI + Anthropic）策略
- **Work IQ**：有状态 Agent，利用企业身份、权限、通信历史提供跨应用上下文感知任务执行
- 1,500+ 企业客户已在 Azure Foundry 同时使用 Anthropic 和 OpenAI 模型

**Bundle 定价策略（关键数字）**：
- 当前 M365 Copilot：**$30/用户/月**
- 新 E7 Bundle：**$99/用户/月**（较原 E5 旗舰版 +65% 提价）
- E7 包含：Word/Excel/M365 全套 + Copilot + **Agent 365**

**Thompson 的战略分析**：
- Microsoft 的价值捕获在于：**分发 + 合规 + 治理 + 身份（Active Directory）**，而非模型本身
- 模型被商品化（OpenAI 和 Anthropic 都是供应商），Microsoft 赚平台溢价
- **"Thin is In"** 论点：AI 应用将是企业主导、云端集中的（而非本地优先）；Microsoft 的云端 Copilot Cowork 体现了这个赌注
- 未来走向：随着 Agent 替代人类岗位，"按用户收费"模型的可持续性受挑战，Microsoft 正在通过提高 Bundle 价值为转型铺路

**对 AI 投资人的含义**：
- 平台/分发层（Microsoft、云厂商）是 AI 应用层最大的价值聚集点
- 模型提供商面临商品化压力，差异化必须来自垂直整合（如 Anthropic 的 Harness）
- 企业 Agent 平台的竞争将是未来 2–3 年最重要的产品战场

---

## Oracle

### Oracle Earnings, Oracle's Cloud Growth, Oracle's Software Defense
*Mar 11, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Oracle%20Earnings%2C%20Oracle%E2%80%99s%20Cloud%20Growth%2C%20Oracle%E2%80%99s%20Software%20Defense%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/oracle-earnings-oracles-cloud-growth-oracles-software-defense/)*

**财报亮点（Q3 FY2026，截至 2026 年 2 月）**

| 指标 | 数值 | vs 预期/上季 |
|------|------|------------|
| AI Infrastructure 收入 | **$4.9B**（+84% YoY）| 超预期 79%；上季 +68% |
| AI 基础设施交付量 | **400+ 兆瓦** | 90% 按时或提前交付 |
| 资本支出（Q3）| **$18.6B** | 分析师预期 $14B |
| FY2026 CapEx 指引 | **$50B** | — |
| Remaining Performance Obligations（RPO）| **$553B**（+$30B QoQ）| 绝大多数来自 AI 合同 |
| 新签客户自带硬件合同 | **$29B** | 首次采用"客户出资"模式 |
| Multicloud Database 增长 | **+531% YoY** | 最快增长业务 |
| FY2026 全年收入指引 | **$90B** | 超分析师预期 $86.7B |
| AI 基础设施毛利率 | **32%** | 高于指引，上线即盈利 |
| 有机收入增速 | **20%+** | 15+ 年来首次与非 GAAP EPS 同时达到 20%+ |

**核心战略洞察**

**基础设施业务的飞轮**：
- Oracle 在 AI 基础设施业务上实现了"一上线即盈利"（32% 毛利率），这在资本密集型行业极为罕见
- 灵活的基础设施设计 + 高利用率 + 快速客户移交 → 使资本密集业务迅速盈利
- 90% 按时交付率已连续多季度保持，执行力成为真实护城河

**客户自带硬件模式（创新合同）**：
- 部分客户预先提供硬件，Oracle 为其建设并运营数据中心
- 这完全消除了 Oracle 的资本约束，同时锁定了客户（他们的硬件在 Oracle 的系统里）
- $553B RPO 提供了极强的前向收入可见性

**Multicloud Database 爆发（+531% YoY）**：
- Oracle 数据库被部署在 AWS、Google Cloud、Azure 区域内（与超大规模云厂商共存）
- 驱动力：企业将关键业务数据迁移到云端以接入 AI 功能（向量嵌入、Agent 系统需要数据共存）
- MCP Server 访问、Advanced Security 也是驱动因素
- **战略意义**：所有超大规模云厂商都在受益于这波 AI 驱动的数据迁移，Oracle 数据库随数据走

**AI 作为 SaaS 业务的防御武器**（反"SaaS 末日论"）：
- Oracle 用 AI Coding 工具 + 小团队快速构建了三款新 CX 应用（销售线索、销售编排、自动销售）
- AI 没有颠覆 Oracle 的软件业务，而是帮助它扩张到相邻市场
- 使命关键系统（财务/合规/ERP）不会被 AI 替代：审计合规、行业专有集成、几十年的监管数据积累
- Oracle 的护城河：OCI（云）+ Database + ERP + 行业套件 + Agent 层——完整生态系统是差异化

**主要客户**：OpenAI、Meta（两者都是 Oracle 的重要云客户）

---

## 媒体与娱乐

### Interview with Robert Fishman — Current State of Hollywood
*Mar 12, 2026 · Interview · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/An%20Interview%20with%20Robert%20Fishman%20About%20the%20Current%20State%20of%20Hollywood%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/an-interview-with-robert-fishman-about-the-current-state-of-hollywood/)*

*嘉宾：Robert Fishman，MoffettNathanson 高级研究员（媒体/娱乐/体育，20+ 年经验）*

**对 AI 投资人的相关洞察**

AI 对内容产业的实际影响（Fishman 的判断）：
- AI **不会全面颠覆内容**，但会加速内容制作成本降低（视觉效果等）
- AI 将创造"两极分化"：顶级原创内容（因 AI 生产辅助而成本下降但价值维持）VS 长尾内容（成本优势消失）
- **优质内容 IP 仍是可防御的护城河**——AI 商品化生产能力，但不能商品化创意价值

**流媒体竞争格局（AI 视角）**：
- **YouTube**：全球最大媒体公司，UGC + 广告 + YouTube TV 体育聚合 → AI 无法影响其结构性优势
- **Netflix**：230M+ 国际用户，广告业务仍在构建，收购 Warner Bros. 标志着内容规模的进一步扩大
- Netflix 的收购逻辑：确认即使面对 AI 生成内容的威胁，规模化优质 IP（HBO 等）仍然是差异化资产

**关键数字**：
- Netflix 国际用户：**~230M+**
- Paramount 内容支出计划：**$33B/年**（约为 Netflix 的两倍）
- Warner Bros. 交易负债倍数：**6–6.5x EBITDA**
- Paramount 协同效应目标：**$6B**（截至 2029 年，主要来自裁员）

---

# 📋 三、其他 / OTHER: VC / Policy / Industry Trends

---

## VC / 政策 / 行业格局

### Technological Scale and Government Control, Paramount Outbids Netflix for Warner Bros.
*Mar 3, 2026 · Daily Update · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/Technological%20Scale%20and%20Government%20Control%2C%20Paramount%20Outbids%20Netflix%20for%20Warner%20Bros.%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/technological-scale-and-government-control-paramount-outbids-netflix-for-warner-bros/)*

**主题 1：AI 的极端规模必然吸引政府控制**

Thompson 的核心论点：极端技术能力天然吸引国家管控——这是一个分析性结论，不是规范性判断。

**AI vs 核武器的关键区别**：
- 核武器从诞生起就是政府资金（曼哈顿计划，通胀调整后约 **$36B**），政府控制从未被质疑
- AI 完全由私人资本建设（私人云、私人芯片、私人资本），政府想要控制权但没有支付相应对价
- Bob Noyce（Fairchild/Intel 创始人）曾拒绝军事 R&D 资金——原因是接受政府钱意味着交出 IP
- 结果：平民市场规模远大于军事市场，到 1960 年代民用市场已超越军事买家

**1980 年代的历史先例**：
- 美国军队现代化依赖于商业技术（比军事专用技术更先进）
- 采购"现成商业产品"而非定制军事规格成为主导策略
- AI 的逻辑相同：私人驱动的 AI 远比政府项目发展更快

**政府的现实困境**：
- 政府执法权力与 AI 公司的经济权力错配
- "权利最终由某人执行，而那个人正是违反权利的人"——执法者即规则制定者
- 如果 AI 达到 AGI/ASI 并赋予公司国家级权力，政府将在任何时机采取行动（合法或非法）
- **关键结论**：投资人必须评估政府介入 AI 公司的时机和方式

**主题 2：Paramount 收购 Warner Bros.（媒体整合）**
- Paramount Skydance 出价 **$31/股**收购 Warner Bros. Discovery（超越 Netflix 报价）
- 整合后 CapEx 目标：$6B 协同效应（主要来自裁员），截至 2029 年
- 杠杆率：交易完成时约 6–6.5x EBITDA——沉重的债务负担将迫使向 Netflix 授权内容（与长期流媒体战略相悖）

---

### Interview with Bill Gurley — Runnin' Down a Dream *(VC 市场与 AI 影响)*
*Feb 26, 2026 · Interview · [📄 PDF](file:///Users/sxin/Desktop/AI%20/Research/Stratechery/March/oracleearningsoraclescloudgrowthoraclessoftwarede/An%20Interview%20with%20Bill%20Gurley%20About%20Runnin%E2%80%99%20Down%20a%20Dream%20%E2%80%93%20Stratechery%20by%20Ben%20Thompson.pdf) · [🔗 Web](https://stratechery.com/2026/an-interview-with-bill-gurley-about-runnin-down-a-dream/)*

*注：本采访主体为职业发展书《Runnin' Down a Dream》，以下只收录 AI 与 VC 市场相关内容。*

**VC 行业结构性变化（VC Barbell）**

- 头部基金工业化：最大 VC 基金 AUM 已媲美 Apollo 等 PE 巨头，通过鼓励公司无限期保持私有改变行业格局
- **"强制融资"现象**：成功公司被 Mega-Fund 主动推送巨额资金，很多无法拒绝
- 后果：烧钱速度过快，公司过早被推向"成熟"——Gurley 比喻为"14 岁的 Game of Thrones 国王"
- Uber/Lyft 过度融资（各烧超 $2B/年）是这个模式的早期先例，现在几乎每家成功公司都面临

**早期 VC 的生存空间**：
- Gurley 认为专注早期（种子/A 轮）仍可竞争，但最优秀的合伙人精力被分散至后期轮次

**AI 模型公司的战略困境**：
- **中间层危机**：纯模型公司（只卖 API）受到开源模型的持续压力，必须向应用层发展
- Benchmark 的布局：投资了 **Fireworks**（推理优化）和 **Cerebras**（低延迟推理）
- Cerebras 已与 OpenAI 建立合作（Codex 推理加速）——与 Nvidia 收购 Groq 形成直接竞争

**SaaS 的未来与 PE 机会**：
- Gurley 的判断：SaaS 不会"死"，但终值（Terminal Value）大幅压缩——系统性软件（财务/审计）因合规要求不会被替代
- **潜在 PE 机会**：懂行的买家可以低价收购被 AI 恐慌过度压估的 SaaS 公司（削减 SBC、运营改善），这可能是历史上最大的 SaaS PE 并购机会之一

---

# 📊 数据对比表

---

## Table 1：主要 AI 基础模型公司

| 指标 | OpenAI | Anthropic | Google Gemini |
|------|--------|-----------|---------------|
| **ARR / 年化收入** | ~$25B（2026年2月）[¹](https://sacra.com/c/openai/) | ~$19B（2026年3月）[²](https://finance.yahoo.com/news/anthropic-arr-surges-19-billion-151028403.html) | 未单独披露；Google Cloud 年化 >$70B，AI 为主要驱动[³](https://www.businessofapps.com/data/google-gemini-statistics/) |
| **ARR 增速（YoY）** | ~3x（2023→2024→2025 均翻倍+）[¹](https://www.pymnts.com/artificial-intelligence-2/2026/openais-annual-recurring-revenue-tripled-to-20-billion-in-2025/) | +1,167% YoY（2025年初→2026年初）[²](https://www.saastr.com/anthropic-just-hit-14-billion-in-arr-up-from-1-billion-just-14-months-ago/) | Google Cloud Q4 2025 +48% YoY[³](https://www.businessofapps.com/data/google-gemini-statistics/) |
| **关键产品收入** | ChatGPT, Codex[¹](https://sacra.com/c/openai/) | Claude Code ~$2.5B ARR（2026年2月）[²](https://finance.yahoo.com/news/anthropic-arr-surges-19-billion-151028403.html) | Google AI Pro/Ultra 订阅；企业 Gemini 800万+ 付费席位[³](https://www.businessofapps.com/data/google-gemini-statistics/) |
| **估值** | $730B（2026年2月，SoftBank $30B + Nvidia $30B + Amazon $50B）[¹](https://www.pymnts.com/artificial-intelligence-2/2026/openais-annual-recurring-revenue-tripled-to-20-billion-in-2025/) | $380B（$30B Series G）[²](https://techcrunch.com/2025/11/04/anthropic-expects-b2b-demand-to-boost-revenue-to-70b-in-2028-report/) | Alphabet 市值 ~$2T（上市）[³](https://www.businessofapps.com/data/google-gemini-statistics/) |
| **付费用户/客户数** | 企业付费 9M+（2026年2月）；周活 910M[¹](https://sacra.com/c/openai/) | 30万+ 企业客户；财富100强 70% 使用 Claude[²](https://www.saastr.com/anthropic-just-hit-14-billion-in-arr-up-from-1-billion-just-14-months-ago/) | Gemini 月活 7.5亿；企业席位 800万+[³](https://www.businessofapps.com/data/google-gemini-statistics/) |
| **2028 收入预测** | — | $70B（Anthropic 自己的预测）[²](https://techcrunch.com/2025/11/04/anthropic-expects-b2b-demand-to-boost-revenue-to-70b-in-2028-report/) | — |
| **盈利情况** | 预计 2030 年 Cash Flow Positive；2026 年大幅亏损[¹](https://sacra.com/c/openai/) | 大规模烧钱阶段，未披露[²](https://finance.yahoo.com/news/anthropic-arr-surges-19-billion-151028403.html) | Google Cloud 盈利，Gemini 部门亏损未单独披露[³](https://www.businessofapps.com/data/google-gemini-statistics/) |
| **竞争定位** | 最高用户基数；向应用层延伸[¹](https://stratechery.com/2026/an-interview-with-bill-gurley-about-runnin-down-a-dream/) | 企业优先；Claude Code 领先；Harness 编排层差异化[²](https://stratechery.com/2026/copilot-cowork-anthropics-integration-microsoft-bundle/) | 生态护城河（Search+Workspace+Cloud）；TPU 成本优势[³](https://stratechery.com/2026/an-interview-with-nvidia-ceo-jensen-huang-about-accelerated-computing/) |

---

## Table 2：主要 AI 芯片公司

| 指标 | Nvidia | AMD | Arm |
|------|--------|-----|-----|
| **年营收（最新财年）** | $215.9B（FY2026，截至2026年1月）[⁴](https://nvidianews.nvidia.com/news/nvidia-announces-financial-results-for-fourth-quarter-and-fiscal-j0kg9vc0geqr.html) | 全年约 $25.8B（2025日历年）[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | ~$3.96B（FY2025）[⁶](https://stratechery.com/2026/an-interview-with-arm-ceo-rene-haas-about-selling-chips/) |
| **数据中心/AI 营收** | $194B（FY2026，+68% YoY）[⁴](https://nvidianews.nvidia.com/news/nvidia-announces-financial-results-for-fourth-quarter-and-fiscal-j0kg9vc0geqr.html) | Q3 2025 DC季度 $4.3B；2026全年预测 ~$28.7B（+73%）[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | IP Royalty 为主；芯片业务刚起步[⁶](https://stratechery.com/2026/arm-launches-own-cpu-arms-motivation-constraints-and-systems/) |
| **最新季度收入** | Q4 FY2026：$68.1B（+73% YoY, +20% QoQ）[⁴](https://fortune.com/2026/02/25/nvidia-nvda-earnings-q4-results-jensen-huang/) | Q4 2025 预测 ~$9.6B[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | — |
| **毛利率** | ~73–75%（GAAP）[⁴](https://nvidianews.nvidia.com/news/nvidia-announces-financial-results-for-fourth-quarter-and-fiscal-j0kg9vc0geqr.html) | ~53%；DC运营利润率约31%（2026预测）[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | IP授权毛利率极高（>90%）；芯片业务将拉低整体[⁶](https://stratechery.com/2026/an-interview-with-arm-ceo-rene-haas-about-selling-chips/) |
| **市值** | ~$2.7T（2026年3月）[⁴](https://nvidianews.nvidia.com/news/nvidia-announces-financial-results-for-fourth-quarter-and-fiscal-j0kg9vc0geqr.html) | ~$150B[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | ~$110B（NYSE: ARM）[⁶](https://stratechery.com/2026/an-interview-with-arm-ceo-rene-haas-about-selling-chips/) |
| **核心 AI 产品** | Blackwell/Rubin GPU, Vera CPU, NVLink, CUDA, Dynamo, Groq LPU[⁴](https://stratechery.com/2026/an-interview-with-nvidia-ceo-jensen-huang-about-accelerated-computing/) | Instinct MI300/MI350/MI400 GPU；EPYC Turin CPU[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | Arm AGI CPU（TSMC 3nm, 136核）；CSS 产品线[⁶](https://stratechery.com/2026/an-interview-with-arm-ceo-rene-haas-about-selling-chips/) |
| **竞争地位** | AI推理/训练绝对主导；CUDA生态护城河[⁴](https://stratechery.com/2026/jensen-huang-and-andy-grove-groq-lpus-and-vera-cpus-hotel-california/) | 第二大AI GPU玩家；EPYC抢占x86 CPU份额[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | CPU ISA标准制定者（全球99%移动芯片）；DC CPU新进入者[⁶](https://stratechery.com/2026/arm-launches-own-cpu-arms-motivation-constraints-and-systems/) |
| **主要客户** | 全部主要Cloud；OpenAI、Anthropic 等模型公司[⁴](https://stratechery.com/2026/an-interview-with-nvidia-ceo-jensen-huang-about-accelerated-computing/) | Meta（MI300X大规模部署）；微软、Google[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | Meta（AGI CPU首个客户）；Amazon Graviton、Google Axion、Microsoft Cobalt（CSS授权）[⁶](https://stratechery.com/2026/an-interview-with-arm-ceo-rene-haas-about-selling-chips/) |
| **关键技术差异** | 最高Token吞吐；NVLink；CUDA生态；Vera CPU 3x I/O带宽/核[⁴](https://stratechery.com/2026/an-interview-with-nvidia-ceo-jensen-huang-about-accelerated-computing/) | 性价比优势；EPYC拿下大量Intel份额；MI400 2026年起量[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | 2x性能功耗比 vs x86；软件迁移门槛降低；新进芯片市场，执行风险高[⁶](https://stratechery.com/2026/arm-launches-own-cpu-arms-motivation-constraints-and-systems/) |
| **AI 战略动向** | 收购Groq（团队+技术授权）；开源Nemotron；AI Factory全栈[⁴](https://stratechery.com/2026/jensen-huang-and-andy-grove-groq-lpus-and-vera-cpus-hotel-california/) | MI400 2026年关键出货；2030年DC收入目标$100B[⁵](https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/03/amd-s-next-generation-ai-chips-set-to-power-2026-data-center-growth) | Arm Everywhere战略；芯片收入单独披露；液冷AGI CPU路线图[⁶](https://stratechery.com/2026/arm-launches-own-cpu-arms-motivation-constraints-and-systems/) |
