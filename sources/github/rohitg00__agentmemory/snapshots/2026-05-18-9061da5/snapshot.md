# Source Snapshot: agentmemory

- Source: https://github.com/rohitg00/agentmemory
- Reviewed ref: `9061da56d5caf9499f0bfb66f5cc35e648c1fb25`
- Reviewed date: 2026-05-18
- Commit subject: `chore(release): v0.9.18 (#459)`
- Latest release reviewed: `v0.9.18`, published 2026-05-17
- npm package reviewed: `@agentmemory/agentmemory@0.9.18`
- Upstream files reviewed: 496
- TypeScript/JavaScript files: 309
- Test files: 93
- GitHub API observed on 2026-05-18: 11,666 stars, 980 forks, 34 subscribers, 110 open issues plus PRs, 344 commits, GitHub Pages disabled.
- GitHub API license detection: Apache-2.0; repository `LICENSE` file states Apache-2.0.
- Validation run: `npm test` -> 91 test files passed, 1007 tests passed.
- Validation caveat: clean `npm install --omit=optional` failed with an Anthropic SDK peer dependency conflict; build validation failed in the inspection environment because the temporary install could not load the rolldown native binding.

## Evidence Files Reviewed

- `README.md`: positioning, install, agent support, benchmarks, quickstart, MCP surface, viewer, configuration, API, deploy, and privacy/security caveats.
- `CHANGELOG.md`: current release `0.9.18`, recent hardening, OpenAI timeout behavior, filesystem watcher redaction, MCP shim test hardening, release test count.
- `package.json`: npm package name, version, scripts, dependencies, optional dependencies, Node engine, bin entry.
- `packages/mcp/package.json` and `packages/mcp/bin.mjs`: standalone MCP shim package that imports `@agentmemory/agentmemory/dist/standalone.mjs`.
- `plugin/.codex-plugin/plugin.json`, `plugin/hooks/hooks.codex.json`, `plugin/.mcp.json`: Codex plugin registration, six lifecycle hooks, MCP server block, four bundled skills.
- `plugin/hooks/hooks.json`: Claude Code hook surface with 12 hook events.
- `plugin/scripts/session-start.mjs`, `prompt-submit.mjs`, `pre-tool-use.mjs`, `post-tool-use.mjs`, `stop.mjs`: actual hook behavior, REST calls, timeout handling, context-injection gate, observation capture.
- `.env.example`: provider detection, auth, embedding, LLM, behavior flags, ports, snapshots, team mode, bridge, and export settings.
- `src/index.ts`: worker registration, provider setup, function registration, REST/MCP/viewer startup, default feature gates, index persistence, auto-forget/consolidation timers.
- `src/config.ts`: default no-op LLM provider, opt-in agent SDK fallback, embedding provider detection, auto-compress and context-injection defaults.
- `src/functions/observe.ts`: observation sanitization, secret stripping, raw/compressed observation storage, synthetic compression default, image handling.
- `src/functions/privacy.ts`: secret and `<private>` redaction patterns.
- `src/functions/audit.ts`, `src/functions/governance.ts`, `src/functions/remember.ts`, `src/functions/retention.ts`: deletion/audit paths.
- `src/triggers/api.ts`: REST auth model, feature flags, health, observe, search, context, export/import, graph/team/action endpoints.
- `src/mcp/server.ts`, `src/mcp/tools-registry.ts`, `src/mcp/standalone.ts`: MCP tool surface, server proxy/fallback behavior, core vs extended tools.
- `src/viewer/server.ts`, `src/auth.ts`: local viewer, CSP nonce, host allowlist, loopback binding, bearer proxy behavior.
- `src/functions/mesh.ts`: mesh peer URL guard, remote sync requirements, private/local address blocking.
- `src/providers/*`, `src/providers/embedding/*`: external LLM providers, local embedding provider, OpenAI-compatible path, timeout wrapper.
- `benchmark/LONGMEMEVAL.md`, `benchmark/QUALITY.md`, `benchmark/REAL-EMBEDDINGS.md`, `benchmark/SCALE.md`, `benchmark/COMPARISON.md`: retrieval and scale claims, methodology caveats, competitor comparison.
- `deploy/README.md`: managed deployment templates, TLS/secret expectations, public port, viewer tunnel guidance.
- `SECURITY.md`: vulnerability reporting policy and security scope.
- `LICENSE`: Apache-2.0.

## Metadata Findings

- The project is very active and young: created 2026-02-25, latest release 2026-05-17, 344 commits by the observed API/page.
- README claims strong retrieval numbers, but `benchmark/LONGMEMEVAL.md` is retrieval-only, not end-to-end QA. Treat it as recall evidence rather than full answer-quality evidence.
- README and code agree on conservative defaults for major token-cost features: LLM auto-compression and in-conversation context injection are off by default.
- README says local embeddings are recommended, but code-level embedding detection requires an explicit `EMBEDDING_PROVIDER=local` or provider key; otherwise search is BM25-only.
- Clean source install has friction: npm peer dependency resolution failed without `--legacy-peer-deps`, even though the test suite passed after dependency resolution.
- The system is local-first, not local-only. API keys, LLM providers, embedding providers, agent SDK fallback, mesh/team sync, deploy templates, npm package fetch, iii engine install, and optional local model downloads can all cross the machine boundary.

## Source Retention Decision

Do not commit the full upstream repo for this entry. The project is public but includes a large TypeScript app, plugin scripts, package artifacts, assets, benchmarks, deployment templates, and generated test dependencies. Keep the commit ref, manifest, validation result, and evidence summary. Re-fetch upstream when refreshing.
