---
title: Yao Open Prompts
resource_id: res_20260518_yao_open_prompts_fd1fdf0
slug: yao-open-prompts
canonical_slug: yao-open-prompts
aliases:
  - Yao Open Prompts
  - 姚金刚提示词合集开源版
resource_type: github_repo
source_url: https://github.com/yaojingang/yao-open-prompts
canonical_source: https://github.com/yaojingang/yao-open-prompts
local_source: sources/github/yaojingang__yao-open-prompts/
source_kind: github
source_fingerprints:
  - git:fd1fdf0fa49ee4bf4aedb44842377db57240030c
  - tree-content-sha256:417f0fd54c205d84992a229514f4b1857799a431bda7c8f3e11efb2847afd7f2
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: fd1fdf0fa49ee4bf4aedb44842377db57240030c
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: shortlisted
maturity: useful
recommendation: recommended
fit_for_user: high
time_to_value: low
setup_cost: low
maintenance_burden: low
risk_level: medium
evidence_quality: high
will_i_actually_use_this: yes
public_ready: yes
private_notes: no
source_publishable: partial
language: zh
redaction_needed: no
tags:
  - prompt-library
  - chinese-ai-prompts
  - prompt-engineering
  - content-creation
  - geo-marketing
  - bilingual-prompts
  - resource-library
use_cases:
  - find-practical-ai-prompts
  - study-prompt-library-maintenance
  - build-prompt-resource-library
recommended_for:
  - 快速查找中文实战提示词
  - 学习如何维护结构化提示词库
  - 参考提示词分类、frontmatter、目录生成和质量检查流程
not_recommended_for:
  - 需要可直接安装运行的软件工具
  - 需要严肃评测结果或模型效果基准
  - 想找英文优先的 prompt engineering 教程
confidence: high
---

# Yao Open Prompts

## Beginner Verdict

- What this is: 一个中文优先的开源 AI 提示词库，按真实场景整理了工作、内容、学习、营销、思考等提示词。
- Who should care: 想快速找可复制提示词、研究提示词库结构、或者搭建自己 prompt/resource library 的人。
- When I should remember it: 当我需要“直接拿来试”的中文提示词，或者想参考一个提示词仓库如何做分类、目录、质量检查、双语镜像时。
- Not for: 需要可安装软件、自动评测结果、模型基准、严肃生产质量保证的人。
- Setup difficulty: 低。打开 `CATALOG.md` 或网页导航，复制提示词，替换变量即可。
- My verdict: 推荐入库，尤其适合作为“实战提示词库”和“prompt library 维护样例”。

## One-Sentence Summary

Yao Open Prompts 是一个结构化维护的中文 AI 提示词库，当前收录 117 个中文提示词并提供同路径英文镜像、目录生成脚本、质量检查脚本和维护规范。

Community signal observed on 2026-05-18: GitHub API reported 2,132 stars, 328 forks, 0 open issues, and GitHub Pages enabled at `https://yaojingang.github.io/yao-open-prompts/`.

## What It Is

这是《姚金刚提示词合集》的开源版本。它不是一个模型工具，也不是 agent runtime，而是一个 Markdown 形式的提示词资产库。

仓库的核心资产在 `prompts/` 和 `prompts-en/`：

- `prompts/`：中文提示词，按 9 个一级场景分类。
- `prompts-en/`：英文同步版，和中文目录同路径镜像。
- `CATALOG.md`：全量目录。
- `docs/index.html`：静态网页导航。
- `scripts/`：目录生成、英文 README 生成、仓库检查、网页生成。
- `maintenance/`：分类、评审、发布检查清单。

## What Problem It Solves

很多 prompt collection 的问题是：文件散、没有元数据、没有目录生成、没有质量检查、没有维护规则。这个仓库解决的是“把一批实战提示词变成可以持续维护的公开资源库”。

对个人使用者，它解决的是：不知道从哪里找中文实战提示词。  
对资源库建设者，它解决的是：不知道 prompt library 应该如何分类、写 frontmatter、生成目录和做基础校验。

## Who It Is For

- 中文 AI 用户：想快速找工作、学习、内容、营销类提示词。
- 内容创作者和运营者：AI内容、短视频、公众号、小红书、GEO 营销类提示词较多。
- Prompt library 维护者：可以参考它的模板、目录生成、检查脚本和维护清单。
- 想搭建公开资源库的人：它是一个比普通 awesome list 更有结构的例子。

不太适合：

- 想找“最强提示词工程理论教程”的人。
- 需要经过严格 benchmark 的提示词效果评测的人。
- 想要软件工具、API、CLI 或 agent 框架的人。
- 对英文资源优先的人，虽然它有英文镜像，但项目定位和强项仍是中文场景。

## How It Works

