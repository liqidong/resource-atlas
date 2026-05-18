# Source Snapshot: Architecture Diagram Generator

- Source: https://github.com/Cocoon-AI/architecture-diagram-generator
- Reviewed ref: `4b9087d55268c79a935105439dbcd37b630fc3f3`
- Reviewed date: 2026-05-18
- Upstream version signal: `v1.1 / main@4b9087d`
- Latest release observed: `Built-in Export Toolbar`, tag `1.1`, published 2026-05-09T02:08:10Z
- Temporary clone size: 1.1M
- Upstream files reviewed: 13
- HTML files: 4
- Markdown files: 2
- PNG files: 4
- Zip files: 1
- GitHub web observed on 2026-05-18: about 5.1k stars, 385 forks, 8 watchers, 0 open issues, 0 open PRs, 12 commits.
- License: MIT.
- Validation run: full clone succeeded; `architecture-diagram.zip` contents matched the checked-in `architecture-diagram/` folder; template/example external references were inspected.
- GitHub API note: unauthenticated API calls were rate-limited, so community and release evidence came from GitHub web plus git refs.

## Evidence Files Reviewed

- `README.md`: project positioning, install flow, examples, export feature, output shape, technical details, sister skill, license, and contribution notes.
- `architecture-diagram/SKILL.md`: skill trigger, design system, color palette, spacing rules, legend placement rule, export toolbar requirements, component patterns, and output requirements.
- `architecture-diagram/resources/template.html`: standalone template with inline CSS/SVG examples, Google Fonts, jsdelivr `html2canvas` and `jsPDF` scripts with SRI hashes, toolbar UI, and export functions.
- `architecture-diagram.zip`: uploadable skill archive containing `SKILL.md` and `resources/template.html`; compared cleanly against the source folder.
- `examples/web-app.html`: simple three-tier web app example.
- `examples/aws-serverless.html`: AWS serverless example with CloudFront, API Gateway, Lambda, DynamoDB, S3, and SQS.
- `examples/microservices.html`: Kubernetes/microservices example with clients, gateway, services, event buses, and databases.
- `examples/images/*.png`: screenshots of the example diagrams and Claude Skills settings.
- `LICENSE`: MIT license text.
- Git tags and release page: tag `1.1` points to `d02a6f2`, release `Built-in Export Toolbar` documents the export buttons, skill-structure cleanup, and pinned CDN scripts.

## Key Findings

- The repository is a very small, coherent Claude custom skill package rather than a general software library.
- The skill is useful because it turns a plain-language architecture description into a polished, shareable HTML/SVG artifact.
- The design system is explicit enough to help a model avoid common diagram-generation mistakes: overlapping stacked components, legends inside boundaries, arrows appearing over boxes, and inconsistent semantic colors.
- The generated artifact is mostly self-contained for viewing, but not fully offline by default. It loads JetBrains Mono from Google Fonts and uses jsdelivr-hosted `html2canvas` and `jsPDF` for export.
- The export scripts are pinned with Subresource Integrity hashes, which reduces CDN tampering risk but does not remove the network dependency.
- The latest release/tag is behind `main` by two README-only commits; the skill/package files reviewed at `main@4b9087d` still report version 1.1.
- The project has examples and screenshots, but no automated rendering, layout, browser compatibility, or export tests.

## Source Retention Decision

Do not commit the full upstream repo for this entry. The public source is small, but retaining source ref, checksums, zip verification, and evidence summary is enough for Resource Atlas. Re-fetch upstream when refreshing.
