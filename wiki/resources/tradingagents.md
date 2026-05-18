---
title: TradingAgents
resource_id: res_20260518_tradingagents_589b351
slug: tradingagents
canonical_slug: tradingagents
aliases:
  - TradingAgents
  - TradingAgents Framework
  - liqidong/TradingAgents
  - TauricResearch/TradingAgents
  - Multi-Agents LLM Financial Trading Framework
resource_type: github_repo
source_url: https://github.com/liqidong/TradingAgents
canonical_source: https://github.com/TauricResearch/TradingAgents
local_source: sources/github/liqidong__TradingAgents/
source_kind: github
source_fingerprints:
  - git:589b351f2ab55a8a37d846848479cebc810a5a36
  - tree-content-sha256:2c61fb2b650ad76aaeb63798172de118d0f9ea524a59ef1b2c31b7d3bc285cca
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: 589b351f2ab55a8a37d846848479cebc810a5a36
last_checked: 2026-05-18
update_status: fork_stale_parent_current
review_status: reviewed
lifecycle_status: shortlisted
maturity: useful_fast_moving
recommendation: recommended_with_caveats
fit_for_user: medium_high
time_to_value: medium
setup_cost: high
maintenance_burden: high
risk_level: high
evidence_quality: medium_high
will_i_actually_use_this: maybe
public_ready: yes
private_notes: no
source_publishable: partial
language: en
redaction_needed: no
tags:
  - financial-agent
  - ai-trading
  - multi-agent-framework
  - langgraph
  - agent-framework
  - investment-research
  - market-data
  - risk-management
  - open-source-template
use_cases:
  - study-multi-agent-financial-workflows
  - learn-langgraph-financial-agent-architecture
  - evaluate-ai-trading-agent-risk
recommended_for:
  - 学习如何用 LangGraph 组织分析师、研究员、交易员、风控和组合经理等多角色 agent
  - 研究金融 agent 的数据接入、辩论流程、记忆、最终交易提案和 CLI 体验
  - 作为高风险 AI trading 工具的风险边界、评估要求和用户提示案例
not_recommended_for:
  - 真实资金自动交易、投资建议或无需人工复核的买卖决策
  - 只想用用户提供的 liqidong fork 跟进最新上游功能的人
  - 无法配置 LLM/API key、市场数据源、Python 环境和成本控制的用户
confidence: medium_high
---

# TradingAgents

## Beginner Verdict

- What this is: 一个用 LangGraph 组织的多 agent 金融交易研究框架，让基本面、情绪、新闻、技术分析、牛熊研究员、交易员、风控和组合经理围绕同一标的生成交易建议。
- Who should care: 想研究多 agent workflow、金融 agent、LangGraph 状态图、LLM 辩论结构和高风险决策边界的开发者。
- When I should remember it: 当我想看“一个复杂业务域如何拆成多个专门 agent 并串成可运行图”，或想警惕 AI trading 产品该怎么标风险时。
- Not for: 真实资金自动交易、投资建议、低风险生产依赖，或只想跟进最新 upstream 但还停留在 `liqidong` fork 的用户。
- Setup difficulty: 高。需要 Python、LLM provider/API key、市场数据源、成本控制、网络数据访问和较强的人工复核。
- My verdict: 推荐入库，但只作为 architecture/research reference。它的学习价值很高，投资执行价值不能信任。

## One-Sentence Summary

TradingAgents 是 Tauric Research 的多 agent 金融交易研究框架；本次按用户提供的 `liqidong/TradingAgents` fork 审阅，该 fork 停在 `v0.2.2` 相关提交，而父仓库在 2026-05-18 观察时已到 `v0.2.5` 并领先 76 个提交。

Community signal observed on 2026-05-18: the reviewed fork `liqidong/TradingAgents` had 0 stars, 0 forks, no tags, no releases, and issues disabled. Its parent `TauricResearch/TradingAgents` had 76,706 stars, 14,945 forks, 606 subscribers, 344 open issues plus PRs, Apache-2.0 license, GitHub Pages enabled, and latest release `v0.2.5` published on 2026-05-11.

## What It Is

TradingAgents is a Python package and CLI for running a simulated financial trading desk made of specialized LLM agents. The workflow includes:

- analyst agents for market/technical data, social sentiment, news, and fundamentals
- bull and bear researchers that debate the analyst outputs
- a research manager that synthesizes the debate
- a trader that proposes a transaction plan
- aggressive, neutral, and conservative risk debaters
- a portfolio manager that makes the final decision

