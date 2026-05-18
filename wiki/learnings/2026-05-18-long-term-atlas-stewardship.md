---
learning_id: learn_20260518_long_term_atlas_stewardship
date: 2026-05-18
type: preference
trigger: User described Resource Atlas as a future agent-managed memory that should learn interests, propose resources, and refresh stale entries with review.
applies_to:
  - agent-onboarding
  - proactive-discovery
  - refresh-update
  - resource-review
  - interest-modeling
status: active
promoted_to:
  - AGENTS.md
  - README.md
  - docs/stewardship-vision.md
  - docs/update-policy.md
---

# Long-Term Atlas Stewardship

## What Happened

The user clarified the deeper purpose of Resource Atlas: after many GitHub repositories, papers, articles, and tools are analyzed, agents should be able to understand the library's direction and the user's interests, then use that understanding to suggest new resources and refresh existing ones.

## Root Cause

The previous stewardship contract made agents responsible for intake, but it mostly covered immediate workflow. It did not fully capture the future state where agents maintain an evolving interpretation of the atlas and help guide its growth.

## Fix Applied

The vision was promoted into `AGENTS.md`, `README.md`, `docs/stewardship-vision.md`, and `docs/update-policy.md`.

## Future Rule

Agents should treat accumulated resources, use cases, judgments, and learnings as evidence for an evolving user interest model. Use that model to propose new candidates and refresh stale resources, while keeping user approval before proactive discoveries become canonical full-analysis entries.

## Where This Was Promoted

The rule was promoted into `AGENTS.md`, `README.md`, `docs/stewardship-vision.md`, and `docs/update-policy.md`.

## Follow-Up Check

When enough resources accumulate, agents should periodically synthesize themes, gaps, stale entries, and candidate next resources from the atlas itself.
