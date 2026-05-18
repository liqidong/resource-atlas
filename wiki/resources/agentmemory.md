---
title: agentmemory
resource_id: res_20260518_agentmemory_9061da5
slug: agentmemory
canonical_slug: agentmemory
aliases:
  - agentmemory
  - Agent Memory
  - rohitg00/agentmemory
  - "@agentmemory/agentmemory"
  - "@agentmemory/mcp"
resource_type: github_repo
source_url: https://github.com/rohitg00/agentmemory
canonical_source: https://github.com/rohitg00/agentmemory
local_source: sources/github/rohitg00__agentmemory/
source_kind: github
source_fingerprints:
  - git:9061da56d5caf9499f0bfb66f5cc35e648c1fb25
  - tree-content-sha256:2833680cff1a267837d82fb3ad417de6bb3014b66b560afadb409215ab0bdbbc
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: 9061da56d5caf9499f0bfb66f5cc35e648c1fb25
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: shortlisted
maturity: useful_fast_moving
recommendation: recommended_with_caveats
fit_for_user: high
time_to_value: medium
setup_cost: medium
maintenance_burden: medium_high
risk_level: high
evidence_quality: high
will_i_actually_use_this: maybe
public_ready: yes
private_notes: no
source_publishable: partial
language: en
redaction_needed: no
tags:
  - agent-memory
  - persistent-memory
  - coding-agent
  - mcp
  - agent-hooks
  - memory-retrieval
  - claude-code
  - codex-cli
  - agent-framework
  - local-first
  - iii-engine
  - open-source-template
use_cases:
  - build-agent-memory-layer
  - compare-agent-memory-systems
  - study-agent-hooks-and-mcp-memory
recommended_for:
  - 学习跨 Claude Code、Codex、Cursor、Gemini CLI 等 agent 的持久记忆层设计
  - 参考 hooks、REST、MCP、viewer、audit、export/import、retention 和 search 如何组合
  - 比较 built-in memory、MCP memory server、local-first memory service 的真实边界
not_recommended_for:
  - 不能接受开发 prompt、tool input/output、文件路径和错误信息被本地记忆系统记录的场景
  - 想要完全零维护、无外部运行时、无 npm/iii-engine 依赖的用户
  - 没有先审查 LLM provider、embedding provider、mesh/team sync、remote deploy 和 bearer-token 边界的隐私敏感工作流
confidence: high
---

# agentmemory

## Beginner Verdict

- What this is: 一个给 coding agents 用的持久记忆服务器，通过 hooks 捕获会话和工具使用，再通过 REST、MCP、viewer 和搜索工具给未来会话召回上下文。
- Who should care: 想让 Claude Code、Codex、Cursor、Gemini CLI 等工具共享长期项目记忆的人，以及想研究 agent memory architecture 的开发者。
- When I should remember it: 当我想比较“内置 MEMORY.md / CLAUDE.md”和“独立 memory daemon + MCP + hooks”的差异，或想给 Resource Atlas / coding agent 工作流借鉴记忆层设计时。
- Not for: 隐私敏感但不愿审查采集边界的项目、不能接受本地 daemon/npm/iii-engine 运行时的人、期待完全无配置无维护的人。
- Setup difficulty: 中等。`npx` 能快速启动，但可靠使用需要理解 hooks、MCP、provider keys、iii-engine、ports、auth、export/import 和删除策略。
- My verdict: 推荐入库，但必须带 caveats。作为 agent memory 参考实现是 A-/B+；作为我直接长期启用的高信任开发记忆层，需要先做隐私和安装边界审查。

## One-Sentence Summary

agentmemory 是一个 TypeScript/iii-engine 驱动的本地优先 coding-agent 记忆层，把 hook 自动采集、BM25/可选向量/图检索、MCP 工具、REST API、实时 viewer、审计删除和跨 agent 接入组织成一个可运行的记忆服务器。

Community signal observed on 2026-05-18: GitHub API/page reported 11,666 stars, 980 forks, 110 open issues plus PRs, 344 commits, Apache-2.0 license, and latest release `v0.9.18`. npm reported `@agentmemory/agentmemory@0.9.18`, published 2026-05-17.

## What It Is

agentmemory 是一个给 AI coding agents 用的 memory engine。它不是普通 prompt 文件，也不只是一个 MCP wrapper。它启动一个本地服务，默认 REST 在 `:3111`，viewer 在 `:3113`，后台通过 `iii-engine` 注册函数、HTTP triggers、KV state、streams 和 metrics。