The implementation uses LangGraph `StateGraph` nodes and conditional edges. It is paired with an arXiv paper, "TradingAgents: Multi-Agents LLM Financial Trading Framework", submitted in 2024 and revised through v7 on 2025-06-03.

Important identity note: the user gave the `liqidong/TradingAgents` fork. That fork is public and reviewable, but it appears to be a snapshot of the parent project rather than the active upstream. The atlas entry keeps the user-provided fork as `source_url` and records `TauricResearch/TradingAgents` as `canonical_source`.

## What Problem It Solves

As a learning resource, it answers: "How can a complex, high-judgment workflow be decomposed into multiple role-specific LLM agents?"

The project is useful because trading naturally stresses an agent system:

- data is noisy and time-dependent
- the task has multiple conflicting interpretations
- there are obvious risk and compliance boundaries
- final decisions should preserve intermediate reasoning
- outputs can look persuasive even when unsupported

TradingAgents makes those tensions visible in code. It is much less useful as a direct trading system, because reliable financial performance needs evaluation, controls, backtesting discipline, latency/data-quality checks, and human accountability far beyond this intake.

## Who It Is For

Good fit:

- Developers studying LangGraph beyond toy examples.
- Agent builders designing role-based workflows with debate and manager nodes.
- People comparing financial AI systems by data boundary, model/provider support, and risk messaging.
- Researchers who want an open-source companion to the TradingAgents paper.
- Builders who need examples of CLI progress display for long-running agent workflows.

Poor fit:

- Non-technical users looking for a dependable trading assistant.
- Anyone planning real-money automated execution.
- Teams that cannot audit LLM prompts, data feeds, API key handling, and provider costs.
- Users who specifically need the latest upstream features but start from the stale `liqidong` fork.

## How It Works

The package exposes a `TradingAgentsGraph` object. On initialization, it creates quick and deep LLM clients from provider-specific wrappers, initializes BM25 financial situation memories, creates LangGraph `ToolNode`s for market/social/news/fundamental tools, and compiles a graph.

The graph flow is roughly:

1. Selected analyst nodes run in sequence and call data tools.
2. Their reports pass to bull and bear researcher nodes.
3. The research manager judges the debate.
4. The trader writes an investment plan.
5. Risk agents debate the plan from aggressive, neutral, and conservative viewpoints.
6. The portfolio manager emits the final trade decision.

Data tools route to yfinance or Alpha Vantage. LLM clients support OpenAI, Anthropic, Google, xAI, OpenRouter, and Ollama-style OpenAI-compatible endpoints in the reviewed fork. The memory layer is BM25-based and local in-process, not an external vector database.

## How To Use It

The README path is:

1. Clone the repo.
2. Create a Python environment.
3. Install with `pip install .`.
4. Set one or more LLM provider keys and, if using Alpha Vantage, an `ALPHA_VANTAGE_API_KEY`.
5. Launch `tradingagents` or run `python -m cli.main`.
6. Select tickers, analysis date, provider, model, research depth, and analysts in the CLI.

The package API centers on:

```python
from tradingagents.graph.trading_graph import TradingAgentsGraph
from tradingagents.default_config import DEFAULT_CONFIG

ta = TradingAgentsGraph(debug=True, config=DEFAULT_CONFIG.copy())
_, decision = ta.propagate("NVDA", "2026-01-15")
print(decision)
```

For actual study, start from the graph setup and agent prompts before running any costly provider calls.

## Source Walkthrough

- `README.md`: project framing, agent roles, CLI usage, provider/API key setup, paper citation, and financial-advice disclaimer.
- `pyproject.toml`: package `tradingagents` version `0.2.2`, Python `>=3.10`, dependency set, and `tradingagents` CLI entrypoint.
- `tradingagents/default_config.py`: default model/provider choices, debate rounds, cache paths, and yfinance/Alpha Vantage vendor routing.
- `tradingagents/graph/trading_graph.py`: orchestration class, LLM client creation, memory setup, tool-node creation, propagation, state logging, and reflection hooks.
- `tradingagents/graph/setup.py`: LangGraph nodes and edges for analysts, researchers, trader, risk debaters, and portfolio manager.
- `tradingagents/dataflows/interface.py`: tool/category/vendor router for stock data, indicators, fundamentals, news, and insider transactions.
- `tradingagents/dataflows/y_finance.py` and `yfinance_news.py`: yfinance-based market and news fetches.
- `tradingagents/dataflows/alpha_vantage_common.py`: Alpha Vantage request helper and API-key boundary.
- `tradingagents/llm_clients/*.py`: provider wrappers for OpenAI-compatible, Anthropic, and Google models.
- `tradingagents/agents/**`: role-specific prompts and node factories.
- `cli/main.py` and `cli/utils.py`: Typer/Rich/Questionary interactive CLI and ticker normalization.
- `tests/test_ticker_symbol_handling.py`: small regression test around exchange suffix preservation.
- `LICENSE`: Apache-2.0.

