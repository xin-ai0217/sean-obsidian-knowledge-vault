1. [Mar 26]## [An Interview with Arm CEO Rene Haas About Selling Chips](https://stratechery.com/2026/an-interview-with-arm-ceo-rene-haas-about-selling-chips/)

## Arm 历史性转型：从 IP 授权到卖芯片

Arm 举办了公司史上第一次独立发布会"Arm Everywhere"，宣布将首次**直接销售自研芯片（Arm AGI CPU）**，这是公司 35 年历史上最大的商业模式转变。

## 为什么要自己卖芯片？

这个决定始于 2025 年中。起因是 **Meta 在评估 CSS（计算子系统）授权时，直接要求 Arm 帮他们做成完整芯片**——Meta 做了 ROI 分析后认为自己做 CPU 的差异化价值不大，不如让 Arm 来。Arm 的条件是可以把同一款芯片卖给其他客户，Meta 同意了。

## CPU 在 AI 时代为什么重要？

Haas 的核心论点：**AI 生成的 token 越多，需要的 CPU 就越多**。GPU 负责生成 token，但 token 的调度、分发、编排都是 CPU 的活。随着 agentic AI 的爆发，每个 CPU 核心可能都在跑一个独立的 agent，所以核心数正在飙升——从 64 核到 128、192 核，未来可能到 256 甚至 512 核。

## 和 Nvidia Vera、x86 的差异化定位

Arm AGI CPU 和 Nvidia Vera 的定位不同：Vera 是专门为 Rubin GPU 配对设计的液冷方案，而 Arm 的首个产品是与 Meta 合作的**更小型风冷机架**，面向更通用的数据中心场景。对比 x86，Haas 的回答很直接：**性能功耗比高 2 倍**，而 x86 的优势基本只剩传统本地部署的遗留软件。

## 供应链的最大瓶颈

出人意料的是，**TSMC 产能不是最大问题，内存才是**。HBM 大量占用内存产能，加上 CPU 需求爆发进一步推高内存需求，Haas 表示如果有更多内存供应，芯片能卖得更多。Arm 选择了标准 DDR 而非 LPDDR，在成本和容量上做了更通用的取舍。

## 风险与组织变革

Haas 坦承做芯片业务引入了全新的风险——库存管理、客户退货、产线问题等都是 IP 授权公司从未面对过的挑战。但他强调团队已有准备，高管团队大量来自 Broadcom、Marvell、Nvidia 等芯片公司背景，运营费用在过去几个季度增长了约 25%。

## 对 AI 泡沫的看法

Haas 不担心 AI 投资是泡沫，但担心**供应链能否跟上**——内存、TSMC 产能、甚至电力涡轮机都可能成为瓶颈。他认为 5-10 年维度看，AI 绝对不是泡沫