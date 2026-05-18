# UI-TARS Desktop Evidence Snapshot

Source: https://github.com/bytedance/UI-TARS-desktop

Snapshot date: 2026-05-18

Reviewed ref: `e9f3387288da4af2ad99972da2ac916cdabce093`

## Source Positioning

The repository is a ByteDance TARS stack monorepo. The README now presents two related projects:

- Agent TARS: a multimodal agent stack with CLI and Web UI, MCP integration, browser/computer/product tooling, and an event-stream driven agent UI.
- UI-TARS Desktop: an Electron desktop GUI agent for local computer and browser operation, driven by UI-TARS and Seed/Doubao vision-language models.

The repo is not just a packaged desktop app. It also contains reusable SDKs and infrastructure packages for GUI agents, operators, browser control, MCP servers, an action parser, visualizer, examples, and the newer Agent TARS / Tarko multimodal agent stack under `multimodal/`.

## Evidence Reviewed

- `README.md`: project positioning, Agent TARS vs UI-TARS Desktop split, feature list, quickstart links, community signal links, license statement.
- `README.zh-CN.md`: Chinese-language counterpart, skimmed for parity.
- `docs/quick-start.md`: desktop app prerequisites, install path, local and remote operator setup, Hugging Face and VolcEngine model configuration.
- `docs/setting.md`: VLM settings, local browser search engine, optional report storage, optional UTIO event collection.
- `docs/preset.md`: local and remote preset import; remote preset auto-sync.
- `docs/sdk.md`: `@ui-tars/sdk` model/operator architecture, screenshot loop, OpenAI-compatible model configuration.
- `docs/deployment.md`: UI-TARS 1.0 deployment guide marked deprecated; UI-TARS 1.5 deployment deferred to the separate `bytedance/UI-TARS` repo and Lark docs.
- `package.json`, `pnpm-workspace.yaml`, `.env.example`: monorepo setup, package manager, Node engine, workspace structure, default VLM env names.
- `apps/ui-tars/package.json`: Electron/Vite desktop app, build scripts, desktop permission/control dependencies.
- `apps/ui-tars/src/main/services/runAgent.ts`: local/remote operator selection, VLM config, screenshot loop entry, UTIO instruction event call.
- `apps/ui-tars/src/main/store/setting.ts` and `store/types.ts`: default settings, operator enum, VLM provider enum, remote preset fetch path.
- `apps/ui-tars/src/main/services/utio.ts`: optional UTIO events for app launch, instruction submission, and report sharing.
- `packages/ui-tars/sdk/src/GUIAgent.ts` and `Model.ts`: screenshot capture, image compression, OpenAI Chat Completions / Responses API calls, action parsing.
- `packages/ui-tars/*/package.json`: SDK, action parser, CLI, operators, UTIO, visualizer.
- `packages/agent-infra/*/package.json`: browser, browser-use, MCP client/server packages, search/browser/filesystem/commands MCP servers.
- `multimodal/agent-tars/*`: Agent TARS CLI/core/interface package manifests and docs.
- `multimodal/tarko/*`: Tarko agent kernel, CLI, server/server-next, model provider, MCP agent, context engineer, and UI package areas.
- `apps/ui-tars/src/main/remote/auth.ts`, `proxyClient.ts`, and `subscriptionClient.ts`: remote operator auth, local key/device-id handling, proxy/subscription flows.
- GitHub repository page and API: community signal, latest release, license, latest commit.
- GitHub PR #1894: open security-fix PR alleging DNS rebinding exposure in Agent TARS/Tarko local servers; finding was noted but not independently validated.
- Homebrew Formulae page for `ui-tars`: cask version and install metadata.

## Evidence Not Reviewed

- The desktop app was not installed or run with screen/accessibility permissions.
- No real VLM endpoint was configured, so task execution quality was not tested.
- Release binaries/assets were not downloaded.
- The separate `bytedance/UI-TARS` model repository and model weights were not deeply reviewed.
- The external hosted documentation at `agent-tars.com`, Hugging Face, VolcEngine, ModelScope, and Lark deployment docs were not fully audited.
- Security properties of remote operator services, Browserbase, MCP servers, and command/filesystem MCP access were not penetration-tested.
- The open DNS-rebinding PR was not reproduced locally.
- Homebrew cask install was not run.

## Network And Privacy Boundary Notes

- Local computer/browser operators run on the user's machine and need OS-level screen recording/accessibility/browser permissions.
- The agent loop captures screenshots, compresses image content, and sends instruction plus recent screenshots to the configured VLM endpoint through an OpenAI-compatible API client.
- The default examples point to Hugging Face Inference Endpoints and VolcEngine Ark/Doubao. A self-hosted/local OpenAI-compatible model endpoint may reduce external exposure, but that boundary depends on user deployment.
- Remote Computer and Remote Browser operators depend on remote services. The quick-start says the free Remote Operator service would be discontinued on 2025-08-20 and suggests deploying Volcano Engine OS Agent Services afterward.
- Quick-start says UI-TARS Desktop is currently single-monitor only and multi-monitor setups may fail for some tasks.
- Remote auth code generates local RSA key material, reads a machine identifier, registers the device, and signs remote-service headers.
- Agent TARS / Tarko local server paths can expose browser, filesystem, command, and MCP tooling depending on configuration. The command MCP server is especially high-trust because it is designed to execute shell commands.
- Report Storage Base URL and UTIO Base URL are optional, but when configured they upload report HTML or event payloads. UTIO events include app launch platform/screen dimensions, submitted instruction text, and optional screenshot/report data for share events.
- Remote preset import can fetch YAML settings from a URL and optionally auto-sync at app startup.
- README's "fully local processing" claim is too broad unless the VLM endpoint, reporting, UTIO, presets, browser searches, and remote operators are all configured locally or disabled.

## Validation

- Shallow clone of default branch completed.
- Parsed 80 `package.json` files with Node successfully.
- Did not run `pnpm install`, app build, Electron launch, or end-to-end GUI tests because dependency installation, OS permissions, and VLM credentials would be beyond lightweight source intake.

## Community Snapshot

Observed on 2026-05-18:

- Stars: 34,494
- Forks: 3,455
- Watchers: 262
- Open issues: 317
- Open pull requests: 75
- Open issues plus PRs: 392
- Commits shown by GitHub page: 1,109
- Latest default-branch commit: `e9f3387` on 2026-05-18, subject `chore: license (#1895)`
- Latest GitHub release: `v0.3.0`, published 2025-11-04
- Latest release API assets: 0
- Homebrew `ui-tars` cask version: 0.2.4
- Open security PR observed: #1894, DNS-rebinding host-header validation for Agent TARS/Tarko local servers, unmerged at review time
- License: Apache-2.0
- Homepage: https://agent-tars.com
