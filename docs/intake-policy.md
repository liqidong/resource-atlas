# Intake Policy

Resource Atlas has three intake modes.

## Quick Card

Use when a resource is interesting but not yet worth full analysis.

Required writes:

- `wiki/inbox/{slug}.md`
- `data/resources.yaml` entry with `lifecycle_status: quick_note`

Do not update README unless the resource is immediately important.

## Full Analysis

Use when the user asks to add a resource to the library.

Default workflow:

1. Assign or resolve a stable `resource_id`.
2. Run multi-agent review when possible:
   - source/structure reviewer
   - value/use-case reviewer
   - integrator
3. Capture source evidence under `sources/`.
4. Write `wiki/resources/{slug}.md`.
5. Update `data/resources.yaml`.
6. Update `data/tags.yaml`, `data/use-cases.yaml`, and `data/relationships.yaml` only when needed.
7. Update README only when the resource is shortlisted, recommended, or important to watch.
8. Append `wiki/log.md`.
9. Check whether the intake revealed a reusable process lesson. If yes, update `data/learnings.yaml` and `wiki/learnings/`.

## Refresh / Update

Use when an already analyzed resource may have changed.

Rules:

- `last_checked` means the source was checked.
- `last_reviewed` means the judgment was reviewed.
- If upstream changed, preserve old judgment in `Update History`.
- If the recommendation changes, update README and use-case pages.

## Self-Improvement Check

Before finishing a full analysis or refresh, ask:

- Did the user correct the process?
- Did multi-agent review catch a repeatable issue?
- Did verification fail in a way that could happen again?
- Should a policy, template, or `AGENTS.md` rule change?

If yes, create or update a learning using `docs/self-improvement-policy.md`.
