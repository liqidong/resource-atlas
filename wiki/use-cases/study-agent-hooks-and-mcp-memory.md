# Study Agent Hooks And MCP Memory

Use this when the goal is to understand how agent lifecycle hooks and MCP tools can cooperate around a persistent memory service.

## Best Current Resource

- [agentmemory](../resources/agentmemory.md): shows both sides of the pattern: hooks capture session events into a local REST API, while MCP tools expose recall, save, audit, governance, and extended orchestration.

## What To Look At

- Codex hook set: `SessionStart`, `UserPromptSubmit`, `PreToolUse`, `PostToolUse`, `PreCompact`, `Stop`.
- Claude Code hook set: broader lifecycle coverage including subagent, notification, failure, task, and session-end hooks.
- MCP shim behavior: proxy to a running server for the full tool surface, local fallback when no server is reachable.
- Context-injection gate: capture can run without injecting recalled context into the model conversation.
- Failure mode: hook scripts swallow short-timeout REST failures so agent work is not blocked.

## Caveat

Hooks are powerful because they are ambient. Before adopting the pattern, decide which events should be captured, how secrets are redacted, and when recalled context is allowed to re-enter a model prompt.