每个提示词文件都有统一 frontmatter，包括标题、分类、子类、来源章节、作者、版本、创建日期、状态和 tags。正文保持简单：标题、简介、Prompt。

仓库通过脚本维持结构：

- `scripts/check_repo.py` 检查 prompt frontmatter、状态枚举、Feishu 样式残留、附件引用，以及中英文文件是否一一镜像。
- `scripts/generate_catalog.py` 根据 frontmatter 生成 `CATALOG.md`。
- `scripts/generate_english_readmes.py` 生成英文目录 README。
- `scripts/generate_webpage.py` 生成网页导航。

这让它不只是“很多 Markdown 文件”，而是一个有轻量维护系统的提示词库。

## How To Use It

1. 打开上游仓库的 `CATALOG.md` 或网页导航。
2. 按场景找提示词，例如 AI内容、AI营销、AI工作、AI方法。
3. 打开对应 Markdown 文件。
4. 复制 `Prompt` 区域。
5. 替换变量、占位符或示例内容。
6. 在目标模型中测试，并根据输出迭代。

如果是学习仓库结构，优先看：

- `README.md`
- `CATALOG.md`
- `templates/prompt-file-template.md`
- `scripts/check_repo.py`
- `maintenance/prompt-review-checklist.md`
- `maintenance/release-checklist.md`

## Source Walkthrough

关键结构：

- `README.md`：说明项目定位、117 个中文提示词、重点推荐、分类统计、使用方式和持续更新机制。
- `CATALOG.md`：全量提示词索引，按分类、子类、标题、状态、主标签列出。
- `prompts/01-ai-methods/`：元提示词、反编译、网页逆向等方法类提示词。
- `prompts/06-ai-content/`：内容创作、短视频、公众号、小红书、图像、PPT 等，是数量最多的分类。
- `prompts/08-ai-marketing/`：GEO/AI 搜索营销提示词，包含机会、原理、内容、信源、数据、增长、风险分组。
- `prompts-en/`：117 个英文镜像文件。
- `maintenance/taxonomy.md`：9 个一级分类说明。
- `CONTRIBUTING.md`：新增提示词、版本规则和评审标准。
- `LICENSE`：提示词内容使用 CC BY 4.0。

本地核验结果：在临时 clone 上运行 `python3 scripts/check_repo.py`，输出 `Checked 234 prompt files. OK`。

## What It Can Do Well

- 快速提供中文实战提示词，不需要安装。
- 覆盖场景广，尤其是 AI内容、AI营销、AI工作。
- 结构比普通提示词列表更可维护。
- 中文和英文镜像完整，方便跨语言传播。
- 有基础质量检查，能发现缺 frontmatter、非法状态、中英文镜像缺失等结构问题。
- 对 Resource Atlas 自身也有启发：它展示了资源库如何用模板、目录生成和检查脚本维持秩序。

## Limits And Risks

- 提示词效果没有严格 benchmark。它能提供可试用模板，但不能保证在所有模型上稳定有效。
- 内容质量可能不均。117 个提示词覆盖面广，深度和实用性需要按具体文件判断。
- 部分领域有风险，例如医疗、金融、法律、未成年人、营销合规。使用时必须人工复核。
- 它是 prompt library，不是 agent workflow 系统。复杂任务仍需要改写、拆步和验证。
- 英文镜像完整，但英文质量未在本次入库中逐条评估。
- 上游处于活跃更新状态，后续刷新时要重点看新增提示词是否保持同样质量。
- GitHub API 对 license 的 SPDX 识别是 `NOASSERTION`，但仓库 `LICENSE` 文件写明提示词内容使用 CC BY 4.0；引用和复用时应按仓库文件署名要求处理。
- 有 24 个中文提示词和对应 24 个英文镜像缺少或留空 `created` 字段；这不影响当前 `check_repo.py` 通过，但说明元数据规范和校验规则还有一点不一致。

## Similar Resources

暂未入库同类资源。未来可比较：

- Awesome prompt collections
- Prompt engineering guides
- OpenAI/Anthropic cookbook-style prompt examples
- 个人 prompt vault / prompt manager 仓库

## My Judgment

推荐入库，并标记为 `shortlisted`。

它的价值不只是“有 117 个提示词”，而是它把提示词库做成了一个可维护资源：分类、frontmatter、目录、检查脚本、双语镜像、贡献规则和发布检查都有基本形态。这对当前 Resource Atlas 很有参考价值。

个人使用层面，我会在两类场景想起它：

1. 需要快速找中文实战提示词，尤其是内容、营销、网页/PPT、学习方法。
2. 想参考一个 prompt library 如何组织和维护。

不应把它当作权威提示词评测库。它更像“高密度可试素材库 + 结构化维护样例”。

