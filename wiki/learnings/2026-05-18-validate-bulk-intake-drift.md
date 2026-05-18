---
learning_id: learn_20260518_validate_bulk_intake_drift
date: 2026-05-18
type: process
trigger: Post-bulk intake review found drift that the validator did not catch.
applies_to:
  - full-analysis
  - quick-card
  - multi-resource-intake
  - branch-management
  - validation
status: promoted
promoted_to:
  - scripts/validate-atlas.rb
  - docs/intake-policy.md
---

# Validate Bulk Intake Drift

## What Happened

After several resources were ingested and policy changes were added, multi-agent review found issues even though `ruby scripts/validate-atlas.rb` passed. The drift included a missing `wiki/index.md` entry, data/frontmatter mismatches, missing source metadata, and learning status inconsistencies.

## Root Cause

The validator only covered basic YAML, selected resource fields, required page headings, local links, and public path hygiene. It did not yet validate the front door, all machine-readable fields, source manifest provenance, learning metadata, or branch/worktree scope.

## Fix Applied

`scripts/validate-atlas.rb` now checks expanded resource frontmatter fields, aliases/tags/use cases, source `metadata.yaml`, source snapshot manifests, `reviewed_source_ref` alignment, shortlisted resource presence in `wiki/index.md`, learning page status, and non-batch branch scope.

## Future Rule

After batch intake or multi-branch integration, run the validator and inspect any branch-scope warning before merging or pushing. Do not treat a passing lightweight check as proof that the atlas front door, provenance, and policy metadata stayed aligned.

## Where This Was Promoted

The rule was promoted into `scripts/validate-atlas.rb` and `docs/intake-policy.md`.

## Follow-Up Check

The next batch intake should fail validation if it misses an index entry, source manifest, metadata file, or resource/page field calibration.
