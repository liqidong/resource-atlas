---
learning_id: learn_20260518_verify_local_claims_network_boundary
date: 2026-05-18
type: quality_bar
trigger: Local Deep Researcher is described as fully local, but source review showed search and optional full-page fetch can still use external network services.
applies_to:
  - full-analysis
  - privacy-review
  - local-first-resources
status: promoted
promoted_to:
  - AGENTS.md
---

# Verify Local Claims Against Network Boundaries

## What Happened

During Local Deep Researcher intake, reviewers found that the project can run local LLMs through Ollama or LM Studio, but search and page fetching can still call external services.

## Root Cause

Resources often use "local" to describe one subsystem. In this case, local mostly applies to the LLM provider. The full workflow may still use network search providers and external APIs.

## Fix Applied

`AGENTS.md` now requires checking network boundaries for resources that claim to be local, private, offline, or self-hosted.

## Future Rule

For every local/private/self-hosted claim, identify which parts run locally and which parts still call external services.

## Where This Was Promoted

- `AGENTS.md`
- `data/learnings.yaml`

## Follow-Up Check

Future resource pages should include a clear privacy/network boundary note when relevant.