推荐等级：B+。值得入库，但需要带风险标注：普通内容和营销 prompt 可以直接试，医疗、法律、金融、未成年人、规避检测、仿写类 prompt 必须人工复核后再用。

Judgment axes:

- fit for user: high
- time to value: low
- setup cost: low
- maintenance burden: low for users, medium for upstream maintainers
- maturity: useful
- evidence quality: high for structure, medium for prompt effectiveness
- risk level: medium

## When To Remember This

- “我想找中文 AI 提示词，先别自己写。”
- “我想看 prompt library 怎么分类、怎么写模板、怎么生成目录。”
- “我想研究 GEO/AI 搜索营销类提示词。”
- “我需要一个提示词合集作为 Resource Atlas 入库样例。”
- “我想比较普通 awesome list 和可维护资源库的差别。”

## Open Questions

- 这些提示词在不同模型上的实际效果如何？本次没有逐条运行评测。
- 英文镜像是否是人工润色还是批量生成？本次只验证了路径和结构。
- 未来新增提示词是否会继续保持 frontmatter 和维护规范一致？
- 是否值得后续抽取其中 5-10 个高价值提示词做单独深评？
- 是否应该把医疗、法律、金融、规避检测、仿写类 prompt 降级为 watch 或单独标高风险？
- `created` 字段是否应被上游 `check_repo.py` 纳入 REQUIRED，或从 README 的“统一 frontmatter”表述中降级？

## Source Evidence

- Snapshot manifest: `sources/github/yaojingang__yao-open-prompts/snapshots/2026-05-18-fd1fdf0/manifest.yaml`
- Snapshot summary: `sources/github/yaojingang__yao-open-prompts/snapshots/2026-05-18-fd1fdf0/snapshot.md`
- Upstream commit reviewed: `fd1fdf0fa49ee4bf4aedb44842377db57240030c`
- GitHub API observed on 2026-05-18: 2,132 stars, 328 forks, 0 open issues, Pages enabled, license SPDX `NOASSERTION`.
- Upstream files reviewed: `README.md`, `CATALOG.md`, `CONTRIBUTING.md`, `LICENSE`, `maintenance/*`, `scripts/*`, representative prompt files.
- Local validation: `python3 scripts/check_repo.py` passed on 234 prompt files.

## Evidence Standard

```yaml
evidence_reviewed:
  - file_or_url: README.md
    why_it_matters: Project positioning, usage flow, category stats, update commands, license/source policy.
  - file_or_url: CATALOG.md
    why_it_matters: Confirms 117 Chinese prompt files and category distribution.
  - file_or_url: scripts/check_repo.py
    why_it_matters: Shows structural validation rules and bilingual mirror checks.
  - file_or_url: scripts/generate_catalog.py
    why_it_matters: Shows catalog generation from prompt frontmatter.
  - file_or_url: templates/prompt-file-template.md
    why_it_matters: Shows standard prompt file shape.
  - file_or_url: maintenance/prompt-review-checklist.md
    why_it_matters: Shows prompt quality review criteria.
  - file_or_url: maintenance/release-checklist.md
    why_it_matters: Shows release process.
  - file_or_url: prompts/01-ai-methods/rtf-meta-prompt-system-v06.md
    why_it_matters: Representative recommended prompt.
  - file_or_url: prompts/08-ai-marketing/README.md
    why_it_matters: Representative category page for GEO marketing prompts.
  - file_or_url: GitHub API repository metadata
    why_it_matters: Community signal, Pages status, GitHub license detection, topics, and activity timestamps.
evidence_not_reviewed:
  - item: all 234 prompt bodies line by line
    reason: Structure and representative samples were reviewed; full prompt quality evaluation is a separate task.
  - item: docs/index.html browser rendering
    reason: Static HTML existence was checked, but no browser rendering QA was run.
  - item: prompt outputs in real models
    reason: No prompt execution benchmark was part of this intake.
  - item: every high-risk prompt for safety wording
    reason: High-risk domains were flagged at category level, not audited prompt by prompt.
ran_locally: yes
run_notes: python3 scripts/check_repo.py passed with "Checked 234 prompt files. OK".
license_checked: yes
security_or_privacy_notes: Prompt content is CC BY 4.0; high-risk prompt domains still require human review before use.
confidence_limits: High confidence in repository structure and maintenance quality; medium confidence in actual prompt effectiveness.
```

## Update History

```yaml
- date: 2026-05-18
  old_judgment: none
  new_judgment: recommended
  why_changed: First full analysis and intake.
  evidence: README, CATALOG, scripts, maintenance docs, representative prompt files, check_repo.py validation.
  still_true: n/a
  no_longer_true: n/a
  confidence_change: none -> high
  source_ref: fd1fdf0fa49ee4bf4aedb44842377db57240030c
```
