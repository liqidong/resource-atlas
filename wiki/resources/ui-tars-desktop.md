---
title: UI-TARS Desktop
resource_id: res_20260518_ui_tars_desktop_e9f3387
slug: ui-tars-desktop
canonical_slug: ui-tars-desktop
aliases:
  - UI-TARS Desktop
  - UI-TARS-desktop
  - Agent TARS
  - TARS Stack
resource_type: github_repo
source_url: https://github.com/bytedance/UI-TARS-desktop
canonical_source: https://github.com/bytedance/UI-TARS-desktop
local_source: sources/github/bytedance__UI-TARS-desktop/
source_kind: github
source_fingerprints:
  - git:e9f3387288da4af2ad99972da2ac916cdabce093
  - tree-content-sha256:28b651aa458c23264bf8d7e59ef91ed6fa59a291cc5e20fb517e30b66e75c7c5
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: e9f3387288da4af2ad99972da2ac916cdabce093
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: shortlisted
maturity: experimental_useful
recommendation: recommended_with_caveats
fit_for_user: high
time_to_value: medium
setup_cost: high
maintenance_burden: high
risk_level: high
evidence_quality: medium_high
will_i_actually_use_this: maybe
public_ready: yes
private_notes: no
source_publishable: partial
language: en
redaction_needed: no
tags:
  - gui-agent
  - computer-use
  - browser-agent
  - desktop-automation
  - multimodal-agent
  - vision-language-model
  - mcp
  - agent-framework
  - ui-automation
  - open-source-template
use_cases:
  - learn-gui-agent-architecture
  - build-computer-use-agent
  - compare-computer-use-agents
recommended_for:
  - 学习桌面/浏览器 GUI agent 的截图、VLM、动作解析、执行循环
  - 参考 Electron 桌面 agent、SDK、operator、MCP/browser infra 的组合方式
  - 比较 computer-use agent 的本地权限、远程模型、遥测和安全边界
not_recommended_for:
  - 想要零配置、稳定、可完全信任的日常桌面助手
  - 不能接受屏幕截图发往模型 endpoint 的隐私敏感工作流
  - 不想处理 Node/Electron、系统权限、VLM endpoint、远程服务和版本漂移的人
confidence: medium_high
---

# UI-TARS Desktop

## Beginner Verdict

- What this is: ByteDance 的开源多模态 agent monorepo，包含 UI-TARS Desktop 桌面 GUI agent、Agent TARS CLI/Web UI、GUI agent SDK、operator、browser/MCP infra 和示例。
- Who should care: 想研究 computer-use / browser-use / GUI agent 架构，或者想搭一个能看屏幕、调用 VLM、解析动作并控制电脑/浏览器的开发者。
- When I should remember it: 当我想看“视觉模型驱动桌面自动化”的完整工程栈，尤其是 screenshot -> VLM -> action parser -> operator execute 的循环。
- Not for: 完全非技术用户、隐私敏感桌面任务、需要稳定生产级 autonomous desktop assistant 的场景。
- Setup difficulty: 中高。桌面 app 需要系统权限；本地 operator 还需要配置 VLM endpoint；开发运行是 pnpm/Electron/TypeScript monorepo。
- My verdict: 推荐入库，但必须带 caveats。它是很有价值的参考实现和 watchlist 项，不应被当作“完全本地、开箱即可信”的桌面代理。

## One-Sentence Summary

UI-TARS Desktop 是 ByteDance 的 computer-use / browser-use agent 栈，把屏幕截图、OpenAI-compatible VLM 调用、动作解析、Electron 桌面控制、浏览器 operator、MCP infra 和 Agent TARS UI/CLI 组织在一个大型 TypeScript monorepo 里。

Community signal observed on 2026-05-18: GitHub API/page showed 34,494 stars, 3,455 forks, 317 open issues, 75 open pull requests, 1,109 commits, Apache-2.0 license, latest default-branch commit `e9f3387`, and latest GitHub release `v0.3.0` with no release assets in the API. Homebrew Formulae listed the `ui-tars` cask at `0.2.4`.

## What It Is

这个仓库最早看名字像“UI-TARS Desktop app”，但现在更像 TARS Stack monorepo。

它主要有三层价值：

- 可用产品层：UI-TARS Desktop 是 Electron 桌面应用，提供 Local Computer Operator、Local Browser Operator、Remote Computer Operator、Remote Browser Operator。它通过自然语言任务、截图、VLM 预测和动作执行来控制电脑或浏览器。
- 工程参考层：仓库还发布/维护 `@ui-tars/sdk`、`@ui-tars/action-parser`、`@ui-tars/operator-nut-js`、`@ui-tars/operator-browser`、`@ui-tars/cli`、`@ui-tars/visualizer`，以及 Agent Infra 的 browser、browser-use、MCP client/server、filesystem/command/search/browser MCP servers。
- 平台演进层：`multimodal/agent-tars` 和 `multimodal/tarko` 已经把 Agent TARS CLI/Web UI、agent server/server-next、model provider、MCP agent、context engineer 等放进同一个 monorepo。

