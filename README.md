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
| [TradingAgents](wiki/resources/tradingagents.md) | GitHub repo | Recommended with caveats | Multi-agent financial analysis workflows, LangGraph role orchestration, AI trading risk boundaries |
| [agentmemory](wiki/resources/agentmemory.md) | GitHub repo | Recommended with caveats | Persistent memory for coding agents, MCP/hooks integration, local-first recall architecture |
| [OmegaWiki](wiki/resources/omegawiki.md) | GitHub repo | Recommended with caveats | Claude Code research OS, persistent research wiki, paper discovery and academic writing workflows |
| [UI-TARS Desktop](wiki/resources/ui-tars-desktop.md) | GitHub repo | Recommended with caveats | GUI/computer-use agent architecture, desktop/browser operators, VLM action loops, MCP/browser infra |
| [CLI-Anything](wiki/resources/cli-anything.md) | GitHub repo | Recommended with caveats | Agent-native CLI harness generation, CLI-Hub registry, skill packaging, GUI-agent alternatives |
| [MinerU](wiki/resources/mineru.md) | GitHub repo | Recommended with caveats | Parsing PDFs, scanned docs, images, and Office files into Markdown/JSON for RAG and agent workflows |
| [Architecture Diagram Generator](wiki/resources/architecture-diagram-generator.md) | Agent skill | Recommended with caveats | Fast dark-theme HTML/SVG architecture diagrams, Claude custom skill packaging, technical documentation visuals |
| [HackingTool](wiki/resources/hackingtool.md) | GitHub repo | Not recommended for direct use | Cautionary review of a high-risk security tool aggregator, installer boundary, and dual-use command-launcher pattern |

## Use-Case Entrypoints

- [Find practical AI prompts](wiki/use-cases/find-practical-ai-prompts.md)
- [Study prompt library maintenance](wiki/use-cases/study-prompt-library-maintenance.md)
- [Build a prompt resource library](wiki/use-cases/build-prompt-resource-library.md)
- [Learn LangGraph research agent architecture](wiki/use-cases/learn-langgraph-research-agent.md)
- [Build a local deep research prototype](wiki/use-cases/build-local-deep-research-prototype.md)
- [Compare deep research tools](wiki/use-cases/compare-deep-research-tools.md)
- [Study multi-agent financial workflows](wiki/use-cases/study-multi-agent-financial-workflows.md)
- [Learn LangGraph financial agent architecture](wiki/use-cases/learn-langgraph-financial-agent-architecture.md)
- [Evaluate AI trading agent risk](wiki/use-cases/evaluate-ai-trading-agent-risk.md)
- [Build an agent memory layer](wiki/use-cases/build-agent-memory-layer.md)
- [Compare agent memory systems](wiki/use-cases/compare-agent-memory-systems.md)
- [Study agent hooks and MCP memory](wiki/use-cases/study-agent-hooks-and-mcp-memory.md)
- [Study Claude Code research workflows](wiki/use-cases/study-claude-code-research-workflows.md)
- [Build a research wiki](wiki/use-cases/build-research-wiki.md)
- [Automate paper discovery](wiki/use-cases/automate-paper-discovery.md)
- [Learn GUI agent architecture](wiki/use-cases/learn-gui-agent-architecture.md)
- [Build a computer-use agent](wiki/use-cases/build-computer-use-agent.md)
- [Compare computer-use agents](wiki/use-cases/compare-computer-use-agents.md)
- [Build an agent-native CLI harness](wiki/use-cases/build-agent-native-cli-harness.md)
- [Parse documents for RAG](wiki/use-cases/parse-documents-for-rag.md)
- [Build a local document parsing pipeline](wiki/use-cases/build-local-document-parsing-pipeline.md)
- [Compare document parsers](wiki/use-cases/compare-document-parsers.md)
- [Create architecture diagrams](wiki/use-cases/create-architecture-diagrams.md)
- [Document system architecture](wiki/use-cases/document-system-architecture.md)
- [Study agent skill packaging](wiki/use-cases/study-agent-skill-packaging.md)
- [Study security tool aggregators](wiki/use-cases/study-security-tool-aggregators.md)
- [Evaluate dual-use install boundaries](wiki/use-cases/evaluate-dual-use-install-boundaries.md)

## Repository Map

- Agent entry contract: [`AGENTS.md`](AGENTS.md)
- Intake, refresh, branch, and completion procedure: [`docs/intake-policy.md`](docs/intake-policy.md)
- Long-term agent stewardship model: [`docs/stewardship-vision.md`](docs/stewardship-vision.md)
- Source retention rules: [`docs/source-retention-policy.md`](docs/source-retention-policy.md)
- Public redaction rules: [`docs/public-redaction-policy.md`](docs/public-redaction-policy.md)
- Durable process lessons: [`docs/self-improvement-policy.md`](docs/self-improvement-policy.md), `data/learnings.yaml`, and `wiki/learnings/`
- Intake templates: [`runtime/templates/`](runtime/templates/)
- Validation gate: `ruby scripts/validate-atlas.rb`