它支持两类接入：

1. Agent hooks：Claude Code、Codex 等生命周期事件触发脚本，把 session start、user prompt、tool use、compaction、stop 等事件送到本地 REST API。
2. MCP / REST / skills：agent 通过 `memory_recall`、`memory_save`、`memory_smart_search`、audit/governance 等工具主动查询或管理记忆。

项目还包含 npm 包 `@agentmemory/agentmemory` 和 thin shim `@agentmemory/mcp`，Codex/Claude plugin metadata，benchmark 文档，deploy templates，viewer，and 90+ test files.

## What Problem It Solves

普通 coding agent 的记忆常见问题是：每个会话从零开始，项目偏好、架构决策、历史 bug、测试坑和文件上下文都要重新解释。静态 `CLAUDE.md` 或 `MEMORY.md` 可以记一点，但会膨胀、过期、不可搜索，也通常绑定单一 agent。

agentmemory 解决的是“把开发会话变成可检索、可审计、可跨 agent 共享的长期记忆”。它通过 hook 自动捕获事实和操作，再用检索给未来会话返回相关片段，而不是每次加载全部历史。

它不解决“安全地记住所有东西而无需治理”。因为它记住的是高敏感开发上下文，真正使用时必须先决定采集范围、密钥处理、远程 provider、同步和删除策略。

## Who It Is For

适合：

- 想让多个 coding agents 共享项目记忆的开发者。
- 想研究 MCP memory server 和 lifecycle hook 设计的人。
- 有重复解释架构、偏好、测试方式、历史 bug 痛点的长期项目。
- 想比较 agent memory、RAG、static memory file、managed memory API 的人。
- 想给自己的 agent workflow 做 audit、retention、export/import 和 recall 的人。

不适合：

- 不愿让任何本地服务记录 prompt、tool input/output、文件路径和错误信息的人。
- 对 npm、Node、iii-engine、ports、auth、MCP 配置没有维护意愿的人。
- 把“local-first”理解为“任何配置下永不出网”的用户。
- 高合规环境中未经安全审查的自动采集。

## How It Works

核心路径：

1. 用户启动 `agentmemory`，它启动或连接 `iii-engine`。
2. Worker 注册 memory functions、REST endpoints、MCP endpoints、viewer、health monitor、search index 和 timers。
3. Agent plugin hooks 把 prompt/tool/session payload POST 到本地 REST API。
4. `mem::observe` 先做 secret redaction，再保存 observation。
5. 默认使用 zero-LLM synthetic compression，让 BM25 search 可用；LLM compression 和 context injection 默认关闭。
6. 可选 embedding provider 打开 vector index；可选 graph/consolidation/slots/team/mesh 等扩展功能。
7. 未来会话通过 hook 注入或显式 MCP/REST search 召回相关记忆。

Codex plugin 注册 6 个 hooks：`SessionStart`、`UserPromptSubmit`、`PreToolUse`、`PostToolUse`、`PreCompact`、`Stop`。Claude Code hook set 更宽，包括 subagent、notification、failure、task completed 和 session end。

## How To Use It

最短试用路径：

```bash
npx @agentmemory/agentmemory
npx @agentmemory/agentmemory demo
```

Codex plugin 路径：

```bash
codex plugin marketplace add rohitg00/agentmemory
codex plugin install agentmemory
```

普通 MCP client 路径是把 `@agentmemory/mcp` 加到 agent 的 MCP 配置里，并让 `AGENTMEMORY_URL` 指向运行中的本地 server。重要细节：`@agentmemory/mcp` 是 shim。它能连到 server 时暴露完整工具面；连不到时 fallback 到本地小工具集。

采用前我会先做这些检查：

1. 只在测试项目或公开项目上启用。
2. 确认 `AGENTMEMORY_AUTO_COMPRESS=false` 和 `AGENTMEMORY_INJECT_CONTEXT=false` 的默认行为符合预期。
3. 设置或审查 `AGENTMEMORY_SECRET`，尤其是任何非 loopback 或 reverse proxy 场景。
4. 明确是否启用 LLM provider、embedding provider、local embeddings、mesh/team sync、snapshot、export。
5. 跑一次 forget/governance/export/import，确认删除和备份路径符合自己的安全感。

## Source Walkthrough

