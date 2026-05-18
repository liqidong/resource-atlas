---
title: OmegaWiki
resource_id: res_20260518_omegawiki_1fd1e58
slug: omegawiki
canonical_slug: omegawiki
aliases:
  - omegawiki
  - OmegaWiki
  - ΩmegaWiki
  - skyllwt/OmegaWiki
  - LLM-Wiki research platform
resource_type: github_repo
source_url: https://github.com/skyllwt/OmegaWiki
canonical_source: https://github.com/skyllwt/OmegaWiki
local_source: sources/github/skyllwt__OmegaWiki/
source_kind: github
source_fingerprints:
  - git:1fd1e5856e09e5ccc36d31845af201351f8a3413
  - tree-content-sha256:5d59f05ca57beacb40cd0793c17c17ce5d7c77b99931dc5eea5e603b560c5684
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: 1fd1e5856e09e5ccc36d31845af201351f8a3413
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: shortlisted
maturity: useful
recommendation: recommended_with_caveats
fit_for_user: high
time_to_value: high
setup_cost: high
maintenance_burden: high
risk_level: high
evidence_quality: medium_high
will_i_actually_use_this: yes
public_ready: yes
private_notes: no
source_publishable: partial
language: bilingual
redaction_needed: no
tags:
  - claude-code
  - agent-skills
  - research-wiki
  - paper-ingestion
  - knowledge-graph
  - research-automation
  - academic-writing
  - experiment-tracking
  - arxiv
  - semantic-scholar
  - deepxiv
  - local-web-ui
  - github-actions
  - obsidian
  - open-source-template
use_cases:
  - study-claude-code-research-workflows
  - build-research-wiki
  - automate-paper-discovery
recommended_for:
  - 研究 Claude Code skill 如何组织长流程、可验证的学术工作流
  - 参考持久 wiki、typed graph、paper ingest、idea/experiment/paper writing 的一体化设计
  - 给 Resource Atlas、研究助手或知识库项目借鉴 schema、日志、验证器、source boundary 设计
not_recommended_for:
  - 想要零配置论文总结器或普通 citation manager
  - 需要纯本地、离线、私密的研究资料处理工具
  - 不愿给 agent 广泛文件/网络/命令权限或不使用 Claude Code 的用户
confidence: high
---

# OmegaWiki

## Beginner Verdict

- What this is: 一个 Claude Code 驱动的研究工作流平台，把论文摄入、结构化 wiki、知识图谱、论文发现、idea/experiment 生命周期、写作、rebuttal 和 poster 生成做成一组 agent skills。
- Who should care: 想研究“持久研究记忆 + agent 工作流 + schema/lint/log 验证”的开发者，尤其是已经使用 Claude Code 的研究者。
- When I should remember it: 当我想看一个比单次 RAG/论文总结更完整的 research OS 怎么拆分 skill、runtime schema、wiki entity 和自动化时。
- Not for: 零配置论文阅读、普通引用管理、纯本地私密资料处理，或不愿给 agent 广泛权限的场景。
- Setup difficulty: 高。需要 Python、Node、Claude Code、API key 判断，并理解哪些流程会修改 wiki/raw、跑 CI 或调用外部服务。
- My verdict: 推荐入库，但必须带 caveats。作为 Claude Code 研究工作流架构样本是 A-；作为可以放心直接丢私密研究资料进去的成熟产品只给 B-/C+。

## One-Sentence Summary

OmegaWiki 是一个以持久 wiki 为中心的 Claude Code research OS，用一组 skill 和 Python 工具把论文、概念、方法、idea、实验、写作与自动推荐串成可积累的研究记忆系统。

Community signal observed on 2026-05-18: GitHub API reported 683 stars, 104 forks, 9 subscribers, 1 open issue, 0 open PRs, MIT license, and no GitHub release objects. `CHANGELOG.md` records version `1.4.0` on 2026-05-18.

## What It Is

OmegaWiki 是 DAIR Lab / PKU 团队开源的 Claude Code 工作流集合。它把 Andrej Karpathy 提到的 LLM-Wiki 思路扩展成完整的学术研究平台：用户把 `.tex`、`.pdf`、笔记或网页放进 `raw/`，然后通过 Claude Code slash commands 建立和维护 `wiki/`。