Sequential intake fallback: this repository's default intake asks for source/structure and value/use-case reviewers. In this session, subagent spawning was not available without explicit user delegation, so the integrator ran those two review passes sequentially and recorded the fallback here.

Source/structure pass result: the reviewed fork is coherent and compiles as Python source under the available Python 3.9.6, despite the package requiring Python `>=3.10`. The upstream parent has moved ahead materially since the fork point, so refreshes should review `TauricResearch/TradingAgents` directly unless the user's fork has new local changes.

Value/use-case pass result: strong fit as a multi-agent architecture and high-risk-domain case study. The right recall posture is "learn from the workflow and caveats", not "trade from the output".

## What It Can Do Well

- Shows a nontrivial LangGraph state machine with many role-specific nodes.
- Demonstrates a financial analyst/researcher/trader/risk-manager separation that maps well to real organizational roles.
- Provides a concrete example of agent debate and manager synthesis.
- Supports multiple LLM providers and an Ollama route for local model experiments.
- Gives a CLI surface for selecting tickers, dates, analysts, depth, provider, and models.
- Uses yfinance by default, with Alpha Vantage support for richer structured data.
- Keeps memory simple through BM25, avoiding vector-store setup for the reviewed version.
- Carries strong public interest through the parent project and associated paper.

## Limits And Risks

- This is a high-risk financial domain. Treat all generated BUY/HOLD/SELL outputs as analysis drafts, not advice.
- The user-provided fork is stale relative to the parent: parent `main` was 76 commits ahead on 2026-05-18 and latest parent release was `v0.2.5`; the reviewed fork had no tags/releases and pointed at `v0.2.2` code.
- Running it is not local-only by default. yfinance/Yahoo, Alpha Vantage, OpenAI, Anthropic, Google, xAI, OpenRouter, and optional Ollama endpoints each have distinct network and privacy boundaries.
- The reviewed `.env.example` lists LLM provider keys but not `ALPHA_VANTAGE_API_KEY`, even though README and Alpha Vantage code require it for that vendor.
- The unit test could not run in the local evidence environment because project dependencies such as `questionary` were not installed.
- There is only one visible test file in the reviewed fork, so runtime behavior and financial correctness are not meaningfully covered by tests.
- Market-data quality, survivorship bias, corporate action handling, delayed data, and news-source quality were not evaluated.
- The LLM outputs can be persuasive without being causally or empirically sound.
- Prompt injection through news or market text was not clearly addressed in the reviewed code.
- Provider model names and API features drift quickly; the parent repo already contains follow-up fixes after the fork point.

## Similar Resources

