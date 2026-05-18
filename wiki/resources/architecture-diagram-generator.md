---
title: Architecture Diagram Generator
resource_id: res_20260518_architecture_diagram_generator_4b9087d
slug: architecture-diagram-generator
canonical_slug: architecture-diagram-generator
aliases:
  - Architecture Diagram Generator
  - architecture-diagram
  - Cocoon-AI/architecture-diagram-generator
  - Cocoon AI Architecture Diagram Generator
resource_type: agent_skill
source_url: https://github.com/Cocoon-AI/architecture-diagram-generator
canonical_source: https://github.com/Cocoon-AI/architecture-diagram-generator
local_source: sources/github/Cocoon-AI__architecture-diagram-generator/
source_kind: github
source_fingerprints:
  - git:4b9087d55268c79a935105439dbcd37b630fc3f3
  - tree-content-sha256:b17e700ec171319d2b3a08bcdceaaf4b9c2521ab5bdf3b13e32ab922c72387aa
  - zip-sha256:52ef080c73c7d970ee1afb0ae1757d29693a0a89a0b265982984c95cf63b49b1
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: 4b9087d55268c79a935105439dbcd37b630fc3f3
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: shortlisted
maturity: useful_lightweight
recommendation: recommended_with_caveats
fit_for_user: high
time_to_value: low
setup_cost: low
maintenance_burden: low
risk_level: medium
evidence_quality: high
will_i_actually_use_this: yes
public_ready: yes
private_notes: no
source_publishable: partial
language: en
redaction_needed: no
tags:
  - agent-skills
  - claude-skills
  - architecture-diagrams
  - diagram-generation
  - system-architecture
  - technical-documentation
  - html-svg
  - open-source-template
use_cases:
  - create-architecture-diagrams
  - document-system-architecture
  - study-agent-skill-packaging
recommended_for:
  - 从自然语言系统描述快速生成深色主题 HTML/SVG 架构图
  - 给 README、设计文档、汇报材料或架构评审做第一版可分享图
  - 学习一个极小 Claude skill 如何包装说明、模板、示例和上传 zip
not_recommended_for:
  - 需要自动从代码库严格抽取架构并验证拓扑正确性的场景
  - 需要离线、无外部字体/CDN、无 Claude.ai 依赖的图表生成流程
  - 需要通用图表 DSL、Mermaid/PlantUML 兼容或复杂交互编辑器的人
confidence: high
---

# Architecture Diagram Generator

## Beginner Verdict

- What this is: Cocoon AI 做的一个 Claude custom skill，用 `SKILL.md` 加 HTML/SVG 模板，帮助 Claude 从系统描述生成深色主题架构图。
- Who should care: 需要快速把系统、云架构、安全边界、微服务或网络拓扑讲清楚的人，以及想学习小型 agent skill 打包方式的人。
- When I should remember it: 当我有一段“组件和连接关系”的文字，想快速得到一个能放进文档、汇报或评审材料的 HTML/PNG/PDF 架构图时。
- Not for: 需要自动验证架构正确性、需要复杂 diagram-as-code DSL、需要完全离线无外部依赖、或不想使用 Claude.ai Skills 的场景。
- Setup difficulty: 低。Claude.ai 路径是上传 zip 并打开 skill；Claude Code 路径是把 skill folder 解压到 skills 目录。前提是所用 Claude 环境支持 Skills 和 Code Execution。
- My verdict: 推荐入库，标记 `recommended_with_caveats`。它是高 time-to-value 的图表生成 skill，但要记住它不是架构发现器、不是离线图表引擎，也不是严谨拓扑验证工具。

## One-Sentence Summary

Architecture Diagram Generator 是一个轻量 Claude skill，把自然语言架构描述转成自包含 HTML/SVG 深色主题图，并内置 Copy、PNG、PDF 导出按钮，适合快速沟通和文档草稿。

Community signal observed on 2026-05-18: GitHub web UI showed about 5.1k stars, 385 forks, 8 watchers, 0 open issues, 0 open PRs, 12 commits, 2 tags, MIT license display, HTML as the primary language, and latest release `Built-in Export Toolbar` for tag `1.1` published on 2026-05-09. GitHub's unauthenticated API was rate-limited during intake, so exact star count was not available.

## What It Is

This repository packages a Claude custom skill named `architecture-diagram`. The skill contains:

