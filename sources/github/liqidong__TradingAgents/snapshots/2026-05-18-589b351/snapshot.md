# Source Snapshot: TradingAgents

- Source reviewed: https://github.com/liqidong/TradingAgents
- Canonical parent observed: https://github.com/TauricResearch/TradingAgents
- Reviewed fork ref: `589b351f2ab55a8a37d846848479cebc810a5a36`
- Reviewed date: 2026-05-18
- Reviewed fork version signal: `main@589b351 / pyproject 0.2.2`
- Parent version signal observed: `main@61522e1 / latest release v0.2.5`
- Parent freshness: parent `main` was 76 commits ahead of the reviewed fork commit.
- Temporary clone size: 9.0M
- Upstream tracked files reviewed from shallow clone: 79
- Python agent files under `tradingagents/agents`: 20
- Visible tests in reviewed fork: 1
- GitHub API observed on 2026-05-18: fork had 0 stars, 0 forks, 0 open issues plus PRs, no tags, no releases, and issues disabled.
- Parent GitHub API observed on 2026-05-18: 76,706 stars, 14,945 forks, 606 subscribers, 344 open issues plus PRs, Apache-2.0 license, Python primary language, GitHub Pages enabled.
- Validation run: Python source compile passed; visible unittest did not run because local dependencies were absent.

## Evidence Files Reviewed

- `README.md`: framework positioning, agent roles, installation, API-key requirements, CLI usage, Python package usage, citation, and financial-advice disclaimer.
- `pyproject.toml`: package metadata, Python `>=3.10`, dependencies, and `tradingagents` CLI entrypoint.
- `.env.example`: LLM provider API-key placeholders.
- `tradingagents/default_config.py`: default provider/model choices, data cache path, debate settings, and data vendor configuration.
- `tradingagents/graph/trading_graph.py`: graph orchestrator, LLM client setup, memory initialization, tool-node creation, propagation, state logging, and reflection methods.
- `tradingagents/graph/setup.py`: LangGraph node and edge construction for analysts, researchers, trader, risk agents, and portfolio manager.
- `tradingagents/dataflows/interface.py`: category and vendor router for yfinance and Alpha Vantage implementations.
- `tradingagents/dataflows/y_finance.py` and `tradingagents/dataflows/yfinance_news.py`: yfinance market and news access paths.
- `tradingagents/dataflows/alpha_vantage_common.py`: Alpha Vantage request and API-key handling.
- `tradingagents/llm_clients/factory.py`, `openai_client.py`, `anthropic_client.py`, `google_client.py`, and `validators.py`: provider support and model validation boundaries.
- `tradingagents/agents/**`: role-specific prompts and node factories.
- `cli/main.py` and `cli/utils.py`: interactive CLI structure, progress display, model/provider selection, and ticker normalization.
- `tests/test_ticker_symbol_handling.py`: exchange suffix preservation regression test.
- `LICENSE`: Apache License 2.0.
- GitHub API metadata for both fork and parent repository.
- GitHub compare API from reviewed fork commit to parent `main`.
- arXiv metadata page for `2412.20138`.

## Key Findings

- The resource is best understood as a multi-agent architecture case study, not a trading product to trust with money.
- The provided `liqidong/TradingAgents` URL is a fork. It appears to preserve the `v0.2.2` parent state from March 2026 and had no separate tags, releases, issues, or community signal at review time.
- The active parent project had moved to `v0.2.5` by 2026-05-18 and was 76 commits ahead, so future refreshes should inspect the parent unless the fork gains unique changes.
- The core architecture is meaningful: analyst agents, bull/bear debate, research manager, trader, risk debaters, and portfolio manager are wired through LangGraph.
- Data boundaries are not local-only. Even with local Ollama models, yfinance/Yahoo or Alpha Vantage can be called for market/news data.
- The README mentions `ALPHA_VANTAGE_API_KEY`, and the Alpha Vantage helper enforces it, but the reviewed `.env.example` only listed LLM provider keys.
- The visible test coverage in the reviewed fork is thin. Compile-only validation passed, but runtime behavior was not exercised.

## Sequential Review Fallback

This repository's default intake asks for source/structure and value/use-case reviewers. In this session, subagent spawning was not available without explicit user delegation, so the integrator ran those two review passes sequentially and recorded the fallback here.

Source/structure pass result: the reviewed fork is coherent and has a readable LangGraph implementation. It is stale against the parent, and its runtime could not be fully validated without installing dependencies and using live providers.

Value/use-case pass result: useful enough for full analysis and shortlisted status because it matches Resource Atlas interests in agent frameworks, LangGraph workflows, multi-agent role decomposition, and high-risk AI decision boundaries. It should not be used for real-money trading decisions.

## Source Retention Decision

Do not commit the full upstream fork for this entry. The source is public and modest, but source refs plus an evidence summary are enough for recall; retaining the full tree would add assets and generated caches without improving the atlas page. Re-fetch the parent repository on refresh.