README 还把 Agent TARS 放在同一个入口里：一个面向 CLI/Web UI、MCP、browser/computer/product 工具的通用多模态 agent stack。

## What Problem It Solves

它解决的是“GUI agent 工程怎么落地”这个问题。

普通 demo 常停在“模型输出一个点击坐标”。这个仓库展示了更完整的一圈：

1. 读取用户 instruction。
2. 从本地电脑、浏览器或远程环境获取截图。
3. 将 instruction、历史上下文、最近截图压缩后发给 VLM。
4. 解析模型输出的动作，例如 click、type、drag、scroll、finish。
5. 用 NutJS/browser/remote operator 执行动作。
6. 把过程、截图、预测、耗时和状态显示/记录出来。

对 Resource Atlas 来说，它的价值不是“马上替代人工操作电脑”，而是用来学习和比较 computer-use agent 的工程边界。

## Who It Is For

适合：

- 想理解 GUI agent loop 的开发者。
- 想做桌面自动化、浏览器自动化、computer-use agent 的人。
- 想研究 UI-TARS / Doubao / Seed VLM 如何接进动作执行系统的人。
- 想参考 Electron app + TypeScript SDK + operator package + visualizer + MCP infra 的大型 monorepo。
- 想比较 UI-TARS、browser-use、OpenAI/Anthropic computer-use、Agent TARS、LangGraph research agent 的人。

不太适合：

- 只想下载一个稳定桌面助手开始工作的用户。
- 不能给 app 屏幕录制、辅助功能、键鼠控制权限的环境。
- 不能接受截图和指令进入 VLM endpoint 的隐私敏感任务。
- 对 Node/Electron/pnpm、模型 endpoint、远程 operator、MCP 权限模型没有耐心的人。

## How It Works

UI-TARS Desktop 的本地路径大致是：

1. Electron app 保存设置：VLM provider、base URL、API key、model name、operator、最大循环次数、浏览器搜索引擎、可选 report/UTIO endpoint。
2. 用户选择 operator：local computer、local browser、remote computer、remote browser。
3. `runAgent.ts` 创建相应 operator，并构造 `GUIAgent`。
4. `GUIAgent` 循环调用 `operator.screenshot()`，把截图放进 conversation。
5. `Model.ts` 用 OpenAI-compatible client 调 Chat Completions 或 Responses API；图片会先按 UI-TARS 版本压缩。
6. `action-parser` 把 VLM 输出转成坐标和动作。
7. operator 执行动作，然后继续下一轮截图，直到完成、停止、报错或达到 max loop。

SDK 文档把核心抽象说得很清楚：`GUIAgent` 持有 `UITarsModel` 和 `Operator`，而 operator 只需要实现 `screenshot()` 和 `execute()`。

## How To Use It

Installer/version caveat first: this intake did not verify release binaries or a Homebrew install. The GitHub release API showed `v0.3.0` without binary assets, while Homebrew listed `0.2.4`, so treat install paths as things to verify before recommending it to a beginner.

作为用户试用：

1. 安装 UI-TARS Desktop release 或 Homebrew cask。
2. 在 macOS 上授予 Accessibility 和 Screen Recording 权限；浏览器 operator 需要 Chrome/Edge/Firefox。
3. 配置 VLM provider、base URL、API key、model name。
4. 选择 Local Computer 或 Local Browser operator。
5. 输入自然语言任务，观察 agent 循环执行。

作为 Agent TARS CLI 试用，README 给的是 `npx @agent-tars/cli@latest` 或全局安装路径。这里要注意：root monorepo 要求 Node 20+，Agent TARS/Tarko 相关包要求 Node 22+。

作为开发者参考：

1. 看 `docs/sdk.md` 理解 `GUIAgent`、`Model`、`Operator`。
2. 看 `packages/ui-tars/sdk/src/GUIAgent.ts` 和 `Model.ts` 理解截图、模型调用、动作解析。
3. 看 `apps/ui-tars/src/main/services/runAgent.ts` 理解桌面 app 如何选择 operator 和组装 agent。
4. 看 `packages/ui-tars/operators/*` 学习不同环境的 operator。
5. 看 `packages/agent-infra/mcp-servers/*` 理解它如何把 browser/search/filesystem/commands 包装成 MCP 工具。

## Source Walkthrough

