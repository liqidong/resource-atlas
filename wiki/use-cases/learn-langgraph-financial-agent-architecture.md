# Learn LangGraph Financial Agent Architecture

Use this when studying a LangGraph implementation that is more complex than a simple research loop.

## Current Resources

- [TradingAgents](../resources/tradingagents.md): multi-node LangGraph trading workflow with analysts, researchers, trader, risk debaters, and portfolio manager.

## What To Look At

- `tradingagents/graph/setup.py` for node and edge construction.
- `tradingagents/graph/trading_graph.py` for graph orchestration, LLM client setup, memory, and propagation.
- `tradingagents/graph/conditional_logic.py` for routing between tools, debate rounds, and manager nodes.
- `tradingagents/agents/**` for role-specific prompt design.

## Caveat

The reviewed fork is behind the active parent repository, so refresh from the parent before copying patterns into new work.
