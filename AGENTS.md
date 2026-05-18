# Resource Atlas Agent Rules

## Agent Stewardship Contract

When an AI agent enters this repository, treat yourself as a steward of Resource Atlas, not as a passive note taker waiting for a full task specification. The user may drop a URL, article, repository, paper, note, screenshot, or rough idea; infer the smallest safe intake frame and manage the repository from source review through verification.

Default responsibilities:

- Read this file, `README.md`, and the relevant policy/template files before changing intake data.
- Decide whether the new item is a quick card, full analysis, refresh, or rejected/non-fit resource.
- Preserve the source of truth: update `data/resources.yaml` for identity and machine-readable fields, `wiki/resources/*.md` or `wiki/inbox/*.md` for readable analysis, and source manifests for full analyses, refreshes, or retained evidence snapshots.
- Do not ask the user to restate the standard intake process. Ask only for the single missing decision that cannot be inferred safely.
- If the user provides a raw article or link, fetch/read the source, judge value and fit, record evidence reviewed and not reviewed, and verify consistency before claiming completion.
- Run `ruby scripts/validate-atlas.rb` before finishing any intake, refresh, or rule change. If the validator cannot run, say why and manually cover the same checks.
- When a workflow correction or reusable mistake appears, add a learning and promote the rule into `AGENTS.md`, `docs/*.md`, or `runtime/templates/*.md` so the next agent inherits it.

## Long-Term Stewardship Vision

This repository should become more than a static catalog. As it accumulates GitHub repositories, papers, articles, tools, and workflows, agents should maintain an evolving understanding of the user's interests, taste, recurring use cases, risk tolerance, and preferred evidence standards.

Use that understanding to:

- Recognize patterns across resources and make future entries easier to recall.
- Suggest new candidate resources when they strongly match the emerging atlas.
- Notice when existing resources may need refresh because upstream changed, a better successor appeared, or the original judgment may be stale.
- Keep the user in the review loop for proactive discovery: agents may propose candidates and explain why they fit, but should not silently write proactive discoveries into canonical quick-card or full-analysis entries without user approval unless explicitly delegated.

## Purpose

This repository analyzes AI-adjacent resources for long-term personal recall and future public reading. Treat `resource` as the top-level noun. A Claude/Codex skill is only one subtype: `resource_type: agent_skill`.

## Default Intake Rule

For future resource intake, use multi-agent review by default when tools allow it:

1. **Source/structure reviewer**: reads the upstream repo/tool/source and reports factual evidence.
2. **Value/use-case reviewer**: judges beginner value, personal fit, use cases, and risks.
3. **Integrator**: writes the final resource page, updates data files, and verifies consistency.

If subagent tooling is unavailable, run those two review passes sequentially and record the fallback. Do not let subagents edit repository files during intake unless explicitly assigned. The integrator owns final writes.

## Branch And Worktree Discipline

Default resource intake is one resource, one branch, one worktree, one
resource-scoped commit.

For the concrete gate, commands, and batch rules, follow `docs/intake-policy.md`.
In short: start from clean `main`, create a slug-matched `codex/{slug}` branch
in a dedicated worktree, keep a single-resource diff scoped to that resource,
and split the work if a non-batch branch accumulates multiple intake pages or
source roots.

The intake branch is an isolation tool, not the default final destination. Unless
the user explicitly asks for a PR, branch-only handoff, or unmerged review
branch, validated resource intake should be fast-forwarded or merged into
`main` and pushed to `origin/main` before it is called complete.

## Submission Completion Contract

When the user asks an agent to submit, commit, push, or finish an intake, "done"
means the submitted state is visible from the repository front door, not merely
written in one window. Before claiming completion:

- Verify `ruby scripts/validate-atlas.rb` passes.
- Verify the submitted commit is on the expected upstream branch and report the
  commit SHA.
- For normal Resource Atlas intake, the expected upstream branch is `origin/main`
  unless the user explicitly requested a PR or branch-only workflow.
- Verify `README.md`, `wiki/index.md`, and `wiki/log.md` show the resource when
  the resource is shortlisted, recommended, or otherwise meant to be discoverable.
- If working on `main`, make sure it is not behind `origin/main`; fast-forward
  with autostash when safe, or clearly report that the remote is updated but the
  current workspace is not yet synced.

## Source Of Truth

- `data/resources.yaml` is canonical for resource identity and machine-readable fields.
- `wiki/resources/*.md` is the readable analysis; `wiki/inbox/*.md` is the canonical quick-card queue.
- `sources/**/manifest.yaml` records retained evidence provenance.
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

Use `docs/self-improvement-policy.md`: record durable lessons in `data/learnings.yaml` and `wiki/learnings/*.md`, then promote behavior-changing rules into `AGENTS.md`, `docs/*.md`, or `runtime/templates/*.md`.
