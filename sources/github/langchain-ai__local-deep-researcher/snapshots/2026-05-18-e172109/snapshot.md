# Source Snapshot: Local Deep Researcher

- Source: https://github.com/langchain-ai/local-deep-researcher
- Reviewed ref: `e1721099870bb6169a8b30d11a43e1dd7a7853ab`
- Reviewed date: 2026-05-18
- Temporary clone size: 920K
- Upstream files reviewed: 18
- Python files: 7
- Markdown files: 1
- GitHub API observed on 2026-05-18: 9,177 stars, 954 forks, 42 open issues plus PRs, 146 commits.
- License: MIT.
- Validation run: `python3 -m py_compile src/ollama_deep_researcher/*.py` -> `py_compile OK`

## Evidence Files Reviewed

- `README.md`: project positioning, quickstart, model/search configuration, research loop, model compatibility warnings, Docker caveat.
- `pyproject.toml`: package name, dependencies, Python requirement, MIT license.
- `langgraph.json`: graph entrypoint, Python 3.11, `.env` loading.
- `.env.example`: search backend and LLM provider environment variables.
- `src/ollama_deep_researcher/graph.py`: LangGraph nodes, edges, routing, JSON/tool-calling paths.
- `src/ollama_deep_researcher/configuration.py`: configurable fields and environment override behavior.
- `src/ollama_deep_researcher/state.py`: state schema.
- `src/ollama_deep_researcher/utils.py`: DuckDuckGo, SearXNG, Tavily, Perplexity, full-page fetch, and source formatting.
- `src/ollama_deep_researcher/lmstudio.py`: LM Studio OpenAI-compatible wrapper.
- `Dockerfile`: container startup and Ollama external-service requirement.
- `.github/dependabot.yml` and `.github/workflows/docker-image.yml`: maintenance signals.

## Key Findings

- The LLM can run locally via Ollama or LM Studio.
- The search layer is not necessarily local: DuckDuckGo, Tavily, Perplexity, and optional page fetches use network services; only SearXNG can be local/self-hosted if configured that way.
- The core graph is small and readable: generate query, search web, summarize sources, reflect on gaps, route back to search or finalize.
- No test suite was found in the reviewed tree.
- Docker image runs LangGraph service but does not include Ollama or SearXNG.

## Source Retention Decision

Do not commit the full upstream repo for this entry. The project is small and public, but source ref plus evidence summary is enough. Re-fetch upstream when refreshing.