- [Local Deep Researcher](local-deep-researcher.md): much smaller LangGraph research loop; better for learning iterative retrieval, less useful for role-based debate.
- [OmegaWiki](omegawiki.md): larger Claude Code research workflow OS; useful contrast for persistent research process and source boundaries.
- [CLI-Anything](cli-anything.md): agent-tooling ecosystem; useful if the goal is to expose financial analysis tools through safer command surfaces.
- [FinRobot](https://github.com/AI4Finance-Foundation/FinRobot): another financial LLM/agent project worth future comparison.
- Backtesting frameworks such as Backtrader or Zipline: not agentic, but better references for disciplined strategy evaluation.

## My Judgment

Recommended with caveats.

This is worth keeping because it is a memorable, concrete example of a complex multi-agent application. The domain forces the architecture to include specialized analysts, adversarial viewpoints, manager synthesis, risk debate, state logging, and final decision packaging. That is exactly the kind of pattern Resource Atlas should remember.

But I would not use the reviewed fork as the primary operational source. It is stale versus the parent project, and the whole category is easy to overtrust. The safe use is educational: read the graph, prompts, tool router, CLI, and risk messaging; maybe run a toy analysis with no money attached; then compare against the current parent repo and the paper.

Recommendation grade: A- for studying multi-agent workflow architecture; C for direct trading use; F for unattended real-money decisions.

Judgment axes:

- fit for user: medium-high for agent architecture, low for trading execution
- time to value: medium
- setup cost: high
- maintenance burden: high
- maturity: useful but fast-moving
- evidence quality: medium-high for source structure, low for financial performance
- risk level: high

## When To Remember This

- "我想看一个 LangGraph 多角色 agent 系统怎么拆 node 和 edge。"
- "我想研究 analyst/researcher/trader/risk-manager 这种 role decomposition。"
- "我需要一个高风险 AI 产品的风险提示和证据标准案例。"
- "我想比较金融 agent 的数据边界：LLM provider、market data、news、cache、API key。"
- "我遇到 GitHub fork，要先确认 parent upstream 是否已经大幅领先。"

## Open Questions

- 当前应该重新审 `TauricResearch/TradingAgents@v0.2.5`，还是保留用户 fork 作为个人快照？
- 父仓库新增的 76 个提交是否修复了 provider/API key、model catalog、tests 或风险边界问题？
- 论文中的回测和实验设置能否由开源代码复现？
- 是否有交易成本、延迟、数据泄漏、幸存者偏差和市场冲击等评估？
- 新闻/社媒/网页文本是否有 prompt injection 防护？
- 如果只把它当 LangGraph 教材，哪些节点和 prompt 最值得抽象成通用模板？

## Source Evidence

- Source snapshot: `sources/github/liqidong__TradingAgents/snapshots/2026-05-18-589b351/`
- Reviewed fork commit: `589b351f2ab55a8a37d846848479cebc810a5a36`
- Parent upstream observed ref: `TauricResearch/TradingAgents@61522e103e61601c553b4544abcd53fa7ebf9f1d`
- Content hash: `2c61fb2b650ad76aaeb63798172de118d0f9ea524a59ef1b2c31b7d3bc285cca`
- GitHub API metadata observed on 2026-05-18 for both the reviewed fork and parent repository.
- GitHub compare API observed that parent `main` was 76 commits ahead of the reviewed fork commit.
- arXiv metadata page for `2412.20138` reviewed for title, authors, abstract-level framing, and revision history.
- Local evidence review used a temporary shallow clone and did not retain the upstream source tree.

## Evidence Standard

```yaml
evidence_reviewed:
  - README.md
  - pyproject.toml
  - .env.example
  - tradingagents/default_config.py
  - tradingagents/graph/trading_graph.py
  - tradingagents/graph/setup.py
  - tradingagents/dataflows/interface.py
  - tradingagents/dataflows/y_finance.py
  - tradingagents/dataflows/yfinance_news.py
  - tradingagents/dataflows/alpha_vantage_common.py
  - tradingagents/llm_clients/factory.py
  - tradingagents/llm_clients/openai_client.py
  - tradingagents/llm_clients/anthropic_client.py
  - tradingagents/llm_clients/google_client.py
  - tradingagents/llm_clients/validators.py
  - tradingagents/agents role prompt files
  - cli/main.py
  - cli/utils.py
  - tests/test_ticker_symbol_handling.py
  - LICENSE
  - GitHub API metadata for fork and parent
  - GitHub compare metadata from reviewed fork commit to parent main
  - arXiv metadata page for 2412.20138
evidence_not_reviewed:
  - Full installation with package dependencies
  - End-to-end CLI run with real LLM provider
  - Market data API calls
  - Alpha Vantage paid/free-tier behavior
  - Parent repository source after v0.2.2
  - Paper experiment reproducibility
  - Financial performance claims
  - Security audit of prompt-injection and data-source handling
ran_locally: partial
run_notes: "Python source compile over cli, tradingagents, tests, main.py, and test.py passed under Python 3.9.6 in a temporary clone. The visible unittest failed to import because dependencies such as questionary were not installed locally; full dependency installation and provider/API execution were not attempted."
license_checked: true
security_or_privacy_notes: "Apache-2.0 license. Main safety issue is domain and data boundary: generated trade decisions are not financial advice; yfinance/Yahoo, Alpha Vantage, hosted LLM APIs, OpenRouter/xAI/Google/Anthropic/OpenAI, and optionally Ollama endpoints may receive prompts, tickers, dates, fetched data, or derived analysis. Do not connect to real trading execution without separate controls."
confidence_limits: "High confidence in reviewed fork structure and parent/fork freshness metadata; medium confidence in runtime behavior because dependencies and live providers were not exercised; low confidence in any investment-performance claim."
```

## Update History

- 2026-05-18: Initial full analysis of user-provided `liqidong/TradingAgents@589b351`; added as shortlisted `recommended_with_caveats`, with parent freshness caveat against `TauricResearch/TradingAgents@61522e1`.
