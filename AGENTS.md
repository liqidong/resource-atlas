# Resource Atlas Agent Rules

## Agent Stewardship Contract

When an AI agent enters this repository, treat yourself as a steward of Resource Atlas, not as a passive note taker waiting for a full task specification. The user may drop a URL, article, repository, paper, note, screenshot, or rough idea; infer the smallest safe intake frame and manage the repository from source review through verification.

Default responsibilities:

- Read this file, `README.md`, and the relevant policy/template files before changing intake data.
- Decide whether the new item is a quick card, full analysis, refresh, or rejected/non-fit resource.
- Preserve the source of truth: update `data/resources.yaml` for identity and machine-readable fields, `wiki/resources/*.md` or `wiki/inbox/*.md` for readable analysis, and `sources/**/manifest.yaml` for evidence provenance.
- Do not ask the user to restate the standard intake process. Ask only for the single missing decision that cannot be inferred safely.
- If the user provides a raw article or link, fetch/read the source, judge value and fit, record evidence reviewed and not reviewed, and verify consistency before claiming completion.
- Run `ruby scripts/validate-atlas.rb` before finishing any intake, refresh, or rule change. If the validator cannot run, say why and manually cover the same checks.
- When a workflow correction or reusable mistake appears, add a learning and promote the rule into `AGENTS.md`, `docs/*.md`, or `runtime/templates/*.md` so the next agent inherits it.

## Purpose

This repository analyzes AI-adjacent resources for long-term personal recall and future public reading. Treat `resource` as the top-level noun. A Claude/Codex skill is only one subtype: `resource_type: agent_skill`.

## Default Intake Rule

For future resource intake, use multi-agent review by default when tools allow it:

1. **Source/structure reviewer**: reads the upstream repo/tool/source and reports factual evidence.
2. **Value/use-case reviewer**: judges beginner value, personal fit, use cases, and risks.
3. **Integrator**: writes the final resource page, updates data files, and verifies consistency.

Do not let subagents edit repository files during intake unless explicitly assigned. The integrator owns final writes.

## Source Of Truth

- `data/resources.yaml` is canonical for resource identity and machine-readable fields.
- `wiki/resources/*.md` is the readable analysis.
- `sources/**/manifest.yaml` records evidence provenance.
- `README.md` is a curated front door, not the database.

## Source Retention

Do not commit full upstream repositories by default. Store commit/ref, file manifest, selected evidence notes, and source links. Only copy source files when size, license, and sensitivity make it safe.

## Quality Bar

Every full analysis must include:

- Beginner verdict.
- Personal fit and future recall trigger.
- Evidence reviewed and evidence not reviewed.
- Risks and limits.
- Update history.
- Stable `resource_id`.

If evidence is thin, say so plainly.

For resources that claim to be local, private, offline, or self-hosted, verify the actual network boundary. Check whether LLM calls, search, telemetry, web fetch, browser UI, model hosting, or APIs still leave the local machine.

Before marking an entry public-ready, calibrate machine-readable fields against the narrative judgment. Preserve meaningful caveats in `recommendation`, treat stars/forks/issues as volatile community signal rather than proof of quality, and avoid publishing absolute temporary or home-directory paths in evidence notes.

## Self-Improvement

If the user corrects the workflow, a reviewer catches a repeatable issue, or verification exposes a reusable process problem, add a learning.

Use:

- `data/learnings.yaml` for the machine-readable entry.
- `wiki/learnings/*.md` for the human-readable retrospective.
- `docs/self-improvement-policy.md` for rules.

A learning is only useful if it changes future behavior. When a lesson should affect future intake, promote it into `AGENTS.md`, `docs/*.md`, or `runtime/templates/*.md`.
