# Study Claude Code Research Workflows

Use this when the goal is to understand how Claude Code skills can encode long-running research workflows with validation, logs, source boundaries, and human gates.

## Best Current Resource

- [OmegaWiki](../resources/omegawiki.md): ambitious Claude Code research OS with skills for paper ingest, discovery, novelty checks, experiment lifecycle, writing, rebuttal, and poster generation.

## What To Look At

- `.claude/skills/ingest/SKILL.md` for a durable paper-intake workflow.
- `.claude/skills/init/SKILL.md` for multi-source bootstrap and parallel fan-in.
- `.claude/skills/daily-arxiv/SKILL.md` for scheduled recommendation and explicit auto-ingest boundaries.
- `runtime/schema/` and `tools/lint.py` for schema-backed validation.

## Caveat

Study it as architecture first. Running it on private research requires a separate permission and external-service review.