- `README.md`: 入口已经变成 TARS stack，总览 Agent TARS 和 UI-TARS Desktop。
- `docs/quick-start.md`: 桌面 app 安装、权限、remote operator 说明、Hugging Face 和 VolcEngine VLM 配置。
- `docs/setting.md`: VLM 设置、local browser search engine、可选 report storage、可选 UTIO telemetry/event collection。
- `docs/preset.md`: 本地/远程 preset 导入，远程 preset 可以开启动同步。
- `docs/sdk.md`: GUI agent 的核心抽象和执行序列。
- `apps/ui-tars/package.json`: Electron/Vite 桌面 app，依赖 `@computer-use/nut-js`、permission helpers、Electron Forge、Vite、Vitest。
- `apps/ui-tars/src/main/services/runAgent.ts`: local/remote operator 选择、VLM config、UTIO instruction event、`GUIAgent` 启动。
- `apps/ui-tars/src/main/store/setting.ts`: 默认设置和 remote preset fetch。
- `packages/ui-tars/sdk/src/GUIAgent.ts`: 截图、conversation、loop、model invoke、action execute 的核心循环。
- `packages/ui-tars/sdk/src/Model.ts`: OpenAI client、Chat Completions/Responses API、图片压缩、action parser。
- `packages/ui-tars/operators/*`: NutJS、browser、Browserbase、ADB operator。
- `packages/agent-infra/*`: browser control、browser-use、MCP client/server、search/filesystem/commands/browser MCP servers。
- `multimodal/agent-tars/*`: Agent TARS CLI、core、interface 等包。
- `multimodal/tarko/*`: Tarko agent kernel、CLI、server/server-next、UI、model provider、LLM client、MCP agent、context engineer。
- `apps/ui-tars/src/main/remote/*`: remote operator auth、proxy/subscription client、remote computer/browser control glue。
- `examples/gui-agent-2.0`: 新版 GUI agent 示例。

Local validation: parsed 80 upstream `package.json` files successfully from a temporary shallow clone. Full install/build/runtime tests were not attempted.

## What It Can Do Well

- Provides a concrete end-to-end GUI agent loop rather than just a model benchmark.
- Separates model, action parser, and operator enough to study or reuse pieces.
- Shows both desktop and browser operation paths.
- Has reusable SDK, CLI, visualizer, and operator packages.
- Includes MCP infra that is relevant beyond UI-TARS Desktop.
- Has strong community attention and active development.
- Apache-2.0 license makes it easier to inspect and reuse patterns.

## Limits And Risks

