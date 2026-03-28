# Stratechery Notes

---

## Feb 26, 2026 — [An Interview with Bill Gurley About Runnin' Down a Dream](https://stratechery.com/2026/an-interview-with-bill-gurley-about-runnin-down-a-dream/)

### 关于这本书

Gurley 在 Benchmark 做了 25 年 GP，2020 年退休，最近出版了新书《Runnin' Down a Dream》。这本书**不是回忆录**，而是一本职业指南——帮助人们找到并追逐自己热爱的事业。书中以九个各行各业的成功人物为案例，每个案例对应一条核心原则。

### 书中核心原则

**Chase Your Curiosity（追随好奇心）**：以餐饮家 Danny Meyer 为例。Gurley 自己的轨迹也印证了这一点——从痴迷计算机，到业余研究股票，到进入华尔街，最终落脚硅谷做 VC，每一步都是跟着兴趣走，而非规划出来的。

**Hone Your Craft（打磨手艺）**：以好莱坞经纪人 Lorrie Bartlett 为例。Gurley 认为真正顶尖的人都像工匠一样看待自己的工作——研究领域历史，了解先驱，深入细节和 nuance。

**Develop Mentors（寻找导师）**：以 Bob Dylan 为例。技术让找到导师变得前所未有地容易，在硅谷，主动联系陌生人的回应率远高于好莱坞或华尔街。

**Embrace Your Peers（拥抱同伴）**：Gurley 最喜欢的原则。以一群从器材管理员起步、最终都成为 Division 1 大学体育总监的人为例。他建议找 4-8 个处于相似阶段、最好在公司外部的同行，互相分享信息、网络和情感支持。这种"同伴可能性"（peer possibility）是一种被严重低估的成功因素。

**Go to the Epicenter（去核心地带）**：以发型师 Jen Atkin（后来成为卡戴珊家族御用造型师）为例。如果你知道自己想做什么，就应该去那个领域最集中的地方——纳什维尔做歌手，纽约做广告，硅谷做科技。在那里，导师、同伴、偶发机遇的密度都是其他地方的 10-100 倍。

### Writing 作为杠杆

Gurley 在华尔街时模仿竞争对手创办了传真 newsletter（即后来 Above the Crowd 的前身）。他认为写作有两大价值：**磨练思维**（迫使你真正理解事物，避免逻辑自相矛盾）和**建立网络飞轮**（让你被对的人发现）。他认为 Above the Crowd 基本上已经停更，未来会更多用播客和视频传递想法。

### Uber 风波回顾

2017 年 Gurley 与 Travis Kalanick 的正面冲突。他的反思是：Uber 变得过于庞大，成了一场"有限游戏"（finite game）——要么巨额回报，要么全盘皆输——同时公司在七个方向同时失火（文化调查、伦敦监管、多州 AG 诉讼、与 Google 的专利纠纷、品牌受损导致市场份额流失给 Lyft）。Gurley 坦言，如果自己当时做好了领导力，局面不会走到那一步。Dara Khosrowshahi 接手后，不仅灭火，还将公司带到了 2000 亿市值、每年超百亿自由现金流的位置。

### VC 行业的结构性变化

Gurley 认为 VC 的"工业化"是真实存在的——头部大基金的 AUM 已经媲美 Apollo 等 PE 巨头，通过鼓励公司无限期保持私有来改变游戏规则。他担忧的是：当你在写 5 亿或 10 亿美元的支票时，你的最优秀的人根本没有精力关心早期的 500 万种子轮了。同时，现在大量风险投资是"主动推钱"——成功公司被迫接受融资，导致烧钱速度过快、公司过早被推向成熟，就像 14 岁的孩子被告知自己是国王。

### AI 对 VC 和 SaaS 的影响

Gurley 认为 OpenAI 和 Anthropic 都意识到只做"中间层模型公司"风险太高，所以都在向应用层延伸、直接触达客户——Anthropic 的动作尤其明显，甚至开始与部分最好的客户竞争（如 Cursor）。对于 SaaS 是否已死，Gurley 持保留态度——认为某些系统性软件（如财务账本）短期内无法被替代。他甚至认为，对于那些真正了解 SaaS 价值的投资者，现在可能是历史上最大的 PE 机会之一。

---

## Mar 26, 2026 — [An Interview with Arm CEO Rene Haas About Selling Chips](https://stratechery.com/2026/an-interview-with-arm-ceo-rene-haas-about-selling-chips/)

### Arm 历史性转型：从 IP 授权到卖芯片

Arm 举办了公司史上第一次独立发布会"Arm Everywhere"，宣布将首次**直接销售自研芯片（Arm AGI CPU）**，这是公司 35 年历史上最大的商业模式转变。

### 为什么要自己卖芯片？

这个决定始于 2025 年中。起因是 **Meta 在评估 CSS（计算子系统）授权时，直接要求 Arm 帮他们做成完整芯片**——Meta 做了 ROI 分析后认为自己做 CPU 的差异化价值不大，不如让 Arm 来。Arm 的条件是可以把同一款芯片卖给其他客户，Meta 同意了。

### CPU 在 AI 时代为什么重要？

Haas 的核心论点：**AI 生成的 token 越多，需要的 CPU 就越多**。GPU 负责生成 token，但 token 的调度、分发、编排都是 CPU 的活。随着 agentic AI 的爆发，每个 CPU 核心可能都在跑一个独立的 agent，所以核心数正在飙升——从 64 核到 128、192 核，未来可能到 256 甚至 512 核。

### 和 Nvidia Vera、x86 的差异化定位