- `README.md`: install、agents、benchmarks、MCP、viewer、iii console、configuration、API、deploy 和 caveats。
- `CHANGELOG.md`: `v0.9.18` hardening wave，包含 lesson injection、viewer CSP、filesystem watcher redaction、OpenAI timeout、MCP standalone probe test hardening。
- `package.json`: npm 包、CLI、scripts、Node engine、LLM/embedding/iii dependencies。
- `packages/mcp/*`: `@agentmemory/mcp` shim package。
- `plugin/.codex-plugin/plugin.json` and `plugin/hooks/hooks.codex.json`: Codex plugin metadata and hook registration.
- `plugin/scripts/*.mjs`: hook scripts; these show what is actually sent to the local REST API.
- `.env.example`: safest place to understand provider keys, embeddings, auth, behavior flags, ports, snapshots, team, bridge, export.
- `src/index.ts`: worker startup and registration of REST/MCP/viewer/search/governance/retention/etc.
- `src/config.ts`: provider detection and conservative defaults.
- `src/functions/observe.ts`: observation capture, redaction, image extraction, synthetic compression.
- `src/functions/privacy.ts`: regex redaction for secrets and `<private>` blocks.
- `src/functions/audit.ts`, `governance.ts`, `remember.ts`, `retention.ts`: deletion and audit behavior.
- `src/triggers/api.ts`: REST surface and bearer auth behavior.
- `src/mcp/server.ts`, `tools-registry.ts`, `standalone.ts`: MCP tool surface and proxy/fallback behavior.
- `src/viewer/server.ts`: loopback viewer, CSP, host allowlist, proxy to REST API.
- `src/functions/mesh.ts`: sync peer validation and private/local address blocking.
- `benchmark/*.md`: retrieval and scale claims plus methodology caveats.
- `deploy/README.md`: remote deployment assumptions, generated HMAC secret, public port, TLS, viewer tunnel.
- `SECURITY.md`: vulnerability reporting and supported version policy.

Local validation: after resolving dependencies with `--legacy-peer-deps`, `npm test` passed 91 test files and 1007 tests in the temporary clone. A clean source `npm install --omit=optional` failed on an Anthropic SDK peer dependency conflict, and `npm run build` did not complete in the inspection environment because the temporary install could not load the rolldown native binding.

## What It Can Do Well

- Captures coding-agent context automatically instead of relying only on manual notes.
- Works across multiple agent hosts via hooks, REST, MCP, and plugins.
- Keeps high-cost features opt-in: LLM auto-compress and context injection are off by default.
- Has redaction for common secret patterns before storing observations.
- Provides local viewer and API surface for inspecting memory.
- Includes audit/governance/delete/export/import paths rather than only append-only memory.
- Offers a broad MCP tool surface, with core tools available even in standalone fallback mode.
- Benchmark docs are unusually explicit about retrieval-only methodology and comparison caveats.
- Test signal is strong: 1007 tests passed during intake.

## Limits And Risks

- It is high-trust infrastructure. Hooks can capture user prompts, tool inputs, tool outputs, file paths, errors, image data, and session metadata.
- Redaction is helpful but not proof against all secrets. It uses pattern matching; novel credentials, proprietary code, confidential snippets, or sensitive business content can still be stored.
- Local-first is not local-only. LLM providers, embedding providers, agent SDK fallback, local embedding model downloads, mesh/team sync, deploy templates, npm, and iii-engine installation can all leave the machine depending on configuration.
- REST endpoints are open on loopback when `AGENTMEMORY_SECRET` is unset. That is convenient locally, but any non-loopback deployment must treat bearer auth and TLS as mandatory.
- The viewer can proxy privileged requests to REST; recent code has CSP and Host allowlist hardening, but exposing it publicly would be a mistake.
- Fresh source install has dependency friction: npm peer resolution failed without `--legacy-peer-deps` in the inspection environment.
- Build validation did not pass in the inspection environment because the temporary install had a rolldown native binding load problem. The published npm package exists, but source-build reproducibility should be checked before contributing.
- The project is young and fast moving: pre-1.0, frequent releases, large open issue/PR count.
- README benchmark numbers are retrieval recall, not end-to-end answer quality.
- README recommends local embeddings, but code-level detection requires explicitly choosing `EMBEDDING_PROVIDER=local` or setting a provider key; otherwise the default path is BM25-only.
- Remote deploy and mesh/team features change the privacy model substantially.

## Similar Resources

