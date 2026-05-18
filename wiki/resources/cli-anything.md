---
title: CLI-Anything
resource_id: res_20260518_cli_anything_a32f11f
slug: cli-anything
canonical_slug: cli-anything
aliases:
  - CLI-Anything
  - HKUDS/CLI-Anything
  - CLI-Hub
  - cli-anything-hub
resource_type: github_repo
source_url: https://github.com/HKUDS/CLI-Anything
canonical_source: https://github.com/HKUDS/CLI-Anything
local_source: sources/github/HKUDS__CLI-Anything/
source_kind: github
source_fingerprints:
  - git:a32f11fc67052ff233dfaa5106de5bb1ccdf24ec
  - tree-content-sha256:8bdc773e140b3cbf323de096cbbcb6d6dd6ff037d64da13df596660161aebcc7
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: a32f11fc67052ff233dfaa5106de5bb1ccdf24ec
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: shortlisted
maturity: experimental_useful_fast_moving
recommendation: recommended_with_caveats
fit_for_user: high
time_to_value: medium
setup_cost: high
maintenance_burden: high
risk_level: high
evidence_quality: medium_high
will_i_actually_use_this: yes
public_ready: yes
private_notes: no
source_publishable: partial
language: multilingual
redaction_needed: no
tags:
  - agent-skills
  - coding-agent
  - claude-code
  - codex-cli
  - agent-native-cli
  - cli-generation
  - cli-hub
  - software-automation
  - desktop-automation
  - browser-agent
  - agent-tooling
  - open-source-template
use_cases:
  - build-agent-native-cli-harness
  - study-agent-skill-packaging
  - compare-computer-use-agents
recommended_for:
  - 学习如何把 GUI、桌面软件、Web 服务或开源项目包装成 agent 可用的结构化 CLI
  - 参考 Claude Code plugin、Codex skill、OpenCode commands、CLI-Hub registry 和 SKILL.md 生态如何组合
  - 比较截图/鼠标式 computer-use agent 与 CLI-first agent 工具化路线
not_recommended_for:
  - 想要零风险安装任意社区 harness、npm/brew/curl 脚本或未审第三方 CLI 的工作流
  - 需要成熟稳定的单一产品而不是快速演化的 monorepo、方法论和 registry 生态
  - 不能接受 agent 运行真实软件、远程 API、凭据型服务或默认 CLI-Hub analytics 的隐私敏感场景
confidence: high
---

# CLI-Anything

## Beginner Verdict

- What this is: HKUDS 做的 agent-native CLI 生态，把 GUI 软件、桌面应用、Web 服务或开源项目包装成 agent 更容易调用的结构化命令行工具。
- Who should care: 想让 agent 使用真实软件能力、研究 Claude/Codex skill 打包、构建 CLI harness、或比较 computer-use 路线的人。
- When I should remember it: 当我不想让 agent 盯屏幕点按钮，而是想给它一个可测试、可 JSON 输出、可安装、可发现的命令接口时。
- Not for: 低风险生产依赖、完全离线/无 telemetry/无远程 API、或不愿审查安装脚本、真实后端、凭据和 subprocess 边界的场景。
- Setup difficulty: 中高。CLI-Hub 浏览和安装已有 harness 比较快；自己生成高质量 harness 需要强模型、目标软件源代码或后端接口、测试设计、真实软件安装和反复 refine。
- My verdict: 推荐入库，标记 `recommended_with_caveats`。它的思想很对味：把 GUI/computer-use 问题转成 agent 可组合的 CLI 工具面。但它是快速演化的生态和方法论，不是可以盲装盲信的稳定产品。

## One-Sentence Summary

CLI-Anything 是一个 CLI-first agent tooling 生态，用 Claude Code plugin、Codex skill、OpenCode/Pi/Qoder/Copilot 适配、CLI-Hub registry、`SKILL.md` 生成和大量示例 harness，把真实软件能力暴露成 agent 可发现、可测试、可 JSON 调用的命令行接口。

Community signal observed on 2026-05-18: GitHub API reported 36,108 stars, 3,515 forks, 152 subscribers, 55 open issues plus PRs, Apache-2.0 license, Python as primary language, GitHub Pages enabled, and homepage `https://clianything.cc/`. GitHub web showed 38 open issues, 17 open PRs, and 640 commits. Latest GitHub release was `v0.3.0`, published on 2026-04-24.

## What It Is

CLI-Anything has several layers:

