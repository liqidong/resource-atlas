---
title: Local Deep Researcher
resource_id: res_20260518_local_deep_researcher_e172109
slug: local-deep-researcher
canonical_slug: local-deep-researcher
aliases:
  - Local Deep Researcher
  - ollama-deep-researcher
resource_type: github_repo
source_url: https://github.com/langchain-ai/local-deep-researcher
canonical_source: https://github.com/langchain-ai/local-deep-researcher
local_source: sources/github/langchain-ai__local-deep-researcher/
source_kind: github
source_fingerprints:
  - git:e1721099870bb6169a8b30d11a43e1dd7a7853ab
  - tree-content-sha256:d146229276e6a2a983d1248f36ff59352df87d61d2562092dddb8759c8bee0f5
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: e1721099870bb6169a8b30d11a43e1dd7a7853ab
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: shortlisted
maturity: useful
recommendation: recommended
fit_for_user: high
time_to_value: medium
setup_cost: medium
maintenance_burden: high
risk_level: medium
evidence_quality: high
will_i_actually_use_this: maybe
public_ready: yes
private_notes: no
source_publishable: partial
language: en
redaction_needed: no
tags:
  - local-llm
  - ollama
  - lmstudio
  - langgraph
  - langchain
  - deep-research
  - research-agent
  - web-search
  - iterative-retrieval
  - local-first
  - open-source-template
  - citation-workflow
use_cases:
  - learn-langgraph-research-agent
  - build-local-deep-research-prototype
  - compare-deep-research-tools
recommended_for:
  - 学习 LangGraph 如何表达带循环的研究流程
  - 用 Ollama 或 LM Studio 搭本地优先 deep research 原型
  - 参考 query generation、search、summarize、reflect、follow-up query 的最小实现
not_recommended_for:
  - 完全非技术用户的一键研究产品
  - 需要高可靠引用核验和 benchmark 的生产研究工作流
  - 需要登录网页、动态浏览器操作、私有站点读取或本地文件 RAG 的研究助手
confidence: high
---

# Local Deep Researcher

## Beginner Verdict

- What this is: 一个用 LangGraph 写的本地优先 deep research 原型，把“生成搜索词、搜索网页、总结、反思缺口、继续搜索、输出带来源的报告”做成可视化流程。
- Who should care: 想学习 LangGraph research agent 架构、已经会用 Ollama/LM Studio、想自己搭 deep research 原型的开发者。
- When I should remember it: 当我想看“deep research agent 最小骨架怎么写”，或想用本地 LLM 接 DuckDuckGo/SearXNG/Tavily/Perplexity 做研究循环时。
- Not for: 完全非技术用户、严肃生产研究、需要登录/动态网页/私有资料/强引用核验的场景。
- Setup difficulty: 中等。需要 Python/LangGraph、Ollama 或 LM Studio、本地模型，以及搜索后端配置。
- My verdict: 推荐入库。作为学习和参考模板是 B+；作为日常可靠研究工具只给 C+。

## One-Sentence Summary

Local Deep Researcher 是 LangChain/LangGraph 生态里的本地优先 web research assistant 模板，用本地 LLM 加可配置搜索后端实现迭代检索、摘要、反思和最终 Markdown 报告。

Community signal observed on 2026-05-18: GitHub API reported 9,177 stars, 954 forks, 42 open issues plus PRs, 146 commits, and MIT license.

## What It Is

这是一个小而完整的 LangGraph research agent 示例。它不是 SaaS 产品，也不是完整 browser agent。它的核心是一个 Python LangGraph graph：

1. 根据用户研究主题生成搜索 query。
2. 调用配置的 web search 后端。
3. 汇总搜索结果。
4. 反思当前摘要里的知识缺口。
5. 生成下一轮搜索 query。
6. 循环指定次数。
7. 输出带 sources 的 Markdown summary。

它支持 Ollama 和 LM Studio 托管的本地 LLM，也支持 DuckDuckGo、SearXNG、Tavily 和 Perplexity 搜索。

## What Problem It Solves

它解决的是“我想看一个 deep research agent 怎么拆成可观察、可配置、可替换的节点”。

普通 prompt 只能说“请搜索并总结”。这个项目把流程拆成 LangGraph 节点和状态：query、search、summary、reflection、routing、finalize。对学习 agent 架构的人很有价值。

它不解决“给非技术用户一个稳定、引用严谨、可直接信任的研究产品”。这点要分清。

## Who It Is For

适合：

- 学 LangGraph 的开发者。
- 想搭本地 LLM + web search 研究助手的人。
- 想比较 Ollama / LM Studio / 搜索 API 组合的人。
- 想给自己的工具做研究初筛的人。
- 想理解 iterative retrieval 和 reflection loop 的人。