- Built-in agent memory files: simpler, lower moving parts, but static and per-agent.
- mem0: managed/API memory layer direction, likely better for app integration but different privacy and ops tradeoffs.
- Letta / MemGPT: full agent runtime with memory abstractions, more framework commitment.
- Khoj: personal knowledge assistant direction, broader than coding-agent memory.
- claude-mem: Claude Code-focused memory with smaller scope.
- Hippo: biologically inspired agent memory model with decay/consolidation themes.
- [OmegaWiki](omegawiki.md): different domain, but useful comparison for durable agent-managed memory and workflow contracts.

## My Judgment

推荐入库，标记为 `shortlisted` 和 `recommended_with_caveats`。

它对 Resource Atlas 很贴合：这是一个真实的 agent memory 系统，不只是概念文章。它把 hooks、MCP、REST、viewer、search、audit、retention、export/import 都放到一个能跑的工程里，值得作为未来“agent 长期记忆层”比较基线。

我会把它当作：

1. 学习 coding-agent memory architecture 的主参考。
2. 对比 built-in memory、MCP memory server、managed memory API 的样本。
3. 审查“local-first 但可能联网”的边界案例。
4. 给 Resource Atlas 自己未来自动 intake / recall / learning loop 设计找灵感。

但我不会无脑把它接到私密项目。它的价值来自会记住很多东西，它的风险也来自会记住很多东西。先用公开项目试，确认 redaction、delete、export、auth、provider 和 sync 策略，再考虑长期启用。

Judgment axes:

- fit for user: high
- time to value: medium
- setup cost: medium
- maintenance burden: medium/high
- maturity: useful but fast-moving
- evidence quality: high for source/test structure; medium for long-term operational reliability
- risk level: high because it captures sensitive development context

## When To Remember This

- “我想让 Codex、Claude Code、Cursor 共享同一份项目记忆。”
- “我想看 agent hooks 怎么把 session/tool events 变成 searchable memory。”
- “我想比较 MCP memory tool 的 full server 和 standalone fallback。”
- “我想给 Resource Atlas 或 coding agent 做长期 recall 层。”
- “我看到一个 memory 工具说 self-hosted/local-first，要检查它到底什么时候会联网。”
- “我需要研究 memory deletion、audit trail、retention 和 export/import 怎么做。”

## Open Questions

- 干净环境中 `npm install` peer dependency conflict 后续是否会被上游修复？
- `npm run build` 在 clean supported Node/npm matrix 上是否稳定，是否需要 lockfile 或 pinned dev dependencies？
- local embeddings 是否应该真正默认启用，还是 README 需要更明确地说 `EMBEDDING_PROVIDER=local`？
- Redaction 对真实 coding sessions 中的 secrets、private snippets、proprietary code、screenshots 够不够？
- Long-term daemon 运行数周后的 index persistence、retention、delete/audit、export/import 稳定性如何？
- 多 agent 同时写入同一 memory server 时，哪些 race/relevance/conflict 问题会出现？
- 如果把它部署到 Fly/Render/Railway/Coolify，secret rotation、backup、TLS、viewer tunnel 和 logs 是否足够清楚？

## Source Evidence

- Snapshot manifest: `sources/github/rohitg00__agentmemory/snapshots/2026-05-18-9061da5/manifest.yaml`
- Snapshot summary: `sources/github/rohitg00__agentmemory/snapshots/2026-05-18-9061da5/snapshot.md`
- Upstream source: https://github.com/rohitg00/agentmemory
- Upstream commit reviewed: `9061da56d5caf9499f0bfb66f5cc35e648c1fb25`
- GitHub release reviewed: `v0.9.18`, published 2026-05-17.
- npm metadata reviewed: `@agentmemory/agentmemory@0.9.18`, published 2026-05-17.
- GitHub API observed on 2026-05-18: 11,666 stars, 980 forks, 110 open issues plus PRs, 344 commits, Apache-2.0 license.
- Local validation: `npm test` passed 91 test files and 1007 tests after dependency resolution with `--legacy-peer-deps`.
- Validation caveat: clean source install and build reproducibility were not clean in the inspection environment.

## Evidence Standard

