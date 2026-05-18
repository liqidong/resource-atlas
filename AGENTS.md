# Resource Atlas Agent Rules

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
