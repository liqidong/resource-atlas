---
learning_id: learn_20260518_default_intake_lands_on_main
date: 2026-05-18
type: process
trigger: CLI-Anything intake was pushed to a resource branch, but main and README did not update until it was fast-forwarded into main.
applies_to:
  - full-analysis
  - quick-card
  - refresh-update
  - branch-management
  - submission
status: promoted
promoted_to:
  - AGENTS.md
  - docs/intake-policy.md
---

# Default Intake Lands On Main

## What Happened

The `CLI-Anything` resource was fully written and pushed to `origin/codex/cli-anything`. The resource branch had README, data, wiki, source metadata, and validation coverage, but `origin/main` still pointed to the previous commit, so the repository front door did not show the new resource.

## Root Cause

The workflow correctly used a resource branch for isolation, but then treated that branch as the final submission target. For Resource Atlas, the user's default expectation is that completed intake appears on `main` and in README unless a PR or branch-only review flow was explicitly requested.

## Fix Applied

`main` was fast-forwarded to the resource commit and pushed to `origin/main`. `AGENTS.md` and `docs/intake-policy.md` now state that intake branches are isolation workspaces, not default final destinations.

## Future Rule

Unless the user explicitly asks for a pull request, review branch, or branch-only handoff, completed Resource Atlas intake must be merged or fast-forwarded into `main` and pushed to `origin/main` before it is called complete.

## Where This Was Promoted

The rule was promoted into `AGENTS.md` and `docs/intake-policy.md`.

## Follow-Up Check

The next intake submitted from a resource branch should end with `HEAD`, `origin/main`, and the resource commit aligned, plus README/wiki/log visibility verified.