- Privacy boundary is easy to misunderstand. Local operator does not mean local model. Screenshots and instructions are sent to the configured VLM endpoint unless that endpoint is self-hosted locally.
- README says processing is fully local, but quick-start examples use Hugging Face and VolcEngine endpoints, remote operators use remote services, and optional report/UTIO settings upload data.
- The remote operator free service was documented as ending on 2025-08-20. Since this intake is on 2026-05-18, remote operator claims and setup paths need fresh verification before use.
- Upstream docs say UI-TARS Desktop is currently single-monitor only; multi-monitor setups may fail for some tasks.
- The latest GitHub release API showed no binary assets, while Homebrew Formulae listed the macOS `ui-tars` cask at `0.2.4`; installer expectations need checking before recommending it to a beginner.
- Desktop operation requires high-trust OS permissions: screen recording, accessibility, mouse, keyboard, and browser control.
- Optional UTIO events may include instruction text and optional screenshot/report data when configured.
- Report upload endpoint currently has no built-in authentication in the documented server interface.
- Remote preset URL import can auto-sync settings at startup, which is convenient but expands the trust boundary.
- Remote auth reads a local machine identifier and creates local key material for signing remote-service requests.
- Agent TARS/Tarko local server and MCP paths can expose browser, filesystem, command, and search capabilities; command/filesystem MCP servers should be treated as high-trust tools.
- An open PR, [#1894](https://github.com/bytedance/UI-TARS-desktop/pull/1894), proposes Host header validation for an alleged DNS-rebinding issue in Agent TARS/Tarko local servers. I noted the risk but did not reproduce it.
- Large TypeScript monorepo means dependency, build, release, and package version drift are real maintenance costs.
- Open issues and PRs are high; community signal is strong, but unresolved edge cases should be expected.
- I did not run the app or evaluate task success quality, so this intake is not a reliability benchmark.

## Similar Resources

- `bytedance/UI-TARS`: model-side repository and deployment docs for UI-TARS model weights/services.
- Browser-use style agents: usually narrower browser automation, often easier to run but less general for desktop apps.
- OpenAI / Anthropic computer-use APIs: hosted model/tool interfaces rather than a full open-source Electron/SDK stack.
- Agent TARS: now co-located in the same repo and worth tracking as a broader multimodal agent platform.
- [Local Deep Researcher](local-deep-researcher.md): not a GUI agent, but useful contrast for graph-based research loops versus screen-control loops.

## My Judgment

推荐入库，标记为 `shortlisted`，推荐等级是 B+ as reference, B- as direct-use desktop product.

我会把它当作“computer-use agent 工程参考栈”和“值得观察的开源项目”，不是直接信任的自动桌面助手。它最有价值的地方是把截图、VLM、动作 parser、operator、Electron UI、browser/MCP infra 放在一个真实工程里，能帮助以后判断类似 agent 到底是 demo、SDK、产品还是平台。

最大的 caveat 是安全和隐私：一旦它能看屏幕、发截图、点鼠标、敲键盘，风险级别天然很高。再加上模型 endpoint、remote operator、UTIO、report upload、remote preset 这些可选网络边界，使用前必须明确每一条数据去哪儿。

Judgment axes:

- fit for user: high for learning/reference
- time to value: medium
- setup cost: high
- maintenance burden: high
- maturity: useful but moving fast
- evidence quality: medium-high overall: high for source structure, medium for runtime usability because the app was not run
- risk level: high

## When To Remember This

- “我想看 GUI agent 是怎么把截图变成动作的。”
- “我想搭一个 computer-use / browser-use agent，需要参考 SDK 和 operator 边界。”
- “我想比较哪些桌面 agent 真本地，哪些只是本地执行但远程推理。”
- “我需要研究 MCP server、browser control、filesystem/command 工具怎么接进 agent stack。”
- “我看到一个声称 fully local 的 GUI agent，想检查实际网络边界。”

## Open Questions

- 当前可下载桌面 release 和 README 最新 release 标签之间是否完全一致？
- 2026-05-18 之后 remote operator 的真实可用路径是什么？
- PR #1894 指出的 DNS rebinding 风险是否会被合并、发布、或用其他方式修复？
- UI-TARS 1.5/2 在不同硬件和 endpoint 上的实际速度、成本、误操作率如何？
- 对 prompt injection、恶意网页、敏感屏幕内容、远程 preset、MCP command/filesystem 权限有没有更强的默认护栏？
- Agent TARS 与 UI-TARS Desktop 后续是否会分仓、合并路线，还是继续共享 monorepo？

## Source Evidence

- Source manifest: `sources/github/bytedance__UI-TARS-desktop/snapshots/2026-05-18-e9f3387/manifest.yaml`
- Evidence snapshot: `sources/github/bytedance__UI-TARS-desktop/snapshots/2026-05-18-e9f3387/snapshot.md`
- Upstream source: https://github.com/bytedance/UI-TARS-desktop
- Reviewed commit: `e9f3387288da4af2ad99972da2ac916cdabce093`
- Latest release observed: `v0.3.0`, published 2025-11-04
- Homebrew Formulae cask observed: `ui-tars` at `0.2.4` on 2026-05-18
- GitHub page/API observed on 2026-05-18 for community signal and license.

## Evidence Standard

```yaml
evidence_reviewed:
  - README.md
  - README.zh-CN.md
  - docs/quick-start.md
  - docs/setting.md
  - docs/preset.md
  - docs/sdk.md
  - docs/deployment.md
  - package.json
  - pnpm-workspace.yaml
  - .env.example
  - apps/ui-tars/package.json
  - apps/ui-tars/src/main/services/runAgent.ts
  - apps/ui-tars/src/main/store/setting.ts
  - apps/ui-tars/src/main/services/utio.ts
  - apps/ui-tars/src/main/remote/auth.ts
  - apps/ui-tars/src/main/remote/proxyClient.ts
  - packages/ui-tars/sdk/src/GUIAgent.ts
  - packages/ui-tars/sdk/src/Model.ts
  - packages/ui-tars package manifests
  - packages/agent-infra package manifests
  - multimodal/agent-tars package areas
  - multimodal/tarko package areas
  - GitHub PR #1894 metadata and summary
  - GitHub repository page and API metadata
evidence_not_reviewed:
  - Desktop app install and runtime behavior with OS permissions
  - Real VLM endpoint quality, cost, latency, and safety
  - Release binary contents
  - Full bytedance/UI-TARS model repository and model weights
  - External hosted docs and cloud services
  - Security audit of remote operators, MCP servers, or report/UTIO services
  - Reproduction of PR #1894 DNS-rebinding claim
ran_locally: partial
run_notes: Parsed 80 upstream package.json files from a temporary shallow clone. Did not install dependencies, build Electron app, or run GUI tasks.
license_checked: Apache-2.0 from GitHub API and upstream LICENSE.
security_or_privacy_notes: High-trust desktop permissions plus screenshot-to-VLM behavior require explicit network-boundary review. Optional UTIO/report/preset features can send data to configured URLs.
confidence_limits: Strong confidence in source structure and documented behavior; medium confidence in real-world usability because runtime was not tested.
```

## Update History

- 2026-05-18: Initial full-analysis intake at `bytedance/UI-TARS-desktop@e9f3387`.