它的核心不是一个单独脚本，而是一整套约束：

- `.claude/skills/`：agent 行为层，包含 setup、init、ingest、discover、daily-arxiv、ideate、novelty、review、experiment、paper writing、poster 等流程。
- `runtime/schema/`：wiki entity、edge、xref、convention 的结构契约。
- `tools/`：确定性 Python 工具，处理 slug、lint、paper fetch、Semantic Scholar、DeepXiv、daily arXiv、local web UI、poster 转换等。
- `wiki/`：产出的持久知识库。
- `raw/`：用户拥有的论文、笔记、网页输入，以及工具生成的 discovered/tmp handoff。

## What Problem It Solves

它解决的问题是“研究知识不要每次从零开始问 RAG 或聊天窗口”。OmegaWiki 把论文和研究过程落到可追踪的页面、实体、图边、日志和验证器里，让后续的 idea generation、novelty check、experiment design、paper draft 都能复用同一份知识状态。

对 Resource Atlas 来说，它尤其值得记住：它和本仓库一样强调 source of truth、可读分析页、证据边界、日志和验证，只是 OmegaWiki 把规模推到了学术研究全生命周期。

## Who It Is For

适合：

- 已经使用 Claude Code，并愿意让 agent 读写项目文件的研究者。
- 想搭一个论文/idea/experiment/wiki 复利系统的人。
- 想研究 Claude Code skill 设计、parallel ingest、human gates、验证器和工作流边界的开发者。
- 想借鉴本地 web UI + Obsidian wikilink + typed graph 的知识库设计的人。

不适合：

- 只想要“总结这篇论文”的轻量工具用户。
- 只需要 Zotero/Obsidian 模板/普通 citation manager 的用户。
- 要求完全离线、完全本地、无外部 LLM/API 的私密研究资料处理。
- 不愿意审查 agent 生成内容、权限范围、CI 写回行为的人。

## How It Works

最小路径是：

1. 安装 Claude Code，登录 Claude。
2. 运行 `setup.sh` 或 `setup.ps1` 创建环境并同步配置。
3. 把论文或笔记放进 `raw/papers/`、`raw/notes/`、`raw/web/`。
4. 在 Claude Code 中运行 `/init [topic]` 或针对单篇论文运行 `/ingest`。
5. 使用 `/discover`、`/daily-arxiv`、`/ideate`、`/novelty`、`/exp-design`、`/paper-draft` 等流程继续推进研究。

底层数据模型是 9 类 wiki entity：papers、concepts、topics、people、ideas、experiments、methods、Summary、foundations。语义关系写入 `wiki/graph/edges.jsonl`，文献引用单独写入 `wiki/graph/citations.jsonl`。页面使用 Obsidian 风格 `[[wikilink]]`。

## How To Use It

把它当工具使用时，先从低风险路径开始：

1. 用公开论文或测试资料创建一个新 clone。
2. 运行 setup，不要马上接入私密论文或远程 GPU。
3. 先试 `/init` 或 `/ingest`，再跑 `/check`/`tools/lint.py` 看结构质量。
4. 只在理解 `.github/workflows/daily-arxiv.yml` 和 secrets 后启用 GitHub Actions。
5. 只在理解 remote helper 的 SSH/rsync/screen 行为后使用远程实验能力。

把它当参考架构使用时，优先看：

- `runtime/schema/entities.yaml`
- `tools/lint.py`
- `.claude/skills/ingest/SKILL.md`
- `.claude/skills/init/SKILL.md`
- `.claude/skills/daily-arxiv/SKILL.md`
- `tools/serve.py`

## Source Walkthrough

