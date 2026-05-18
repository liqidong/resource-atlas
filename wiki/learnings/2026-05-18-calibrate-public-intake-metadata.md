---
learning_id: learn_20260518_calibrate_public_intake_metadata
date: 2026-05-18
type: quality_bar
trigger: Intake review found caveated narrative judgment and public evidence hygiene issues that should become a repeatable final check.
applies_to:
  - full-analysis
  - refresh-update
  - public-redaction
status: active
promoted_to:
  - AGENTS.md
  - docs/intake-policy.md
  - docs/public-redaction-policy.md
---

# Calibrate Public Intake Metadata

## What Happened

A review of the first two Resource Atlas entries found no major intake failure, but it did find two reusable quality issues: Local Deep Researcher was described with caveats in the narrative while the machine-readable `recommendation` field said only `recommended`, and some validation notes included temporary clone paths.

## Root Cause

Resource pages, data records, and source manifests are written in parallel. Without a final calibration pass, narrative nuance can be lost in canonical data and public-ready evidence can expose machine-specific paths.

## Fix Applied

Local Deep Researcher now uses `recommended_with_caveats` in both `data/resources.yaml` and page frontmatter. Validation notes now use repo-relative commands and say they were run from a temporary clone without naming the local path.

## Future Rule

Before finalizing a public-ready intake, align machine-readable recommendation fields with the narrative judgment, treat community metrics as dated advisory signal, and redact absolute temporary or home-directory paths unless they are necessary evidence.

## Where This Was Promoted

The rule was promoted into `AGENTS.md`, `docs/intake-policy.md`, and `docs/public-redaction-policy.md`.

## Follow-Up Check

Future resource intake should include this as part of the final consistency pass before commit or publication.
