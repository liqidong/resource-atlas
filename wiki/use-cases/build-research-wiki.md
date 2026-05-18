# Build A Research Wiki

Use this when the goal is to design a persistent research memory system instead of one-off paper summaries.

## Best Current Resource

- [OmegaWiki](../resources/omegawiki.md): wiki-centric research platform with typed entities, graph edges, citations, logs, Obsidian-style links, and a local web UI.

## What To Look At

- `runtime/schema/entities.yaml` for entity modeling.
- `wiki/graph/edges.jsonl` and `wiki/graph/citations.jsonl` for relationship storage.
- `tools/research_wiki.py` and `tools/lint.py` for deterministic maintenance tools.
- `tools/serve.py` for the local dashboard/reader/graph API.

## Caveat

The design is powerful but heavy. For a small personal wiki, borrow the schema and validation ideas before adopting the whole workflow surface.