- `architecture-diagram/SKILL.md`: instructions for when to use the skill, the visual design system, layout rules, export toolbar requirements, and SVG component patterns.
- `architecture-diagram/resources/template.html`: a standalone HTML template with inline CSS, inline SVG examples, and export JavaScript.
- `architecture-diagram.zip`: uploadable skill archive; its contents match the checked-in skill folder.
- `examples/*.html` and `examples/images/*.png`: generated examples for web app, AWS serverless, and microservices diagrams.

The output style is deliberately opinionated: dark slate background, JetBrains Mono, semantic colors for frontend/backend/database/cloud/security/message bus/external components, rounded SVG boxes, dashed boundaries, arrows behind components, summary cards, and a small export toolbar.

## What Problem It Solves

Architecture diagrams are often blocked by tool friction rather than insight. A developer may know the components and flows but still avoid making a diagram because Figma, Lucidchart, draw.io, Mermaid, PlantUML, or C4 tooling all require some combination of syntax, layout, styling, and export cleanup.

This skill solves the "I need a good-looking first draft now" problem. It gives the model a ready design language and a template, so the user can describe a system in plain English and receive a shareable HTML artifact.

It does not solve architecture discovery by itself. If the input description is wrong or incomplete, the generated diagram can still be wrong. A separate codebase analysis or human review step is still needed for accuracy.

## Who It Is For

Good fit:

- Engineers writing design docs, README architecture sections, or handoff notes.
- Founders or product builders who need a quick system diagram for a pitch, review, or planning conversation.
- Agents that already have a decent architecture summary and need to turn it into a polished artifact.
- People studying how to package an agent skill with instructions, template resources, example outputs, and a release zip.

Poor fit:

- Teams that need a diagram DSL as the long-term source of truth.
- Compliance-heavy environments where generated HTML cannot load Google Fonts or CDN scripts.
- People who need architecture extraction and verification, not diagram rendering.
- Workflows that require editing diagrams in a visual GUI after generation.

## How It Works

The user installs the skill in Claude.ai or extracts the skill folder for a local Claude skill setup. Then they give Claude a system description, for example components, data flows, protocols, databases, cloud services, auth boundaries, and deployment regions.

The skill instructs Claude to customize `resources/template.html`. The generated artifact is a single HTML file with inline SVG. The base diagram renders with HTML, CSS, and SVG. The export toolbar uses `html2canvas` and `jsPDF` from jsdelivr with pinned versions and SRI hashes, plus Google Fonts for JetBrains Mono.

The design rules are concrete enough to prevent common AI diagram failures:

- Semantic color palette by component type.
- Minimum vertical gaps to avoid overlaps.
- Arrows drawn before components so they appear behind boxes.
- Opaque background rectangles when transparent fills would reveal arrows.
- Legends placed outside boundary boxes.
- Summary cards below the diagram.
- Clipboard/PNG/PDF export kept in the header toolbar.

## How To Use It

Claude.ai path:

```text
1. Download architecture-diagram.zip.
2. In Claude.ai, open Customize -> Skills.
3. Create or upload a skill and choose the zip.
4. Toggle the skill on.
5. Ask Claude to use the architecture diagram skill with a system description.
```

Local skill path:

```bash
unzip architecture-diagram.zip -d ~/.claude/skills/
```

Good input should name components, responsibilities, connections, protocols, ports, cloud services, external systems, and security boundaries. The generated file still needs review: check missing edges, incorrect technologies, text overlap, boundary placement, and whether the diagram overstates what the source system really does.

## Source Walkthrough

- `README.md`: product promise, install flow, examples, export feature, output shape, technical details, sister skill, license, and contribution notes.
- `architecture-diagram/SKILL.md`: trigger description, design system, layout constraints, export toolbar implementation requirements, output requirements, and caveats.
- `architecture-diagram/resources/template.html`: the concrete HTML/CSS/SVG/JavaScript template that generated diagrams customize.
- `architecture-diagram.zip`: checked to contain only `SKILL.md` and `resources/template.html`, matching the source folder.
- `examples/web-app.html`, `examples/aws-serverless.html`, `examples/microservices.html`: representative generated HTML outputs.
- `examples/images/*.png`: visual snapshots of the examples and a Claude Skills settings screenshot.
- `LICENSE`: MIT license.
- Git history/tags/releases: small project with 12 commits; tag `1.1` adds the export toolbar and skill-structure cleanup; `main@4b9087d` adds a sister-skill README section after the release tag.