Arm AGI CPU 和 Nvidia Vera 的定位不同：Vera 是专门为 Rubin GPU 配对设计的液冷方案，而 Arm 的首个产品是与 Meta 合作的**更小型风冷机架**，面向更通用的数据中心场景。对比 x86，Haas 的回答很直接：**性能功耗比高 2 倍**，而 x86 的优势基本只剩传统本地部署的遗留软件。

### 供应链的最大瓶颈

出人意料的是，**TSMC 产能不是最大问题，内存才是**。HBM 大量占用内存产能，加上 CPU 需求爆发进一步推高内存需求，Haas 表示如果有更多内存供应，芯片能卖得更多。Arm 选择了标准 DDR 而非 LPDDR，在成本和容量上做了更通用的取舍。

### 风险与组织变革

Haas 坦承做芯片业务引入了全新的风险——库存管理、客户退货、产线问题等都是 IP 授权公司从未面对过的挑战。但他强调团队已有准备，高管团队大量来自 Broadcom、Marvell、Nvidia 等芯片公司背景，运营费用在过去几个季度增长了约 25%。

### 对 AI 泡沫的看法

Haas 不担心 AI 投资是泡沫，但担心**供应链能否跟上**——内存、TSMC 产能、甚至电力涡轮机都可能成为瓶颈。他认为 5-10 年维度看，AI 绝对不是泡沫。

---

## Mar 17, 2026 — [An Interview with Nvidia CEO Jensen Huang About Accelerated Computing](https://stratechery.com/2026/an-interview-with-nvidia-ceo-jensen-huang-about-accelerated-computing/)

### 为什么这次 GTC 像一堂历史课？

Huang 花了大量时间回顾 CUDA 和可编程着色器的历史。他的逻辑是：AI agent 即将使用人类的工具（Excel、Photoshop、SQL 数据库等），这些工具都需要被加速。所以 Nvidia 需要把过去 20 年在各行业做加速计算的模式，复制到更多领域。用他的话说，Nvidia 不是 GPU 公司，是**加速计算公司**。

### AI 过去一年的关键突破

Huang 认为核心突破是**推理能力（reasoning）**。生成式 AI 之前幻觉严重，推理能力让 AI 可以被"grounding"——通过反思、检索、搜索来校准输出。这使得 AI 从"提供信息"跨越到"替你做事"，代码生成就是最好的例子。他透露 Nvidia 的软件工程师已经 100% 使用 coding agent，很多人已经很久没有手写代码了。

### CPU 的战略角色：Nvidia 也卖 CPU 了

Huang 强调 Nvidia **从来不是反 CPU 的**，加速计算需要最好的 CPU 来避免拖慢整个系统。随着 agentic AI 爆发，agent 需要使用人类工具，这些工具分两类：数据中心里的 SQL 数据库（需要极速响应），以及个人电脑上的非结构化应用（agent 需要像人一样操作界面）。

Vera CPU 的设计理念和传统云 CPU 不同：传统 CPU 优化的是核心数量（卖实例），而 Vera 优化的是**单线程性能和 I/O 带宽**——每核心带宽是其他 CPU 的 3 倍，因为 CPU 一旦被卡住，后面几百万美元的 GPU 就在空转。

### 收购 Groq：拓展推理能力边界

Nvidia 收购了 Groq 的团队并授权其技术。原因是：在推理的帕累托曲线上，Nvidia GPU 已经能覆盖大部分场景，但在**极低延迟、极高 token 生成速率**这个细分场景上，Groq 的架构可以做得更好。Huang 举了一个很直观的例子：如果 Anthropic 提供一个让编程速度快 10 倍的 Claude Code 高级版，他会毫不犹豫地付费。Groq 就是为这种场景设计的。

这个决策并非因为 OpenAI 与 Cerebras 合作才做出的——Nvidia 从两三年前就在研究推理分解（disaggregated inference），Groq 是"战略巧合"。

### 供应链与稀缺性

Huang 认为当前**所有资源都接近满负荷**——不可能把任何一项翻倍。电力、芯片产能、内存都很紧张。但 Nvidia 的供应链规划做得好，有几百个合作伙伴的长期协议。他最希望的是数据中心的土地、电力和基建能更快到位。

被问到稀缺是否其实对 Nvidia 最有利时（最高效的芯片 + 最充足的供应），Huang 没有否认。

### 中国与"末日论者"

Huang 态度非常明确：**美国技术栈必须留在中国市场**。他指出中国贡献了全球最多的开源软件，50% 的 AI 研究者来自中国，DeepSeek、Kimi、Qwen 都是很强的技术。如果美国技术栈退出中国，当中国的开源技术向全球扩散时，美国的生态系统将无法接收这些创新。

在美国失去 H20 芯片在华销售后，华为反而创下了公司历史最高营收，中国还有五六家 AI 芯片公司上市。Huang 认为美国需要在 AI 的五层架构（电力、芯片、基础设施、模型、应用）上全面领先，而不是把所有层捆绑在一起。

他对"AI 末日论者"在华盛顿的影响力感到非常不满——认为这些人散播恐惧，影响了不懂技术的政策制定者，导致美国公众对 AI 的好感度下降。他警告这种做法可能让美国重蹈欧洲在上一次工业革命中被落下的覆辙。

### Nvidia 的本质

Huang 坚持 Nvidia 永远不会成为解决方案商或服务提供商——公司的定位是**垂直整合开发、水平开放给所有人**。他认为 Nvidia 能保持速度的原因是始终有一个"统一理论"：一边是 CUDA-X 软件平台，一边是计算系统公司，通过极致的跨层协同设计把一切整合起来。
