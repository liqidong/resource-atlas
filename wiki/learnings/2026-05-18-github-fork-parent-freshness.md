---
learning_id: learn_20260518_github_fork_parent_freshness
date: 2026-05-18
type: quality_bar
trigger: TradingAgents intake used a user-provided GitHub fork whose parent repository had active releases and was 76 commits ahead of the reviewed fork.
applies_to:
  - full-analysis
  - quick-card
  - refresh-update
  - github-resources
  - source-provenance
status: promoted
promoted_to:
  - AGENTS.md
  - docs/intake-policy.md
---

# GitHub Fork Parent Freshness

## What Happened

The user submitted `liqidong/TradingAgents`. Source review showed it was a public fork of `TauricResearch/TradingAgents`. The fork had no tags, no releases, no issues, and no community signal, while the parent project had a newer release and was 76 commits ahead of the reviewed fork commit.

## Root Cause

GitHub fork pages can preserve the parent README and project identity, so a quick read can accidentally treat the fork as the canonical active project. Community metrics, releases, issue counts, and default branch freshness may belong to the parent, not the reviewed fork.

## Fix Applied

The TradingAgents entry keeps the user-provided fork as the reviewed `source_url`, records the parent as `canonical_source`, labels fork and parent community signal separately, and marks the recommendation with a stale-fork caveat.

## Future Rule

When a user-provided GitHub source is a fork, record whether the atlas entry evaluates the fork, the parent project, or both. Capture parent identity and freshness when available, and do not borrow parent community metrics without labeling them.

## Where This Was Promoted

The rule was promoted into `AGENTS.md` and `docs/intake-policy.md`.

## Follow-Up Check

Future GitHub fork intakes should include source URL, canonical parent URL when known, reviewed ref, parent ref, and separate fork/parent metrics in the source manifest.