不适合：

- 不想配置 Python、本地模型、LangGraph server 的用户。
- 需要高质量最终报告和引用核验的人。
- 法律、医疗、投资等高风险研究场景。
- 需要登录网站、动态页面浏览、文件连接器或私有知识库的人。

## How It Works

核心入口在 `langgraph.json`，把 `ollama_deep_researcher` 指向 `src/ollama_deep_researcher/graph.py:graph`。LangGraph 使用 Python 3.11，并从 `.env` 加载配置。

核心节点在 `graph.py`：

- `generate_query`
- `web_research`
- `summarize_sources`
- `reflect_on_summary`
- `finalize_summary`

核心状态在 `state.py`：

- `research_topic`
- `search_query`
- `web_research_results`
- `sources_gathered`
- `research_loop_count`
- `running_summary`

配置在 `configuration.py`：

- `max_web_research_loops`
- `local_llm`
- `llm_provider`
- `search_api`
- `fetch_full_page`
- `ollama_base_url`
- `lmstudio_base_url`
- `strip_thinking_tokens`
- `use_tool_calling`

## How To Use It

基本路径：

1. Clone upstream repo.
2. Copy `.env.example` to `.env`.
3. Start Ollama or LM Studio and load a model.
4. Choose search backend: DuckDuckGo by default, SearXNG/Tavily/Perplexity optional.
5. Run LangGraph dev server.
6. Open LangGraph Studio and submit a research topic.

Mac quickstart from README uses:

```bash
uvx --refresh --from "langgraph-cli[inmem]" --with-editable . --python 3.11 langgraph dev
```

Docker exists, but it only runs the LangGraph service. It does not include Ollama or SearXNG, so local model/search services still need to run separately.

## Source Walkthrough

- `README.md`: positioning, quickstart, search/LLM configuration, compatibility notes, Docker caveat.
- `pyproject.toml`: package name `ollama-deep-researcher`, MIT license, Python and dependencies.
- `langgraph.json`: LangGraph graph entrypoint and environment file.
- `.env.example`: search and LLM provider variables.
- `src/ollama_deep_researcher/graph.py`: graph nodes and routing.
- `src/ollama_deep_researcher/configuration.py`: runtime configuration schema.
- `src/ollama_deep_researcher/utils.py`: search adapters and source formatting.
- `src/ollama_deep_researcher/lmstudio.py`: LM Studio OpenAI-compatible wrapper.
- `Dockerfile`: LangGraph server container, but no bundled Ollama.

Local validation: `python3 -m py_compile /tmp/local-deep-researcher-intake/src/ollama_deep_researcher/*.py` passed.

## What It Can Do Well

- Shows a compact LangGraph implementation of iterative research.
- Makes the research loop visible in LangGraph Studio.
- Supports local LLM providers: Ollama and LM Studio.
- Supports multiple search backends.
- Keeps the code small enough to understand quickly.
- Useful as a starter scaffold for custom research agents.

## Limits And Risks

- “Fully local” is only partly true. The LLM can be local, but DuckDuckGo, Tavily, Perplexity, and full-page fetches use network services. Only SearXNG can be local/self-hosted if configured.
- Local model JSON/tool-calling behavior can be fragile. README notes some models have trouble with required JSON output.
- No test suite was found in the reviewed tree.
- No formal release tags were found.
- The default route condition appears worth reviewing: `research_loop_count` starts at 0, web research increments it, and routing uses `<= max_web_research_loops`, so default 3 may execute one more web research loop than users expect.
- The project does not do browser automation, login, dynamic page exploration, file connectors, or local RAG.
- Prompt injection and malicious web content handling were not clearly addressed in reviewed code.
- It can produce cited summaries, but citation quality was not benchmarked in this intake.

## Similar Resources

