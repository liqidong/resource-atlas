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

## Use-Case Entrypoints

- [Find practical AI prompts](wiki/use-cases/find-practical-ai-prompts.md)
- [Study prompt library maintenance](wiki/use-cases/study-prompt-library-maintenance.md)
- [Build a prompt resource library](wiki/use-cases/build-prompt-resource-library.md)
- [Learn LangGraph research agent architecture](wiki/use-cases/learn-langgraph-research-agent.md)
- [Build a local deep research prototype](wiki/use-cases/build-local-deep-research-prototype.md)
- [Compare deep research tools](wiki/use-cases/compare-deep-research-tools.md)

## Intake Modes

- **Quick card**: capture quickly when a resource may be useful but does not deserve full analysis yet.
- **Full analysis**: read source evidence, write a durable resource page, update `data/resources.yaml`.
- **Refresh/update**: check upstream changes and preserve judgment history.

Future intake should use multi-agent review by default: one source/structure reviewer, one value/use-case reviewer, then an integrated final entry.

## Learning Loop

This repo includes a lightweight self-improvement loop:

- `data/learnings.yaml` tracks durable process lessons.
- `wiki/learnings/` stores human-readable retrospectives.
- `docs/self-improvement-policy.md` defines when to record and promote a lesson.

When a mistake or workflow correction should affect future behavior, it should be promoted into `AGENTS.md`, `docs/*.md`, or `runtime/templates/*.md`.

## Source Of Truth

- `data/resources.yaml` is the canonical machine-readable index.
- `wiki/resources/` contains human-readable analysis pages.
- `sources/` contains source metadata and evidence snapshots, not full mirrors by default.
- `runtime/templates/` defines intake templates.
- `docs/intake-policy.md` is the operating procedure.
- `data/learnings.yaml` records durable process improvements.
