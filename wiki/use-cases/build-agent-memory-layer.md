# Build An Agent Memory Layer

Use this when designing a memory layer that persists coding-agent context across sessions and exposes recall to multiple agent clients.

## Best Current Resource

- [agentmemory](../resources/agentmemory.md): concrete TypeScript implementation combining lifecycle hooks, REST endpoints, MCP tools, local viewer, audit log, export/import, retention, and hybrid recall.

## What To Look At

- Hook payload boundaries: what prompts, tool inputs, outputs, file paths, and errors get captured.
- Retrieval stack: BM25, optional embeddings, graph traversal, result fusion, and token budgeting.
- Storage lifecycle: raw observations, synthetic compression, summaries, memories, retention, deletion, and audit logs.
- Client surface: MCP, REST, skills, plugins, local viewer, and export/import.
- Privacy boundary: local-only defaults versus provider keys, mesh/team sync, deployment, and remote access.

## Caveat

Treat memory servers as high-trust infrastructure. They can remember exactly the sensitive details an agent user most wants future sessions to recall.