Sequential intake fallback: this repository's default intake asks for source/structure and value/use-case reviewers. In this session, subagent spawning was not usable without explicit user delegation, so the integrator ran those two review passes sequentially and recorded the fallback here.

Source/structure pass result: the upstream repository is a very small, coherent skill package. The zip matches the skill folder, the license is straightforward MIT, examples exist, and the main hidden boundary is that "self-contained HTML" still loads external Google Fonts and CDN export scripts.

Value/use-case pass result: useful enough for full analysis because it directly supports architecture documentation and agent-skill packaging study. The main caveat is that the diagram is only as accurate as the model's source description and subsequent human review.

## What It Can Do Well

- Produce polished first-draft architecture diagrams quickly.
- Turn plain component descriptions into a shareable HTML artifact.
- Give diagrams a consistent visual system without separate design work.
- Export generated diagrams as clipboard image, PNG, or PDF.
- Serve as a compact example of skill packaging: frontmatter, `SKILL.md`, resources folder, examples, zip, version tag, and release notes.
- Help non-designers communicate cloud/service/database/auth relationships.

## Limits And Risks

- It is Claude-skill-first. The easiest path depends on Claude.ai Skills and Code Execution being available in the user's plan/workspace.
- It is not a verifier. It does not prove that generated components, arrows, cloud services, or security boundaries match the real codebase.
- The generated output is not fully offline by default. It references Google Fonts and jsdelivr-hosted `html2canvas`/`jsPDF` scripts for export.
- "Self-contained" is partly true: the diagram content and CSS are in one file, but the font and export libraries are external network resources.
- Clipboard export needs user gesture and a suitable browser context. The skill itself notes clipboard and `foreignObject` caveats.
- The design language is opinionated. Great for quick technical visuals, less good if the user needs brand-specific visuals, C4 notation, Mermaid/PlantUML source control, or an editable diagram canvas.
- Project maturity is small. The repo has few files and commits; quality comes from the template and examples rather than a tested software engine.
- Generated diagrams can suffer from text overlap, missing labels, bad grouping, or overconfident summaries unless a person reviews the output.

## Similar Resources

