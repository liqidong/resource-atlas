---
learning_id: learn_20260518_validator_ruby26_compatibility
date: 2026-05-18
type: process
trigger: CLI-Anything intake verification found that the atlas validator failed under the default Ruby 2.6 runtime because it used Array#filter_map.
applies_to:
  - validation
  - full-analysis
  - branch-management
  - submission
status: promoted
promoted_to:
  - scripts/validate-atlas.rb
---

# Keep The Validator Compatible With The Local Ruby

## What Happened

During CLI-Anything intake, the required `ruby scripts/validate-atlas.rb` command failed before checking the atlas because the local Ruby runtime did not provide `Array#filter_map`.

## Root Cause

The validator had adopted a Ruby 2.7 convenience method while the available default runtime was Ruby 2.6. The repository did not declare a newer Ruby requirement, so the completion gate became unavailable in a normal local environment.

## Fix Applied

The branch-scope path collection in `scripts/validate-atlas.rb` now uses `map` plus `compact`, which preserves the same behavior while working on Ruby 2.6.

## Future Rule

Keep repository validation scripts compatible with the default supported local runtime, or explicitly document and enforce a newer runtime before relying on the script for intake completion.

## Where This Was Promoted

- `scripts/validate-atlas.rb`

## Follow-Up Check

Run `ruby scripts/validate-atlas.rb` directly after validation script changes, not only through an ad hoc compatibility wrapper.