- A methodology in `cli-anything-plugin/HARNESS.md` for turning software into a stateful CLI.
- A Claude Code plugin with slash commands such as build, refine, test, validate, and list.
- A Codex skill in `codex-skill/SKILL.md` that adapts the same workflow to Codex.
- Platform adapters for Pi, OpenCode, Qodercli, GitHub Copilot CLI, and OpenClaw-style skill use.
- CLI-Hub, a package manager and registry browser for installing existing CLI harnesses.
- A root `skills/` catalog and package-local `SKILL.md` files so agents can discover each harness.
- A large monorepo of generated or contributed harnesses for tools such as Blender, LibreOffice, browser automation, Kdenlive, Zotero, Mailchimp, Exa, QGIS, LLDB, Ollama, and more.

The core promise is not "AI can click anything." It is "software can expose an agent-facing command surface that is easier to reason about, test, and compose than GUI automation."

## What Problem It Solves

Computer-use agents often fail because GUIs are noisy: screenshots are lossy, coordinates drift, modals hide state, and hidden application logic is hard to inspect. APIs solve this for some software, but many real workflows span local apps, project files, native renderers, REST services, and partially documented backends.

CLI-Anything attacks that gap by asking agents to build or install a real CLI harness:

- Probe and mutate application state through subcommands.
- Keep state in project/session files.
- Emit JSON for agent consumption.
- Provide a REPL for longer interactive work.
- Call the real backend for rendering/export when possible.
- Ship tests and `SKILL.md` docs with the CLI.

This is valuable for Resource Atlas because it reframes "agent uses software" as a tooling and interface-design problem, not only as a multimodal model problem.

## Who It Is For

Good fit:

- Agent builders studying alternatives to screenshot-and-click GUI control.
- Developers who want an agent to use an open-source application, local tool, or service through repeatable commands.
- People designing durable skills, slash commands, or MCP-like tool surfaces.
- Teams that can tolerate reviewing generated code and running real tests before trusting a harness.
- Researchers comparing interface layers for coding agents, desktop agents, browser agents, and workflow automation.

Poor fit:

- Non-technical users who expect a polished app-store experience.
- High-security environments where an agent cannot install packages or run real application backends.
- Workflows where the target software has no source, no backend API, and no stable file format.
- Teams that cannot inspect subprocess calls, path handling, API key usage, install scripts, and telemetry settings.

## How It Works

The build path asks a strong coding agent to run a multi-phase process:

1. Analyze the target codebase and find real backend engines, file formats, command systems, and APIs.
2. Design CLI command groups, a state model, output formats, and REPL behavior.
3. Implement a Python Click package under `cli_anything.<software>`.
4. Plan tests before writing them.
5. Add unit, E2E, subprocess, and artifact verification tests.
6. Document test results and usage.
7. Generate `SKILL.md` so agents can discover the harness.
8. Package and optionally publish the CLI.

Generated CLIs are expected to expose both one-shot commands and REPL mode, support `--json`, use real software backends instead of toy reimplementations, and verify outputs rather than trusting successful exit codes.

CLI-Hub is the install/discovery side. It reads live registry JSON, lists or searches available tools, installs harnesses through pip/npm/uv/brew/bundled/command strategies, and tracks local installs.

## How To Use It

For Claude Code plugin users:

```text
/plugin marketplace add HKUDS/CLI-Anything
/plugin install cli-anything
/cli-anything ./gimp
/cli-anything:refine ./gimp "batch processing and filters"
/cli-anything:test ./gimp
/cli-anything:validate ./gimp
```

For Codex, the upstream repo includes a skill installer:

```bash
git clone https://github.com/HKUDS/CLI-Anything.git
bash CLI-Anything/codex-skill/scripts/install.sh
```

For using existing tools through CLI-Hub:

```bash
pip install cli-anything-hub
cli-hub list
cli-hub search blender
cli-hub info blender
cli-hub install blender
```

Before installing any harness, inspect its registry entry, install command, dependencies, backend requirements, API keys, and tests. Treat `cli-hub install` as code execution, not as a harmless bookmark action.

## Source Walkthrough

