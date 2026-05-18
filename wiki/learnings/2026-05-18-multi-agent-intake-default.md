---
learning_id: learn_20260518_multi_agent_intake_default
date: 2026-05-18
type: preference
trigger: User asked that future intake should use multi-agent high-quality review.
applies_to:
  - full-analysis
  - refresh-update
  - resource-review
status: promoted
promoted_to:
  - AGENTS.md
  - docs/intake-policy.md
---

# Multi-Agent Intake By Default

## What Happened

After the first resource intake began, the user clarified that future resource intake should use multi-agent review for higher quality.

## Root Cause

Resource intake has multiple failure modes: missing source facts, weak personal-fit judgment, missing public-readiness issues, and shallow evidence review. A single pass is more likely to miss one of these.

## Fix Applied

The intake process now requires multi-agent review by default when tools allow it:

- source/structure reviewer
- value/use-case reviewer
- integrator

## Future Rule

For full resource analysis and meaningful refresh/update work, use at least two independent review perspectives before writing the final entry when tool availability permits.

## Where This Was Promoted

- `AGENTS.md`
- `docs/intake-policy.md`
- `data/learnings.yaml`

## Follow-Up Check

During future intake, verify the final response says whether multi-agent review ran. If it did not run, explain why.
