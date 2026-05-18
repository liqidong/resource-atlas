# Resource Atlas

Personal knowledge base for analyzing useful AI resources: GitHub repositories, tools, workflows, packages, articles, and agent-skill artifacts.

This repo is not a bookmark list. Each durable entry should answer:

- What is this resource?
- What problem does it solve?
- When should I remember it?
- Is it actually worth using later?
- What source evidence supports the judgment?

## Current Library

| Resource | Type | Verdict | Best For |
| --- | --- | --- | --- |
| [Yao Open Prompts](wiki/resources/yao-open-prompts.md) | GitHub repo | Recommended | Practical Chinese prompt library, prompt collection structure, GEO/content prompt examples |
| [Local Deep Researcher](wiki/resources/local-deep-researcher.md) | GitHub repo | Recommended with caveats | Learning LangGraph research loops, local LLM research prototypes, search summarization architecture |
| [agentmemory](wiki/resources/agentmemory.md) | GitHub repo | Recommended with caveats | Persistent memory for coding agents, MCP/hooks integration, local-first recall architecture |
| [OmegaWiki](wiki/resources/omegawiki.md) | GitHub repo | Recommended with caveats | Claude Code research OS, persistent research wiki, paper discovery and academic writing workflows |
| [UI-TARS Desktop](wiki/resources/ui-tars-desktop.md) | GitHub repo | Recommended with caveats | GUI/computer-use agent architecture, desktop/browser operators, VLM action loops, MCP/browser infra |
| [MinerU](wiki/resources/mineru.md) | GitHub repo | Recommended with caveats | Parsing PDFs, scanned docs, images, and Office files into Markdown/JSON for RAG and agent workflows |
| [Architecture Diagram Generator](wiki/resources/architecture-diagram-generator.md) | Agent skill | Recommended with caveats | Fast dark-theme HTML/SVG architecture diagrams, Claude custom skill packaging, technical documentation visuals |

## Use-Case Entrypoints

- [Find practical AI prompts](wiki/use-cases/find-practical-ai-prompts.md)
- [Study prompt library maintenance](wiki/use-cases/study-prompt-library-maintenance.md)
- [Build a prompt resource library](wiki/use-cases/build-prompt-resource-library.md)
- [Learn LangGraph research agent architecture](wiki/use-cases/learn-langgraph-research-agent.md)
- [Build a local deep research prototype](wiki/use-cases/build-local-deep-research-prototype.md)
- [Compare deep research tools](wiki/use-cases/compare-deep-research-tools.md)
- [Build an agent memory layer](wiki/use-cases/build-agent-memory-layer.md)
- [Compare agent memory systems](wiki/use-cases/compare-agent-memory-systems.md)
- [Study agent hooks and MCP memory](wiki/use-cases/study-agent-hooks-and-mcp-memory.md)
- [Study Claude Code research workflows](wiki/use-cases/study-claude-code-research-workflows.md)
- [Build a research wiki](wiki/use-cases/build-research-wiki.md)
- [Automate paper discovery](wiki/use-cases/automate-paper-discovery.md)
- [Learn GUI agent architecture](wiki/use-cases/learn-gui-agent-architecture.md)
- [Build a computer-use agent](wiki/use-cases/build-computer-use-agent.md)
- [Compare computer-use agents](wiki/use-cases/compare-computer-use-agents.md)
- [Parse documents for RAG](wiki/use-cases/parse-documents-for-rag.md)
- [Build a local document parsing pipeline](wiki/use-cases/build-local-document-parsing-pipeline.md)
- [Compare document parsers](wiki/use-cases/compare-document-parsers.md)
- [Create architecture diagrams](wiki/use-cases/create-architecture-diagrams.md)
- [Document system architecture](wiki/use-cases/document-system-architecture.md)
- [Study agent skill packaging](wiki/use-cases/study-agent-skill-packaging.md)

## Intake Modes

- **Quick card**: capture quickly when a resource may be useful but does not deserve full analysis yet.
- **Full analysis**: read source evidence, write a durable resource page, update `data/resources.yaml`.
- **Refresh/update**: check upstream changes and preserve judgment history.

Operational intake rules live in [`docs/intake-policy.md`](docs/intake-policy.md).

## Stewardship Vision

Resource Atlas is intended to become an agent-managed memory system, not just a user-maintained list. As the library grows, agents should learn the user's resource taste from accepted entries, use cases, judgments, and learnings; then use that understanding to propose relevant new resources and refresh stale entries, with user review before proactive discoveries become canonical.

See [`docs/stewardship-vision.md`](docs/stewardship-vision.md).

## Learning Loop

This repo includes a lightweight self-improvement loop:

- `data/learnings.yaml` tracks durable process lessons.
- `wiki/learnings/` stores human-readable retrospectives.
- `docs/self-improvement-policy.md` defines when to record and promote a lesson.

## Source Of Truth

- `data/resources.yaml` is the canonical machine-readable index.
- `wiki/resources/` contains human-readable analysis pages.
- `sources/` contains source metadata and evidence snapshots, not full mirrors by default.
- `runtime/templates/` defines intake templates.
- `docs/intake-policy.md` is the operating procedure.
- `docs/stewardship-vision.md` defines the long-term agent stewardship model.
- `data/learnings.yaml` records durable process improvements.
