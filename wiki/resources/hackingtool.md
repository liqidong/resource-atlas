---
title: HackingTool
resource_id: res_20260518_hackingtool_01a51bb
slug: hackingtool
canonical_slug: hackingtool
aliases:
  - hackingtool
  - HackingTool
  - Z4nzu/hackingtool
  - All-in-One Hacking Tool
resource_type: github_repo
source_url: https://github.com/Z4nzu/hackingtool
canonical_source: https://github.com/Z4nzu/hackingtool
local_source: sources/github/Z4nzu__hackingtool/
source_kind: github
source_fingerprints:
  - git:01a51bbca6d0c7a20696aeef9ed92b143e26b10c
  - tree-content-sha256:f0d318df9435ce45c18a76c6452b404c3caae76b0769726bfe900073b6fb0787
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: 01a51bbca6d0c7a20696aeef9ed92b143e26b10c
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: watchlist
maturity: active_high_risk
recommendation: not_recommended_for_direct_use
fit_for_user: low
time_to_value: medium
setup_cost: high
maintenance_burden: high
risk_level: high
evidence_quality: medium_high
will_i_actually_use_this: no
public_ready: yes
private_notes: no
source_publishable: partial
language: en
redaction_needed: no
tags:
  - cybersecurity
  - penetration-testing
  - red-team-tools
  - security-toolkit
  - tool-aggregator
  - command-runner
  - supply-chain-risk
  - dual-use-security
use_cases:
  - study-security-tool-aggregators
  - evaluate-dual-use-install-boundaries
recommended_for:
  - 研究 all-in-one 安全工具聚合器如何组织菜单、标签、系统检测和安装命令
  - 作为高风险安装边界、第三方工具供应链和 dual-use scope 的反面/谨慎案例
  - 从防守视角盘点哪些上游工具需要单独评估，而不是盲信聚合器
not_recommended_for:
  - 日常直接安装或在个人主力机器上运行一键脚本
  - 未授权目标、真实公共网络、社工、DDoS、payload、RAT、C2 或持久化操作
  - 想找高质量 AI/agent 资源、成熟蓝队平台、可审计企业安全产品或低风险学习材料
confidence: high
---

# HackingTool

## Beginner Verdict

- What this is: 一个 Python 写的 all-in-one 安全工具菜单、安装器和命令启动器，聚合 20 个类别、185 个第三方工具入口。
- Who should care: 想研究安全工具聚合器、命令启动器、root 安装边界、供应链风险和 dual-use 工具分类的人。
- When I should remember it: 当我需要提醒自己“安全工具目录”和“帮用户一键安装/运行高风险命令”是两种完全不同的信任边界时。
- Not for: 个人主力机器日常安装、未授权测试、公共目标、社工、DDoS、payload、RAT、C2、持久化、或任何没有明确授权和隔离实验环境的场景。
- Setup difficulty: 高。它自己的代码不大，但安装器和菜单会拉取许多第三方项目、系统包、语言包和命令行工具。
- My verdict: 入库为 `watchlist`，但标记 `not_recommended_for_direct_use`。它值得作为高风险聚合器案例和安装边界教材，不值得作为默认安全工具箱。

## One-Sentence Summary

HackingTool 是一个高人气 Python 安全工具聚合器，把大量 OSINT、Web、无线、取证、云、移动、payload、phishing、DDoS、post-exploitation、RAT/C2 类工具放进统一菜单；它的主要价值是帮助我审视 dual-use 工具聚合和安装边界，而不是直接采用。

Community signal observed on 2026-05-18: GitHub API reported 75,234 stars, 8,483 forks, 1,430 subscribers, 108 open issues plus pull requests, MIT license, Python as primary language, no GitHub Pages, no latest release, and latest tag `v1.1.0`. The README presents the current code as v2.0.0.

## What It Is

HackingTool is a Python 3.10+ terminal menu that groups security tools into categories, shows install status, searches by keyword, filters by tags, recommends tools for common tasks, and provides install/run/update/open-folder actions.

It is not a single security engine. It is a wrapper around third-party tools and package-manager commands. The reviewed source contains 64 tracked files and 185 `HackingTool` wrapper classes, but it does not vendor the actual upstream tools. Those are fetched later through `git clone`, package managers, language-specific installers, downloaded scripts, or system packages.

The project has been modernized in its current branch: richer terminal UI, OS-aware filtering, Python version guards, Docker support, and some fixes that replace older unsafe command patterns. That modernization makes it easier to review, but it does not make the operational boundary low-risk.

## What Problem It Solves

For beginners or lab users, the project tries to solve discovery friction: "Which tool should I install for recon, web testing, wireless testing, mobile testing, forensics, payload generation, or post-exploitation?"

For this atlas, the more important problem is trust-boundary analysis. HackingTool compresses many different risks into one interface:

- source discovery
- installation
- system package mutation
- third-party code fetch
- command execution
- elevated privileges
- lab target interaction
- offensive-security workflows

That makes it a strong case study for why Resource Atlas should separate "useful resource to know" from "safe tool to run."

## Who It Is For

Good fit:

