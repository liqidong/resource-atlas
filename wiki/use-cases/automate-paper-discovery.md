# Automate Paper Discovery

Use this when the goal is to recommend or triage papers from current sources against an existing research profile.

## Best Current Resource

- [OmegaWiki](../resources/omegawiki.md): daily arXiv and venue-discovery workflows using arXiv, Semantic Scholar, DeepXiv, Paper Copilot, and the existing wiki state.

## What To Look At

- `.claude/skills/daily-arxiv/SKILL.md` for recommendation and auto-ingest policy.
- `.github/workflows/daily-arxiv.yml` for scheduled execution.
- `tools/daily_arxiv.py` for deterministic feed/context/finalize steps.
- `tools/discover.py` for anchor, topic, wiki, and venue-based paper discovery.

## Caveat

Keep inform-mode and auto-ingest separate. Auto-ingest can mutate durable wiki/raw files and should remain an explicit choice.
