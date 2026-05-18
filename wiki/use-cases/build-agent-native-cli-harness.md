# Build An Agent-Native CLI Harness

Use this when the goal is to make an existing application, service, or codebase easier for agents to operate through structured terminal commands instead of screenshots, brittle UI clicks, or ad hoc API calls.

## Current Resources

- [CLI-Anything](../resources/cli-anything.md): full methodology, plugin, Codex skill, registry, CLI-Hub package manager, and many generated harness examples for turning real software into agent-facing CLIs.

## Implementation Axes

- Source-code and backend API discovery
- Command group design and state model
- REPL versus one-shot subcommand interface
- JSON output for agents plus human-readable output for debugging
- Real backend invocation versus toy reimplementation
- Test plan before implementation
- Unit, E2E, subprocess, and artifact verification
- Skill packaging and discoverability
- Registry metadata, installation commands, and update path
- Security review for subprocess arguments, paths, secrets, and remote APIs

## Next Resources To Analyze

- Individual CLI-Anything harnesses that match current work
- OpenAPI-to-CLI and SDK-to-CLI generators
- MCP server examples with comparable capability surfaces
- GUI agent benchmarks that could be re-run through CLI-first tools