- [Cocoon-AI/process-flow-diagram-generator](https://github.com/Cocoon-AI/process-flow-diagram-generator): sister skill for workflows and timelines rather than static architecture topology.
- [Mermaid](https://mermaid.js.org/): diagram-as-code option that is better when text DSL should be the source of truth.
- [PlantUML](https://plantuml.com/): mature text-to-diagram tool with many diagram types.
- [Structurizr DSL](https://structurizr.com/dsl): C4-model-focused architecture documentation.
- [draw.io / diagrams.net](https://www.diagrams.net/): visual editing path when manual layout control matters.

## My Judgment

Recommended with caveats.

The value is obvious: architecture diagrams are a recurring communication need, and this skill removes enough friction that I would actually reach for it. It also matches the atlas's interest in reusable agent skills and source-backed workflows.

I would not treat it as a canonical architecture source. The right use is "make an inspectable first draft from a known-good description," not "discover and certify architecture from vague context." For serious docs, pair it with a source review and a final visual QA pass.

Recommendation grade: A- for quick architecture communication and skill packaging study; B- as a long-term diagram infrastructure choice because it lacks a formal DSL, validation layer, and fully offline default.

## When To Remember This

- "我需要把系统描述迅速变成一张能放进 README/PRD/design doc 的架构图。"
- "我想让 agent 根据 codebase summary 产出一个漂亮 HTML/SVG 图。"
- "我需要 Copy/PNG/PDF 导出，而不想开 Figma 或 draw.io。"
- "我在研究 Claude custom skill 的最小可用打包方式。"
- "我想给架构图 skill 或图表生成 prompt 找一个现成模板。"
- "我需要提醒自己：图好看不等于架构事实正确。"

## Open Questions

- 在真实复杂系统上，模型生成的布局是否稳定，还是仍需要大量手工调坐标？
- 如果要求完全离线，是否应该 fork 模板并内嵌字体或移除 CDN 导出脚本？
- 它和 Mermaid/C4/Structurizr 组合时，适合作为最终输出还是只做视觉草稿？
- Claude Skills UI、Code Execution、上传限制和 plan availability 后续变化会不会影响安装路径？
- 是否值得把类似设计系统移植成 Codex skill、CLI 生成器或 reusable HTML template？

## Source Evidence

- Snapshot manifest: `sources/github/Cocoon-AI__architecture-diagram-generator/snapshots/2026-05-18-4b9087d/manifest.yaml`
- Snapshot summary: `sources/github/Cocoon-AI__architecture-diagram-generator/snapshots/2026-05-18-4b9087d/snapshot.md`
- Upstream commit reviewed: `4b9087d55268c79a935105439dbcd37b630fc3f3`
- Upstream tags reviewed: `1.1` at `d02a6f2df62ac1557496773830d0e90197c952bc`, `1.0` at `aff12bcf0f861995362e90273060acd0b68a1702`
- GitHub web observed on 2026-05-18: about 5.1k stars, 385 forks, 8 watchers, 0 open issues, 0 open PRs, 12 commits, 2 releases, MIT license display, primary language HTML.
- Latest release observed from GitHub web: `Built-in Export Toolbar`, tag `1.1`, released 2026-05-09T02:08:10Z.
- Upstream files reviewed: `README.md`, `LICENSE`, `architecture-diagram/SKILL.md`, `architecture-diagram/resources/template.html`, `architecture-diagram.zip`, `examples/*.html`, `examples/images/*.png`, git tags and commit history.
- Local validation: full upstream clone completed; file manifest recorded; zip contents diffed cleanly against the checked-in `architecture-diagram/` folder; HTML/example network references inspected; license file checked.
- GitHub API note: unauthenticated API calls were rate-limited during intake, so GitHub web UI and git transport were used for community/release/source evidence.

## Evidence Standard

```yaml
evidence_reviewed:
  - file_or_url: README.md
    why_it_matters: Install flow, positioning, examples, output claims, feature list, technical details, sister skill, and license statement.
  - file_or_url: architecture-diagram/SKILL.md
    why_it_matters: Actual skill instructions, trigger description, design system, spacing rules, export toolbar requirements, and caveats.
  - file_or_url: architecture-diagram/resources/template.html
    why_it_matters: Concrete generated artifact template, including CSS, SVG patterns, external scripts, and export functions.
  - file_or_url: architecture-diagram.zip
    why_it_matters: Uploadable artifact; contents were compared against the source skill folder.
  - file_or_url: examples/*.html and examples/images/*.png
    why_it_matters: Shows representative generated diagrams and confirms the same external font/CDN export dependencies appear in examples.
  - file_or_url: LICENSE
    why_it_matters: Confirms MIT license text.
  - file_or_url: git history, tags, and GitHub release page
    why_it_matters: Confirms reviewed ref, latest tag/release, commit count, and recent change history.
  - file_or_url: GitHub repository web page
    why_it_matters: Current visible community signal, open issue/PR counts, license display, and primary language when API was rate-limited.
evidence_not_reviewed:
  - item: generating a fresh diagram through Claude.ai Skills
    reason: Requires an interactive Claude.ai skill install path outside this repository.
  - item: browser rendering and export buttons across browsers
    reason: Existing HTML and image examples were inspected, but Copy/PNG/PDF were not manually exercised in Chrome/Safari/Firefox.
  - item: codebase-to-architecture extraction quality
    reason: The resource starts from a user/model-provided architecture description; it does not include an extraction engine to benchmark.
  - item: every GitHub issue, PR, and release asset metadata field
    reason: GitHub API was rate-limited; web UI and git refs were enough for intake-level evidence.
ran_locally: partial
run_notes: Cloned upstream, inspected source files, compared zip contents with the skill folder, checked file counts/checksums, reviewed external network references in template/examples, and checked license. Did not run Claude.ai skill generation or browser export flows.
license_checked: yes
security_or_privacy_notes: Diagram generation through Claude.ai sends the architecture description to Claude. Generated HTML renders locally but references Google Fonts and jsdelivr CDN scripts for export. The CDN scripts are pinned with SRI hashes, but offline/private workflows should vendor or remove these dependencies.
confidence_limits: High confidence in package structure, license, install path, external dependency boundary, and fit; medium confidence in real-world generated diagram quality until tested on representative architecture descriptions.
```

## Update History

```yaml
- date: 2026-05-18
  old_judgment: none
  new_judgment: recommended_with_caveats
  why_changed: First full analysis and intake.
  evidence: README, LICENSE, SKILL.md, template.html, zip comparison, examples, git history/tags, GitHub web repository and release pages.
  still_true: n/a
  no_longer_true: n/a
  confidence_change: none -> high
  source_ref: 4b9087d55268c79a935105439dbcd37b630fc3f3
```
