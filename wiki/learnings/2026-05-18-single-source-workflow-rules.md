---
learning_id: learn_20260518_single_source_workflow_rules
date: 2026-05-18
type: process
trigger: User asked whether the Resource Atlas workflow rules had become too redundant and whether the proposed AGENTS/intake/templates/validator split would make the repository better.
applies_to:
  - agent-onboarding
  - documentation-maintenance
  - rule-change
  - validation
status: promoted
promoted_to:
  - AGENTS.md
  - README.md
  - docs/intake-policy.md
  - docs/self-improvement-policy.md
---

# Single Source Workflow Rules

## What Happened

The workflow review found that Resource Atlas had good safety rules, but several
of them were repeated across `AGENTS.md`, `README.md`,
`docs/intake-policy.md`, templates, and `scripts/validate-atlas.rb`.

## Root Cause

Earlier process fixes were promoted into multiple places to make them hard to
miss. That improved safety, but it also made the repository harder for future
agents to enter and increased the chance that one copy of a rule would drift
from another.

## Fix Applied

`AGENTS.md` was narrowed to the entry contract, routing, and red lines.
`docs/intake-policy.md` was clarified as the single detailed operating
procedure. `README.md` now points to the operating map instead of repeating the
agent workflow. `docs/self-improvement-policy.md` now states that learnings are
triggered by durable process issues, not by every routine intake.

## Future Rule

Keep each workflow rule in one primary layer: `AGENTS.md` for role and red
lines, `docs/intake-policy.md` for the detailed procedure,
`runtime/templates/*` for output shape, and `scripts/validate-atlas.rb` for
hard checks.

## Where This Was Promoted

The rule was promoted into `AGENTS.md`, `README.md`,
`docs/intake-policy.md`, and `docs/self-improvement-policy.md`.

## Follow-Up Check

When a future workflow correction is promoted, check whether it can replace or
link to an existing rule instead of adding the same detailed instruction in
several files.
