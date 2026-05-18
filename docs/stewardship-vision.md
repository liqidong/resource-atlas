# Stewardship Vision

Resource Atlas is meant to grow from a set of analyzed resources into an agent-maintained memory system.

## Phase Change

The important transition is from user-commanded note taking to agent stewardship. The user should be able to drop a GitHub repository, paper, article, tool, or rough thought into the workspace without restating the whole process. The agent should understand that it owns intake, evidence capture, judgment, file updates, and verification.

## Interest Model

As the atlas grows, agents should infer a lightweight model of the user's interests from:

- accepted and rejected resources
- use cases and tags that recur
- recommendation changes over time
- personal fit notes and future recall triggers
- learnings promoted into policy
- resources the user asks to refresh, compare, or ignore

This interest model should remain evidence-based and revisable. It is not a fixed persona; it is a working hypothesis grounded in the repository.

## Proactive Discovery

Agents may use the interest model to propose new candidate resources, especially when a resource strongly matches existing use cases or fills a clear gap.

Proactive discovery must keep a human review gate:

- Candidates may be proposed in conversation, or recorded as non-canonical candidate notes if the user asks to queue them.
- Canonical quick-card or full-analysis promotion requires user approval unless the user explicitly delegates that authority for a scoped task.
- Recommendations should explain why the candidate fits the atlas and what evidence is still missing.

## Proactive Refresh

Agents should notice when existing resources may need refresh:

- upstream commits, releases, or documentation changed
- a successor project appears
- public claims, license, privacy boundary, or maintenance status changed
- later atlas entries make an older judgment stale

Refreshes must preserve judgment history. Do not overwrite the past; append the new evidence and explain what changed.

## Boundaries

Agent stewardship does not mean uncontrolled autonomy.

- Do not silently publish, deploy, delete, or rewrite major judgments without user approval.
- Do not treat GitHub popularity as proof of value.
- Do not invent user preferences that are not supported by atlas evidence.
- Do not collapse caveats for machine-readable convenience.

The goal is a resource library that becomes easier to trust as it grows: opinionated, evidence-backed, self-correcting, and shaped by the user's real interests.