- [LangChain Open Deep Research](https://github.com/langchain-ai/open_deep_research): newer and more ambitious LangChain deep research agent, with more providers, MCP support, tests/evaluation hooks, and benchmark positioning. It may supersede this for serious deep research work.
- [OpenAI Deep Research](https://help.openai.com/en/articles/10500283-deep-research-in-chatgpt): hosted ChatGPT product, not local/open-source, but stronger product experience.
- [Perplexity Sonar Deep Research](https://docs.perplexity.ai/docs/sonar/models/sonar-deep-research): API/product direction for deep research, not local-first.
- Browser agents: stronger for dynamic pages and logged-in workflows, but heavier and less deterministic.

## My Judgment

推荐入库，标记为 `shortlisted`。

它对 Resource Atlas 的价值主要是“学习和参考”：看 LangGraph 怎么表达一个 deep research loop，看本地模型和搜索后端怎么接进一个状态图。它不是我会直接信任的最终研究器。

个人使用时，我会把它当作：

1. LangGraph research agent 教材。
2. 本地 LLM + web search 原型。
3. 比较 Open Deep Research、Perplexity、OpenAI Deep Research 时的本地开源基准点。

推荐等级：B+ 作为学习/模板；C+ 作为日常研究工具。

Judgment axes:

- fit for user: high for architecture learning, medium for daily research
- time to value: medium
- setup cost: medium
- maintenance burden: high
- maturity: useful
- evidence quality: high for structure, medium for end-to-end reliability
- risk level: medium

## When To Remember This

- “我想本地跑一个 deep research agent 原型。”
- “我想学 LangGraph 循环、状态、节点和 conditional routing。”
- “我想比较本地 LLM + search API 和 SaaS deep research 的差距。”
- “我想给 Resource Atlas 做自动资料初筛，但最终判断仍要人工或多 agent 复核。”
- “我看到一个项目说 fully local，我要检查它到底哪些部分联网。”

## Open Questions

- `open_deep_research` 是否已经成为更值得主推的 LangChain deep research 资源？
- 默认 `max_web_research_loops` 是否存在 off-by-one 体验问题？
- DuckDuckGo 默认搜索在真实运行中是否稳定，是否会限流？
- 使用本地小模型时，JSON mode 和 tool calling 哪条路径更稳？
- 是否会新增 tests、eval、正式 release 或 prompt injection 防护？
- 最终 summary 的 claims 是否真的被 sources 支撑？

## Source Evidence

- Snapshot manifest: `sources/github/langchain-ai__local-deep-researcher/snapshots/2026-05-18-e172109/manifest.yaml`
- Snapshot summary: `sources/github/langchain-ai__local-deep-researcher/snapshots/2026-05-18-e172109/snapshot.md`
- Upstream commit reviewed: `e1721099870bb6169a8b30d11a43e1dd7a7853ab`
- GitHub API observed on 2026-05-18: 9,177 stars, 954 forks, 42 open issues plus PRs, 146 commits, MIT license.
- Upstream files reviewed: `README.md`, `pyproject.toml`, `langgraph.json`, `.env.example`, `src/ollama_deep_researcher/*.py`, `Dockerfile`, `.github/*`.
- Local validation: `python3 -m py_compile src/ollama_deep_researcher/*.py` passed.

## Evidence Standard

```yaml
evidence_reviewed:
  - file_or_url: README.md
    why_it_matters: Project positioning, quickstart, research loop, compatibility notes, and Docker caveat.
  - file_or_url: pyproject.toml
    why_it_matters: Package name, dependencies, Python requirement, and MIT license.
  - file_or_url: langgraph.json
    why_it_matters: Graph entrypoint and runtime environment.
  - file_or_url: .env.example
    why_it_matters: Search backend and LLM provider configuration.
  - file_or_url: src/ollama_deep_researcher/graph.py
    why_it_matters: Core graph nodes, conditional loop, JSON/tool-calling behavior.
  - file_or_url: src/ollama_deep_researcher/configuration.py
    why_it_matters: Runtime configuration defaults and environment override logic.
  - file_or_url: src/ollama_deep_researcher/utils.py
    why_it_matters: Search backend implementations and full-page fetch behavior.
  - file_or_url: Dockerfile
    why_it_matters: Shows container runs LangGraph service but not Ollama.
  - file_or_url: GitHub API repository metadata
    why_it_matters: Community signal, activity, license, and issue/PR count.
evidence_not_reviewed:
  - item: end-to-end app run
    reason: Requires local Ollama/LM Studio model service and search backend configuration.
  - item: real report quality
    reason: No benchmark or manual research task was run during this intake.
  - item: all open issues and PRs
    reason: API counts and reviewer notes were used; full triage is a separate task.
  - item: prompt injection resistance
    reason: No security test was run against malicious web content.
ran_locally: partial
run_notes: Python syntax compile passed; app was not launched.
license_checked: yes
security_or_privacy_notes: Local LLM support does not make the whole workflow local; search and page fetch can leave the machine.
confidence_limits: High confidence in architecture summary; medium confidence in real-world reliability and research quality.
```

## Update History

```yaml
- date: 2026-05-18
  old_judgment: none
  new_judgment: recommended_with_caveats
  why_changed: First full analysis and intake.
  evidence: README, pyproject, langgraph config, source files, Dockerfile, GitHub API metadata, multi-agent review, py_compile.
  still_true: n/a
  no_longer_true: n/a
  confidence_change: none -> high
  source_ref: e1721099870bb6169a8b30d11a43e1dd7a7853ab
```