- `README.md`: product promise, platform install flows, demos, CLI-Hub, generated CLI usage, architecture, test claims, limitations, and roadmap.
- `cli-anything-plugin/HARNESS.md`: canonical method for turning software into a stateful CLI with JSON output, REPL, backend integration, tests, `SKILL.md`, and packaging.
- `cli-anything-plugin/commands/*.md`: Claude Code slash-command surfaces for build, refine, test, validate, and list.
- `codex-skill/SKILL.md`: Codex-specific adaptation, including generated harness structure and verification expectations.
- `opencode-commands/*.md`, `.pi-extension/cli-anything/`, and `qoder-plugin/`: examples of adapting the same method to different agent hosts.
- `cli-hub/`: package manager with registry fetching, installer dispatch, preview tooling, analytics, and tests.
- `registry.json`: 60 in-repo/community CLI harness entries.
- `public_registry.json`: 16 public CLI entries that can install through npm, uv, command, bundled, or similar strategies.
- `skills/`: 56 root skill directories for agent discovery.
- Representative harnesses: `browser`, `blender`, `libreoffice`, `mailchimp`, `zotero`, and others show the standard `agent-harness` layout.
- `SECURITY.md`: threat model for autonomous agent command construction, subprocess arguments, Script-Fu, XML/SVG, paths, and credentials.
- `CONTRIBUTING.md`: requirements for in-repo and standalone harness contributions.
- `.github/scripts/validate_root_skills.py` and workflows: validation and publication signals for root skills and hub pages.

Sequential intake fallback: this repository's default intake asks for source/structure and value/use-case reviewers. In this session, subagent spawning was not available without explicit user delegation, so the integrator ran those two review passes sequentially and recorded the fallback here.

Source/structure pass result: the repo is coherent but sprawling. Root skill validation passed, registry files parsed, and the method/packaging layers line up. The full harness test suite was not run because it would require many target applications, APIs, credentials, and platform-specific backends.

Value/use-case pass result: strong fit for the atlas. It is a high-signal reference for agent-native tooling, CLI generation, skills, and alternatives to GUI agents. The right posture is to study and selectively use it, not blindly install every harness.

## What It Can Do Well

- Encode a repeatable playbook for making software agent-usable through command-line interfaces.
- Show how to package the same capability across Claude Code, Codex, Pi, OpenCode, Qodercli, and other agent hosts.
- Provide many concrete examples of stateful Python Click CLIs with tests and skills.
- Turn existing backends, project files, and APIs into structured command groups.
- Make agent tools discoverable through `SKILL.md`, registry metadata, and CLI-Hub search.
- Provide a useful counterexample to pure screenshot-based computer-use: when a CLI can exist, a CLI is often easier to inspect and test.
- Surface practical testing standards: plan tests first, call real backends, verify artifacts, and test installed commands.

## Limits And Risks

- Installation is code execution. CLI-Hub entries can invoke pip, npm, uv, brew, bundled tools, or command-style installers. Some public registry commands can include shell operators.
- "Agent-native" does not mean local-only. Many harnesses touch real services, APIs, browser sessions, desktop apps, local files, remote endpoints, and API keys.
- CLI-Hub analytics is enabled by default. Upstream documents `CLI_HUB_NO_ANALYTICS=1` as the opt-out; code sends events to PostHog by default and classifies invocation context as human, agent, or scripted.
- Generated harness quality will vary with model quality, source-code structure, backend access, and iteration. The README itself says strong foundation models and refinement are often needed.
- The monorepo changes very quickly. Registry counts, install paths, skill layout, and supported platforms may drift.
- The README's 2,280-test claim was not independently reproduced during intake. Root skill validation passed and registry JSON parsed, but full test validation would require a large backend matrix.
- Local compile over selected Python paths failed under the available Python 3.9.6, which is below upstream's declared Python 3.10+ floor. This is not a supported-runtime failure, but it leaves Python-version compatibility unverified here.
- Security review matters. Agent-provided inputs can become subprocess args, file paths, XML/SVG content, API requests, or scripts.
- For closed-source software with no API, stable project format, or scriptable backend, the "make anything a CLI" claim becomes much harder.

## Similar Resources