- `README.md`: 定位、quick start、API key、skills、wiki entity、automation、bilingual support 和 `/poster` 最新说明。
- `CHANGELOG.md`: `1.4.0`、`1.3.0`、`1.1.0`、`0.1.0` 变更历史。
- `CLAUDE.md`: runtime contract、硬规则、owner zones、schema/policy 入口。
- `runtime/schema/entities.yaml`: papers、concepts、topics、people、ideas、experiments、methods、Summary、foundations 的字段契约。
- `.claude/skills/ingest/SKILL.md`: 单篇论文进入 wiki、graph、citations 的主流程。
- `.claude/skills/init/SKILL.md`: 多来源 bootstrap、discovery、parallel ingest、fan-in 验证。
- `.claude/skills/daily-arxiv/SKILL.md`: 每日论文推荐、GitHub Actions setup、inform/auto-ingest 边界。
- `.claude/skills/novelty/SKILL.md`: 多源 novelty check 和可选写回。
- `.claude/skills/poster/SKILL.md`: `1.4.0` 新增的 academic poster 生成流程。
- `tools/serve.py`: 绑定 `127.0.0.1` 的本地 SPA/API，并明确不替用户直接执行 slash skills。
- `tools/lint.py`: 结构验证器。
- `.github/workflows/daily-arxiv.yml`: 每日推荐和可选 auto-ingest 的 CI 编排。
- `.env.example` / `config/setup-guide.md`: 外部服务和 key 的边界。
- `config/settings.local.json.example`: 示例权限很宽，包括 `Bash(*)`、`Read(*)`、`Edit(*)`、`WebSearch`、`WebFetch(*)`、`MCP(*)`。

## What It Can Do Well

- 把研究记忆做成持久 wiki，而不是一次性回答。
- 把 paper、concept、method、idea、experiment、topic 分成明确实体。
- 用 schema、lint、log、graph/citation 文件降低 agent 写错结构的概率。
- 把 `/ingest`、`/init`、`/daily-arxiv` 这类复杂流程写成可复用 skill。
- 支持中英双语说明和 skills。
- 提供本地 web UI 与 Obsidian graph 视角。
- 把 paper discovery、novelty review、experiment lifecycle、paper writing、poster 生成都放进同一知识上下文。

## Limits And Risks

- 不是纯本地。核心 LLM 运行依赖 Claude Code/Anthropic 协议或兼容服务；可选路径还会调用 Semantic Scholar、DeepXiv、arXiv、Paper Copilot、Wikipedia、SMTP、OpenAI-compatible reviewer、GitHub Actions 和远程 SSH/GPU。
- 权限面很宽。示例 Claude settings 允许 Bash、Read、Edit、WebSearch、WebFetch 和 MCP，适合 agent 项目但需要用户理解风险。
- 自动化会修改 durable files。`/daily-arxiv` 的 `auto-ingest` 和 GitHub Actions 可以在显式配置后写回 wiki/raw 并 push。
- 内容质量没有在本次 intake 中端到端验证。未用真实论文跑 `/init`/`/ingest`/`/paper-draft`。
- 测试可见度有落差：`CHANGELOG.md` 提到早期 2,125 tests，但本次浅层 review 只看到 `.sleepcode/tests/test_discover_from_venue.py` 这 20 个 unittest。
- README 的 skill 数量可能滞后：页面仍说 24 slash commands，但 reviewed tree 有 26 个 skill directories。
- 私密研究、未公开论文、reviewer comments、远程实验 credentials 进入这个系统前应做单独安全审查。

## Similar Resources

- [Local Deep Researcher](local-deep-researcher.md): 更小的 LangGraph deep research loop 示例；适合学 research agent 最小骨架，但不像 OmegaWiki 覆盖完整研究生命周期。
- Obsidian research vaults: 更轻、更本地，但没有 OmegaWiki 这种 agent skill 编排和 schema/lint 层。
- 普通 RAG notebook / paper QA 工具: 上手更快，但知识不一定持久化为可维护实体图。
- Hosted deep research products: 体验更成熟，但不可直接学习其内部 workflow architecture。

## My Judgment

推荐入库，标记为 `shortlisted`，但推荐语必须是 `recommended_with_caveats`。

OmegaWiki 对我的价值主要不是“今天就拿来处理全部私密研究”，而是作为一个足够具体、足够野心大的 Claude Code research OS 样本。它展示了怎样把 agent workflow 写成 durable contract：用户拥有 `raw/`，agent 产出 `wiki/`，schema 约束结构，validator 负责收尾，CI 可以做 daily recommendation，local UI 只生成可复制 slash command 而不是偷偷走另一条逻辑。

我会把它当作：

