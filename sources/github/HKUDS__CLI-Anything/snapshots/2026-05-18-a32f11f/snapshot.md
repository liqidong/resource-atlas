# Source Snapshot: CLI-Anything

- Source: https://github.com/HKUDS/CLI-Anything
- Reviewed ref: `a32f11fc67052ff233dfaa5106de5bb1ccdf24ec`
- Reviewed date: 2026-05-18
- Upstream version signal: `main@a32f11f / cli-hub v0.3.0`
- Latest release observed: `v0.3.0`, published 2026-04-24T15:49:56Z
- Temporary clone size: 61M
- Upstream tracked files: 1,494
- Root skill directories: 56
- `SKILL.md` files: 114
- Agent harness packages: 53
- CLI-Hub registry entries: 60 in-repo/community harnesses plus 16 public CLI entries
- GitHub API observed on 2026-05-18: 36,108 stars, 3,515 forks, 152 subscribers, 55 open issues plus pull requests, Apache-2.0 license, Python primary language, GitHub Pages enabled.
- GitHub web observed on 2026-05-18: 38 open issues, 17 open PRs, 640 commits.
- Validation run: registry JSON parsed, root skill validation passed, and selected code/policy files were inspected. Full harness tests were not run.

## Evidence Files Reviewed

- `README.md`: project positioning, quick-start flows for Claude Code, Pi, OpenCode, Qodercli, OpenClaw, Codex, GitHub Copilot CLI, CLI-Hub overview, demos, test claims, architecture, limitations, and roadmap.
- `cli-anything-plugin/HARNESS.md`: canonical 7-phase method for analyzing software, designing CLI architecture, implementing stateful Click CLIs, planning/writing tests, documenting results, generating `SKILL.md`, and packaging.
- `cli-anything-plugin/commands/*.md`: slash-command surfaces for build, refine, test, validate, and list flows.
- `codex-skill/SKILL.md`: Codex-specific adaptation of the CLI-Anything methodology and expected generated harness structure.
- `opencode-commands/*.md` and `.pi-extension/cli-anything/`: platform-specific command and extension packaging examples.
- `cli-hub/README.md`, `cli-hub/cli_hub/registry.py`, `cli-hub/cli_hub/installer.py`, and `cli-hub/cli_hub/analytics.py`: package manager behavior, live registry URLs, installation strategies, analytics defaults, opt-out environment variable, and subprocess boundaries.
- `registry.json` and `public_registry.json`: machine-readable CLI catalog entries, install commands, categories, dependency requirements, and skill metadata.
- `skills/`: canonical root skill catalog generated for individual harnesses.
- Representative harnesses under `browser/agent-harness`, `blender/agent-harness`, `libreoffice/agent-harness`, `mailchimp/agent-harness`, and `zotero/agent-harness`: structure, tests, backend wrappers, and skill copies.
- `browser/agent-harness/cli_anything/browser/utils/security.py` and `tests/test_security.py`: URL validation and local/private network blocking for the browser harness.
- `SECURITY.md`: threat model for agent-controlled subprocess arguments, Script-Fu injection, XML/SVG injection, path traversal, and credential exposure.
- `CONTRIBUTING.md`: requirements for adding in-repo and standalone harnesses, registry fields, test expectations, and PR workflow.
- `.github/workflows/*` and `.github/scripts/validate_root_skills.py`: root skill validation and registry/site publication signals.
- `LICENSE`: Apache License 2.0.

## Key Findings

- CLI-Anything is not a single CLI wrapper. It is a method, plugin, skill, registry, package manager, and monorepo of generated examples for making software usable by agents through structured commands.
- The strongest idea is the shift from screenshot/click automation to command surfaces that expose real backend operations, JSON output, REPL sessions, undo/redo, package entry points, tests, and `SKILL.md` documentation.
- The Codex integration is directly relevant: `codex-skill/SKILL.md` adapts the same methodology without changing the generated Python harness format.
- CLI-Hub makes the ecosystem discoverable and installable, but it also expands the trust boundary because entries can invoke pip, npm, brew, uv, bundled tools, and command-style installers.
- Several harnesses bridge to real services or APIs such as Mailchimp, Zoom, Exa, AnyGen, NotebookLM-like workflows, browser automation, and local/remote application backends. "Agent-native" does not imply local-only.
- CLI-Hub sends analytics by default to PostHog, with a documented `CLI_HUB_NO_ANALYTICS=1` opt-out. Code also classifies invocations as human, agent, or scripted based on environment and process signals.
- The repository's own security policy is unusually relevant: autonomous agents can pass untrusted input into command-line wrappers, so subprocess argument validation, path handling, escaping, and credential redaction are not optional.
- The README's test total and demo claims are useful signals, but this intake did not re-run the full upstream suite or install target applications.

## Sequential Review Fallback

This repository's default intake asks for source/structure and value/use-case reviewers. In this session, subagent spawning was not available without explicit user delegation, so the integrator ran those two review passes sequentially and recorded the fallback here.

Source/structure pass result: the upstream repository is a fast-moving monorepo with a coherent methodology, platform integrations, CLI-Hub, root skills, registry metadata, and many harness examples. Root skill validation passed, and registry JSON parsed. Full harness validation was out of scope because it would require many real backend applications and credentials.

Value/use-case pass result: useful enough for full analysis and shortlisted status because it directly matches Resource Atlas interests in agent skills, coding-agent tooling, computer-use alternatives, and source-backed automation. It should be used as an architecture and methodology reference before being trusted as a one-command production dependency.

## Source Retention Decision

Do not commit the full upstream repo for this entry. The source is public but large for this atlas, includes many generated harnesses and demo assets, and changes quickly. Retain source ref, content hash, catalog counts, validation notes, and evidence summary instead; re-fetch upstream on refresh.