- [UI-TARS Desktop](https://github.com/bytedance/UI-TARS-desktop): GUI-first computer-use stack; useful contrast with CLI-first automation.
- [browser-use](https://github.com/browser-use/browser-use): browser automation agent path rather than generated desktop/software CLIs.
- [OpenAPI Generator](https://openapi-generator.tech/): API-client generation; narrower than CLI-Anything but relevant for service wrapping.
- [Model Context Protocol](https://modelcontextprotocol.io/): tool/server protocol that solves a related "agent access to capabilities" problem through a different interface layer.
- [Typer](https://typer.tiangolo.com/) and [Click](https://click.palletsprojects.com/): underlying Python CLI frameworks to compare against generated harness style.

## My Judgment

Recommended with caveats.

CLI-Anything is exactly the kind of resource this atlas should remember: ambitious, practical, agent-adjacent, and full of reusable patterns. The concept is more important than any single harness. When I need to design an agent-facing tool surface, I should review its HARNESS playbook, generated skill structure, registry metadata, and test expectations.

I would be careful before adopting CLI-Hub as an auto-installer in sensitive environments. The install and execution boundary is broad, analytics defaults need explicit handling, and individual harnesses need their own review. Treat it as a high-value reference and selective tool source, not as a blanket trust layer.

Recommendation grade: A for methodology and agent-tooling inspiration; B for immediate operational use until each target harness is reviewed and tested in its own environment.

## When To Remember This

- "我想让 agent 使用真实软件，但不想走截图/鼠标点击。"
- "我要把一个 GUI app、桌面工具、Web service 或开源 repo 变成结构化 CLI。"
- "我在设计 agent skill、slash command、CLI registry 或工具安装流程。"
- "我需要一个 Codex skill/package example，看看复杂方法论如何封装。"
- "我想比较 GUI agent、browser agent、MCP server、CLI harness 的边界。"
- "我需要提醒自己：自动安装 agent 工具之前先审 install command、analytics、API key 和 subprocess 安全。"

## Open Questions

- 在 Python 3.10/3.11 上，当前 `cli-hub` preview 模块是否完全可编译，还是实际需要 Python 3.12+？
- 哪些 harness 真正经过真实后端 E2E 验证，哪些更像 registry/demo 入口？
- CLI-Hub registry 的信任模型是否会加入签名、审计分级、或安全标签？
- 对 Resource Atlas 最有参考价值的是上游方法论、CLI-Hub、还是某几个具体 harness？
- 如果把 Resource Atlas 自己做成 agent-native CLI，应借鉴多少 CLI-Anything 的 7-phase 流程？

## Source Evidence

- Source snapshot: `sources/github/HKUDS__CLI-Anything/snapshots/2026-05-18-a32f11f/`
- Reviewed commit: `a32f11fc67052ff233dfaa5106de5bb1ccdf24ec`
- Content hash: `8bdc773e140b3cbf323de096cbbcb6d6dd6ff037d64da13df596660161aebcc7`
- GitHub API metadata observed on 2026-05-18: stars, forks, subscribers, open issue/PR aggregate, license, homepage, Pages, primary language, and release metadata.
- GitHub web metadata observed on 2026-05-18: issue count, PR count, commit count, repository file tree, README, and license display.
- Local evidence review used a temporary shallow clone and did not retain the upstream source tree.

## Evidence Standard

```yaml
evidence_reviewed:
  - README.md
  - README_CN.md
  - cli-anything-plugin/HARNESS.md
  - cli-anything-plugin/commands/*.md
  - codex-skill/SKILL.md
  - cli-hub/README.md
  - cli-hub/cli_hub/registry.py
  - cli-hub/cli_hub/installer.py
  - cli-hub/cli_hub/analytics.py
  - registry.json
  - public_registry.json
  - skills/ root catalog inventory
  - representative agent-harness directories
  - browser harness security code and tests
  - SECURITY.md
  - CONTRIBUTING.md
  - GitHub API and web metadata
evidence_not_reviewed:
  - Full upstream harness test suite
  - Real target application E2E runs
  - CLI-Hub install of every registry entry
  - Security audit of every generated harness
  - Published PyPI package contents versus repository source
ran_locally: partial
run_notes: "Registry JSON parsed and root skill validation passed from a temporary clone. Full harness tests were not run because they require many real backends, credentials, and platform-specific software. Selected Python compile failed under local Python 3.9.6, below the upstream Python 3.10+ requirement."
license_checked: true
security_or_privacy_notes: "Apache-2.0 license. Main risk is not license but execution boundary: install commands, subprocess calls, remote APIs, API keys, browser/desktop automation, and CLI-Hub analytics. Set CLI_HUB_NO_ANALYTICS=1 when needed and review individual harnesses before use."
confidence_limits: "High confidence in repository structure and value judgment; medium confidence in runtime quality of individual harnesses because full E2E validation was not reproduced."
```

## Update History

- 2026-05-18: Initial full analysis at `HKUDS/CLI-Anything@a32f11f`; added as shortlisted `recommended_with_caveats`.