- Security learners using disposable labs who want to understand the landscape of common tooling.
- Engineers reviewing how all-in-one tool aggregators are structured.
- People designing safer installers, command runners, or agent tools and needing an example with a wide risk surface.
- Defensive teams auditing which upstream tools a wrapper can pull into an environment.

Poor fit:

- Anyone without explicit authorization for the target environment.
- Users who want a trustworthy one-command security setup.
- Personal machines with valuable credentials, browser sessions, SSH keys, or production access.
- Teams that need pinned versions, reproducible builds, reviewed upstream provenance, or enterprise governance.
- Anyone looking for AI, agent, or coding-agent resources.

## How It Works

The code has three main layers:

1. `hackingtool.py` wires the main menu, categories, search, tag filtering, and recommendation prompts.
2. `core.py` defines base `HackingTool` and `HackingToolsCollection` behavior, including install, run, update, open-folder, category navigation, and install-all.
3. `tools/*.py` defines each tool wrapper with metadata and install/run commands.

The installer layer sets up the wrapper itself. It checks Python version and OS support, installs system dependencies, clones or copies the project, creates a virtualenv, installs Python requirements, and creates a launcher.

The actual category entries then fetch or launch third-party tools. Some are relatively normal defensive utilities. Others are clearly dual-use or offensive. The central implementation concern is that the wrapper often stores command strings and executes them through a shell, sometimes with elevated privileges.

## How To Use It

I should not use HackingTool as my default security toolbox. If I ever need to inspect it again:

- Re-fetch the reviewed commit or current branch in a disposable environment.
- Read the specific category file before running anything.
- Prefer the upstream project directly when the tool is legitimate and needed.
- Pin versions and review licenses/provenance for each upstream tool.
- Never run install-all on a real workstation.
- Keep all testing inside an authorized lab, VM, or disposable container.

For direct security work, use well-maintained upstream projects or official distribution packages with clear documentation and scope, rather than relying on this wrapper to choose and install them.

## Source Walkthrough

- `README.md`: product pitch, v2.0.0 claim, 20 categories, 185+ tools, one-line install posture, quick commands, and high-risk category list.
- `hackingtool.py`: main category registry, menu rendering, search, tag index, task recommendations, and a warning that use should be authorized.
- `core.py`: shared install/run/update behavior, install-all category flow, shell command execution, installed-state detection, and open-folder support.
- `install.sh` and `install.py`: privileged installation, package-manager setup, GitHub clone/copy, virtualenv setup, launcher creation, and user config creation.
- `os_detect.py`, `constants.py`, and `config.py`: OS/package-manager detection, default paths, privilege helper, and config loading.
- `tools/ddos.py`, `tools/phishing_attack.py`, `tools/payload_creator.py`, `tools/post_exploitation.py`, `tools/remote_administration.py`, and `tools/wireless_attack.py`: high-risk dual-use/offensive categories.
- `tools/information_gathering.py`, `tools/web_attack.py`, `tools/forensics.py`, `tools/cloud_security.py`, `tools/mobile_security.py`, and related modules: mixed defensive and dual-use entries.
- `Dockerfile` and `docker-compose.yml`: Kali-based local container option, though containerization does not make launched tools automatically safe.
- `.github/workflows/*`: lint, static checks, install smoke tests, and menu smoke tests.
- `LICENSE`: MIT license.

Sequential intake fallback: this repository's default intake asks for source/structure and value/use-case reviewers. In this session, subagent spawning was not available without explicit user delegation, so the integrator ran those two review passes sequentially and recorded the fallback here.

Source/structure pass result: the wrapper is small enough to inspect and the current source compiles under Python 3.12. The category model is coherent. The risk lives mostly in the external commands and third-party tools it can fetch and run.

Value/use-case pass result: useful as a watchlist and cautionary reference, not as a tool to adopt. Its strongest atlas value is teaching how to review install boundaries for dual-use command launchers.

## What It Can Do Well

- Show a compact architecture for a terminal menu around many tool wrappers.
- Make OS support, category browsing, tag filtering, and search visible to users.
- Demonstrate how security tool aggregators turn messy command catalogs into a single interface.
- Provide a concrete source base for auditing install/run/update command boundaries.
- Surface many common security-tool categories in one place for landscape review.
- Offer a Docker path for easier isolation than installing directly onto a workstation, although the launched tools still need scope control.

## Limits And Risks

- The project aggregates dual-use and offensive categories, including phishing, DDoS, payload creation, post-exploitation, wireless attacks, RAT-style remote administration, and C2-like tooling.
- Installation and runtime behavior can mutate the host: package-manager installs, system paths, virtualenvs, downloaded scripts/binaries, cloned repositories, and commands with elevated privileges.
- "185+ tools" does not mean 185 maintained, reviewed, pinned, or safe tools. Many entries depend on upstream repositories with their own licenses, health, risks, and trust models.
- The install-all category action widens the blast radius by running many third-party install commands.
- The wrapper often executes shell command strings; some code has been improved, but the command-runner model remains inherently risky.
- CI is shallow for this kind of project. Syntax/lint/install/menu smoke tests do not validate legal scope, third-party behavior, exploit safety, network boundaries, or every runtime path.
- Versioning is slightly confusing: README says v2.0.0, while GitHub releases were absent and the latest tag observed was v1.1.0.
- It is not an AI or agent resource, so its fit with the main Resource Atlas theme is low.

