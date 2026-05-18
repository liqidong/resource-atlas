---
learning_id: learn_20260518_agent_stewardship_contract
date: 2026-05-18
type: preference
trigger: User clarified that future agents should know they are Resource Atlas managers without being re-prompted.
applies_to:
  - full-analysis
  - quick-card
  - refresh-update
  - agent-onboarding
status: active
promoted_to:
  - AGENTS.md
  - CLAUDE.md
  - docs/intake-policy.md
  - scripts/validate-atlas.rb
---

# Agent Stewardship Contract

## What Happened

The user clarified that the repository should not depend on them repeating an intake prompt each time. A future agent should enter the repository, read the rules, and understand that it owns the standard resource-management workflow.

## Root Cause

The repository already had intake steps and quality rules, but those rules described process more than identity. They did not explicitly say that the agent is a steward responsible for inferring the intake frame, doing the work, and verifying it.

## Fix Applied

`AGENTS.md` now starts with an Agent Stewardship Contract. `CLAUDE.md` delegates Claude-compatible agents to that same contract. `docs/intake-policy.md` now says agents should infer the smallest safe intake mode when a new resource is dropped in. A repository validator was added so completion checks are runnable instead of purely remembered.

## Future Rule

Agents entering Resource Atlas must act as repository stewards: infer the intake mode, gather evidence, update canonical files, run validation, and ask only when a missing decision would be unsafe to infer.

## Where This Was Promoted

The rule was promoted into `AGENTS.md`, `CLAUDE.md`, `docs/intake-policy.md`, and `scripts/validate-atlas.rb`.

## Follow-Up Check

The next time a raw article, link, or repo is provided, the agent should proceed without requiring the user to restate the intake workflow.