```yaml
evidence_reviewed:
  - file_or_url: README.md
    why_it_matters: Project positioning, install, supported agents, benchmarks, MCP, viewer, configuration, API, deployment, and local-first claims.
  - file_or_url: CHANGELOG.md
    why_it_matters: Current release notes, hardening work, test count, redaction, CSP, MCP shim behavior, and timeout fixes.
  - file_or_url: package.json
    why_it_matters: npm package identity, CLI entry, scripts, dependencies, optional dependencies, and Node engine.
  - file_or_url: packages/mcp/package.json and packages/mcp/bin.mjs
    why_it_matters: Confirms standalone MCP shim package and dependency on main package.
  - file_or_url: plugin/.codex-plugin/plugin.json and plugin/hooks/hooks.codex.json
    why_it_matters: Confirms Codex plugin skills, MCP registration, and lifecycle hooks.
  - file_or_url: plugin/scripts/*.mjs
    why_it_matters: Shows actual hook payload capture, REST URLs, timeouts, and context injection behavior.
  - file_or_url: .env.example
    why_it_matters: Best map of provider keys, embeddings, auth, behavior flags, ports, snapshots, team, bridge, and export settings.
  - file_or_url: src/index.ts
    why_it_matters: Worker startup and registration of functions, REST, MCP, viewer, search, timers, and feature gates.
  - file_or_url: src/config.ts
    why_it_matters: Default no-op LLM provider, opt-in agent SDK fallback, embedding detection, auto-compress and context-injection defaults.
  - file_or_url: src/functions/observe.ts and src/functions/privacy.ts
    why_it_matters: Observation capture, secret stripping, synthetic compression, and image handling.
  - file_or_url: src/functions/audit.ts, governance.ts, remember.ts, retention.ts
    why_it_matters: Delete, retention, and audit behavior.
  - file_or_url: src/triggers/api.ts
    why_it_matters: REST endpoint surface and bearer auth model.
  - file_or_url: src/mcp/server.ts, src/mcp/tools-registry.ts, src/mcp/standalone.ts
    why_it_matters: MCP tools, proxy mode, standalone fallback, and core/all tool split.
  - file_or_url: src/viewer/server.ts and src/auth.ts
    why_it_matters: Viewer host allowlist, CSP, loopback binding, and auth helpers.
  - file_or_url: src/functions/mesh.ts
    why_it_matters: Remote sync URL validation and AGENTMEMORY_SECRET requirement.
  - file_or_url: benchmark/*.md
    why_it_matters: Retrieval benchmark methodology, scale claims, and comparison caveats.
  - file_or_url: deploy/README.md
    why_it_matters: Remote deployment, HMAC secret, TLS, exposed port, and viewer tunnel expectations.
  - file_or_url: SECURITY.md
    why_it_matters: Security reporting scope and supported versions.
  - file_or_url: GitHub API, GitHub releases API, npm registry metadata
    why_it_matters: Current community signal, release status, package version, license, and npm provenance.
evidence_not_reviewed:
  - item: full end-to-end daemon run with a real coding agent
    reason: Intake reviewed source and tests but did not wire the local agent plugin into this workspace.
  - item: long-running memory quality over real projects
    reason: Requires multi-session use over time.
  - item: integration test suite
    reason: Default npm test excludes integration.test.ts and no full server stack was launched.
  - item: clean npm build in a fresh dependency tree
    reason: Source install/build had dependency/native-binding issues in the inspection environment.
  - item: live LLM provider, embedding provider, mesh sync, remote deploy, and local embedding model download
    reason: These require credentials, downloads, or deployment setup outside this intake.
  - item: full security audit of REST, viewer, MCP, hooks, mesh, import/export, and deploy templates
    reason: Boundary review was source-based only.
ran_locally: partial
run_notes: "npm test passed 91 files / 1007 tests after dependency resolution with --legacy-peer-deps. Clean npm install failed on peer dependency resolution; npm run build failed in the inspection environment due a rolldown native binding load problem."
license_checked: yes
security_or_privacy_notes: "High-trust local-first memory service. Defaults avoid LLM compression and context injection, but hooks still capture sensitive development context locally. External providers, embeddings, mesh/team sync, remote deploy, and npm/iii runtime setup can leave the machine."
confidence_limits: "High confidence in architecture and source behavior; medium confidence in long-term operational reliability and clean source-build reproducibility."
```

## Update History

```yaml
- date: 2026-05-18
  old_judgment: none
  new_judgment: recommended_with_caveats
  why_changed: First full analysis and intake.
  evidence: README, changelog, package metadata, plugin hooks, source files, benchmarks, deploy docs, security policy, GitHub API, npm metadata, npm test.
  still_true: n/a
  no_longer_true: n/a
  confidence_change: none -> high
  source_ref: 9061da56d5caf9499f0bfb66f5cc35e648c1fb25
```
