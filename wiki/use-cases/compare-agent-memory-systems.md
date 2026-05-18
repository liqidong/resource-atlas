# Compare Agent Memory Systems

Use this when comparing built-in memory files, MCP memory servers, local-first memory daemons, and managed memory APIs.

## Current Resources

- [agentmemory](../resources/agentmemory.md): strong local-first reference for automatic capture and cross-agent recall, with caveats around sensitive hook capture and dependency/runtime complexity.

## Comparison Axes

- Manual save vs automatic lifecycle capture
- Single-agent file memory vs cross-agent server
- Recall quality: keyword, vector, graph, reranking, and token budget
- Privacy boundary and external provider calls
- Deletion, retention, audit, and export/import
- MCP, REST, plugin, and hook integration breadth
- Local install complexity and runtime dependencies
- Team sync and remote deploy security model
- Benchmark methodology: retrieval recall vs end-to-end answer quality

## Next Resources To Analyze

- mem0
- Letta / MemGPT
- Khoj
- claude-mem
- Hippo
- Built-in Claude Code / Cursor memory mechanisms
