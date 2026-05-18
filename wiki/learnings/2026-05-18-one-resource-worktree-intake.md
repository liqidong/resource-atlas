---
learning_id: learn_20260518_one_resource_worktree_intake
date: 2026-05-18
type: process
trigger: Several resource intake branches existed, but the final work was bundled into one single-resource branch commit.
applies_to:
  - full-analysis
  - quick-card
  - refresh-update
  - branch-management
  - multi-resource-intake
status: promoted
promoted_to:
  - AGENTS.md
  - docs/intake-policy.md
---

# One Resource, One Worktree Intake

## What Happened

The user clarified the intended workflow: each new paper or resource should be
collected on its own branch and then returned to `main`. A review found that
multiple resource branches existed, but the final work for multiple resources
had been bundled into one single-resource branch commit.

## Root Cause

The workflow used branch switching in one working directory rather than isolated
worktrees. Uncommitted changes can follow the working directory across branch
switches, so branch names can stop representing the actual resource scope.

## Fix Applied

The repository policy now makes intake isolation explicit:

- one resource
- one branch
- one `git worktree`
- one resource-scoped commit

Batch intake is still allowed when explicitly requested, but it must use a batch
branch and preserve one commit per resource.

## Future Rule

Start each resource intake from a clean, current `main` in a dedicated worktree.
Before merging, inspect `git diff --name-status main...HEAD`. If a
single-resource branch contains multiple new resource pages or multiple new
source subtrees, split the work before merging.

## Where This Was Promoted

- `AGENTS.md`
- `docs/intake-policy.md`
- `data/learnings.yaml`

## Follow-Up Check

For the next few intakes, explicitly report the branch name, worktree path,
resource slug, and pre-merge `git diff --name-status main...HEAD` scope check.
