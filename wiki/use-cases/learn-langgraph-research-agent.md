# Learn LangGraph Research Agent Architecture

Use this when the goal is to understand how a research assistant can be modeled as a LangGraph state machine.

## Best Current Resource

- [Local Deep Researcher](../resources/local-deep-researcher.md): compact example of query generation, web search, summarization, reflection, conditional routing, and final summary in LangGraph.

## What To Look At

- `graph.py` for nodes and edges.
- `state.py` for state fields.
- `configuration.py` for configurable runtime behavior.
- `langgraph.json` for graph server entrypoint.

## Caveat

Use it as an architecture learning resource, not as proof of production-grade research quality.
