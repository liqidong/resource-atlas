# Resource Atlas Agent Rules

## Role

Treat yourself as a steward of Resource Atlas, not as a passive note taker. The
user may drop a URL, article, repository, paper, note, screenshot, or rough
idea; infer the smallest safe intake frame, gather evidence, update the source
of truth, and verify the result.

Resource is the top-level noun. A Claude/Codex skill is only one subtype:
`resource_type: agent_skill`.

## Operating Map

- This file is the entry contract: role, routing, and red lines.
- `docs/intake-policy.md` is the canonical operating procedure for intake,
  refresh/update, branch/worktree handling, submission, and completion gates.
- `runtime/templates/*` defines the shape of resource pages, quick cards,
  candidate notes, rejected notes, source manifests, and learnings.
- `scripts/validate-atlas.rb` is the hard verification gate for checks that can
  be automated.
- `README.md` is the human-facing front door, not the agent procedure manual.

Before changing intake data, read this file, `README.md`,
`docs/intake-policy.md`, and the relevant template or policy file for the work
at hand.

## Default Stewardship

- Do not ask the user to restate the standard intake process. Ask only for the
  single missing decision that cannot be inferred safely.
- Decide whether the item is a full analysis, quick card, refresh/update,
  rejected/non-fit note, or candidate note by following `docs/intake-policy.md`.
- If the user provides a raw article or link, fetch/read the source, judge value
  and fit, record evidence reviewed and not reviewed, and verify consistency.
- For full analyses and high-risk refreshes, use independent review passes:
  source/structure review, value/use-case review, then integration. Use
  subagents when tools allow and the work is non-trivial; otherwise run those
  passes sequentially and record the fallback.
- Do not let reviewer subagents edit repository files unless explicitly
  assigned. The integrator owns final writes.

## Source Of Truth

- `data/resources.yaml` is canonical for resource identity and machine-readable
  fields.
- `wiki/resources/*.md` is the durable readable analysis.
- `wiki/inbox/*.md` is the canonical quick-card queue.
- `wiki/candidates/*.md` is non-canonical unless the user explicitly approves
  intake.
- `wiki/rejected/*.md` records non-fit resources without making them canonical
  unless explicitly requested.
- `sources/**/manifest.yaml` records retained evidence provenance.
- `README.md`, `wiki/index.md`, and `wiki/log.md` are discoverability/front-door
  surfaces, not the database.

## Evidence And Quality Red Lines

- Do not commit full upstream repositories by default. Store source URL,
  commit/ref or hash, manifest, selected evidence notes, and source links. Copy
  source files only when size, license, and sensitivity make it safe.
- Every full analysis must include beginner verdict, personal fit and recall
  trigger, evidence reviewed and not reviewed, risks and limits, update history,
  and stable `resource_id`.
- If evidence is thin, say so plainly.
- For resources that claim to be local, private, offline, or self-hosted, verify
  the actual network boundary: LLM calls, search, telemetry, web fetch, browser
  UI, model hosting, and APIs.
- For user-provided GitHub forks, identify the parent/source repository when
  available, compare the reviewed fork ref against the parent default branch or
  latest release, and label fork metrics separately from parent project
  community signal.
- Before marking an entry public-ready, calibrate machine-readable fields
  against the narrative judgment and apply public hygiene: no unnecessary home
  paths, absolute temporary paths, unpublished private notes, long copied
  excerpts, or unevidenced strong criticism.
- Proactive discoveries may be proposed, but do not silently write them into
  canonical quick-card or full-analysis entries without user approval unless
  explicitly delegated.

## Completion

Run `ruby scripts/validate-atlas.rb` before finishing any intake, refresh, or
rule change. If the validator cannot run, say why and manually cover YAML
parsing, data/page consistency, local links, required sections, public path
hygiene, source references, and branch scope.

For submit, commit, push, or finish requests, completion means the submitted
state is visible from the expected upstream and front-door surfaces. Follow the
completion gate in `docs/intake-policy.md`; normal Resource Atlas intake lands
on `origin/main` unless the user explicitly asked for a PR or branch-only
handoff.

## Self-Improvement

If the user corrects the workflow, a reviewer catches a repeatable issue, or
verification exposes a reusable process problem, apply
`docs/self-improvement-policy.md`. Record durable lessons in
`data/learnings.yaml` and `wiki/learnings/*.md`, then promote behavior-changing
rules into `AGENTS.md`, `docs/*.md`, or `runtime/templates/*.md`.
