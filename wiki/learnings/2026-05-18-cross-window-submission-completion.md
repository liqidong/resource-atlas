---
learning_id: learn_20260518_cross_window_submission_completion
date: 2026-05-18
type: process
trigger: A resource submitted from another window was present on origin/main but not visible in the current window's README.
applies_to:
  - full-analysis
  - quick-card
  - refresh-update
  - branch-management
  - submission
  - validation
status: promoted
promoted_to:
  - AGENTS.md
  - docs/intake-policy.md
  - scripts/validate-atlas.rb
---

# Cross-Window Submission Completion

## What Happened

A new resource, `architecture-diagram-generator`, had been submitted from another window and was already present on `origin/main`. The current window still showed an older local `main`, so README did not show the new resource until the branch was fast-forwarded.

## Root Cause

The process treated the remote commit as completion, but did not require a final visibility check from the user's active checkout. Because the current workspace had local WIP and was behind `origin/main`, the user saw stale front-door files even though the remote intake was complete.

## Fix Applied

`AGENTS.md` now defines a submission completion contract, `docs/intake-policy.md` includes a submission completion gate, and `scripts/validate-atlas.rb` fails when local `main` is behind `origin/main` before completion is claimed.

## Future Rule

When asked to submit, commit, push, or finish an intake, do not stop at creating a commit. Verify the atlas, confirm the commit is reachable from the target upstream branch, check README/wiki front-door visibility for discoverable resources, and either sync the current window or clearly report that the remote is updated but the current checkout is stale.

## Where This Was Promoted

The rule was promoted into `AGENTS.md`, `docs/intake-policy.md`, and `scripts/validate-atlas.rb`.

## Follow-Up Check

The next cross-window submit should report the upstream commit SHA and leave the user's active checkout able to see the resource, or explicitly state why it could not be synced.