1. Claude Code skill 设计案例。
2. 研究 wiki / typed graph / validation architecture 参考。
3. Resource Atlas 未来自动 intake、provenance、use-case graph 的启发来源。
4. 研究自动化边界审查样本：哪些部分本地，哪些部分会联网，哪些地方会写回。

推荐等级：A- 作为架构参考；B- 作为可直接采用的研究平台；C+ 作为非技术/低配置用户工具。

## When To Remember This

- “我想看 Claude Code skills 如何组织一个完整研究系统。”
- “我想把论文、idea、实验、写作都变成可积累的 wiki 状态。”
- “我想给 Resource Atlas 借鉴 schema、manifest、validator、log、human gate 的设计。”
- “我想比较 RAG、Obsidian、agentic research wiki 和 hosted deep research 的差异。”
- “我看到一个研究工具声称 full lifecycle，要检查它的权限、外部 API 和写回边界。”

## Open Questions

- 真实论文端到端 `/init`/`/ingest` 的幻觉率、结构准确率和人工修订成本如何？
- 26 个 skill directories 与 README 的 24 skills 计数后续是否会校准？
- `1.4.0` 只写在 changelog，GitHub releases API 没有 release object，后续是否会正式发 release？
- 私密论文和未公开研究进入 Claude Code/CI/外部 API 流程前，是否需要更细的 redaction/profile 模式？
- `config/settings.local.json.example` 的宽权限是否适合普通用户默认采用？
- 可见测试是否会公开扩展，尤其是 ingest、graph consistency、poster、daily-arxiv 和 remote experiment 路径？

## Source Evidence

- Snapshot manifest: `sources/github/skyllwt__OmegaWiki/snapshots/2026-05-18-1fd1e58/manifest.yaml`
- Snapshot summary: `sources/github/skyllwt__OmegaWiki/snapshots/2026-05-18-1fd1e58/snapshot.md`
- Upstream commit reviewed: `1fd1e5856e09e5ccc36d31845af201351f8a3413`
- Changelog version reviewed: `1.4.0` dated 2026-05-18.
- GitHub API metadata observed on 2026-05-18.

## Evidence Standard

```yaml
evidence_reviewed:
  - README.md
  - CHANGELOG.md
  - CLAUDE.md
  - runtime/CLAUDE.md
  - runtime/schema/entities.yaml
  - .claude/skills/ingest/SKILL.md
  - .claude/skills/init/SKILL.md
  - .claude/skills/daily-arxiv/SKILL.md
  - .claude/skills/novelty/SKILL.md
  - .claude/skills/poster/SKILL.md
  - tools/serve.py
  - tools/lint.py
  - tools/discover.py
  - tools/fetch_s2.py
  - tools/fetch_deepxiv.py
  - .github/workflows/daily-arxiv.yml
  - .env.example
  - config/setup-guide.md
  - config/settings.local.json.example
  - .sleepcode/tests/test_discover_from_venue.py
  - LICENSE
evidence_not_reviewed:
  - Did not run setup.sh or setup.ps1.
  - Did not install all Python dependencies or launch Claude Code.
  - Did not run slash commands end to end on real papers.
  - Did not run the local web UI in a browser.
  - Did not verify live Anthropic, Semantic Scholar, DeepXiv, SMTP, OpenAI-compatible, GitHub Actions, or SSH/GPU integrations with credentials.
  - Did not inspect every skill file line by line.
ran_locally: partial
run_notes: "Temporary clone reviewed. py_compile over tools/*.py passed. Venue discovery unittest file ran 20 tests and passed. tools/lint.py was not run to completion because PyYAML was not installed in the inspection Python environment."
license_checked: "MIT in GitHub API and local LICENSE file."
security_or_privacy_notes: "Not local-only. External LLM/API/search/email/CI/SSH paths exist; sample Claude Code permissions are broad; use private research data only after separate boundary review."
confidence_limits: "High confidence for repository structure and workflow design; medium confidence for real-world output quality because no end-to-end research run was performed."
```

## Update History

- 2026-05-18: Initial full analysis from `skyllwt/OmegaWiki@1fd1e58` using multi-agent source/value review. Added as `recommended_with_caveats`.