## Similar Resources

- Kali Linux metapackages and official Kali Tools pages: better-governed references for security-tool discovery.
- BlackArch Linux tool catalog: large security tool index with distribution packaging context.
- OWASP ZAP, Nuclei, ffuf, Amass, theHarvester, and other individual upstream tools: usually better reviewed directly than through a broad wrapper.
- ProjectDiscovery ecosystem: narrower modern security tooling with stronger docs and update paths than a generic all-in-one launcher.
- CLI-Anything: relevant contrast for agent-facing command surfaces; HackingTool is a cautionary example of command execution without the same verification discipline.

## My Judgment

Not recommended for direct use.

HackingTool is popular and the current code is more organized than I expected, but popularity is not trust. The wrapper adds convenience while also hiding a large amount of install and execution risk behind menu choices. For benign discovery, the README category list is useful. For real work, I would go to specific upstream tools, pin versions, read their docs, and run them in a lab.

I want this in the atlas because it is memorable: a single repository where source cataloging, package installation, offensive tooling, root commands, and user convenience all collide. That makes it a good cautionary reference for Resource Atlas itself, especially as agent tooling starts installing and running external capabilities on behalf of users.

Recommendation grade: C as a security-tool discovery list; B as a cautionary install-boundary case study; D for direct operational use.

## When To Remember This

- "我看到一个安全工具 all-in-one 菜单，想判断它是不是可以直接跑。"
- "我要设计 installer / command runner / agent tool，需要想清楚 install 和 run 的信任边界。"
- "某个项目把 catalog、安装器和执行器混在一起，我需要一套审查清单。"
- "我想提醒自己：GitHub stars 不是安全审计，wrapper 不是 provenance。"
- "我需要解释为什么 dual-use 安全工具必须放在授权实验环境里，而不是主力机器。"

## Open Questions

- v2.0.0 是否会发布正式 tag 或 release，还是只存在于 README 和 master 分支？
- 185 个工具入口中，哪些上游项目仍活跃、哪些已经归档、哪些有已知安全或法律风险？
- 是否会加入更严格的 command preview、version pinning、checksum/signature、allowlist、scope warnings 或 lab-only guardrails？
- Docker 路径是否足够隔离真实使用，还是仍然会鼓励用户在容器内运行未经审查的攻击链？
- 对 Resource Atlas 来说，是否应该把这类非 AI 高风险工具长期留在 watchlist，还是后续降级为 rejected/non-fit？

## Source Evidence

- Source snapshot: `sources/github/Z4nzu__hackingtool/snapshots/2026-05-18-01a51bb/`
- Reviewed commit: `01a51bbca6d0c7a20696aeef9ed92b143e26b10c`
- Content hash: `f0d318df9435ce45c18a76c6452b404c3caae76b0769726bfe900073b6fb0787`
- GitHub API metadata observed on 2026-05-18: stars, forks, subscribers, open issue/PR aggregate, license, primary language, default branch, tag metadata, release status, and homepage/Pages status.
- GitHub web metadata observed on 2026-05-18: repository title, description, file tree, README, license display, visible category claims, and current branch display.
- Local evidence review used a temporary shallow clone and did not retain the upstream source tree.

## Evidence Standard

```yaml
evidence_reviewed:
  - README.md
  - hackingtool.py
  - core.py
  - install.sh
  - install.py
  - os_detect.py
  - constants.py
  - config.py
  - tools/*.py category modules
  - tools/others/*.py category modules
  - Dockerfile
  - docker-compose.yml
  - .github/workflows/lint_python.yml
  - .github/workflows/test_install.yml
  - LICENSE
  - GitHub API and web metadata
evidence_not_reviewed:
  - Full source audit of every referenced third-party tool
  - Runtime execution of any security tool
  - One-line installer execution
  - Install-all category behavior
  - Docker build or container runtime behavior
  - Legal review of every upstream tool and use case
  - Malware analysis of third-party payload, phishing, C2, RAT, or post-exploitation tools
ran_locally: partial
run_notes: "Shallow-cloned the repository, counted source inventory, inspected representative high-risk categories and installer paths, and ran Python compile validation with Python 3.12.13. No installer or third-party security tool was installed or executed."
license_checked: true
security_or_privacy_notes: "MIT license for the wrapper. Operational risk is high because the project can install and run many dual-use third-party tools, often with elevated privileges, network access, shell command strings, and system package changes. Use only for authorized lab review, preferably disposable and isolated."
confidence_limits: "High confidence in source structure and recommendation. Medium confidence in runtime quality because third-party tools and install commands were not executed or audited individually."
```

## Update History

- 2026-05-18: Initial full analysis at `Z4nzu/hackingtool@01a51bb`; added as `watchlist` and `not_recommended_for_direct_use`.
