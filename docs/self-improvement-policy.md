# Self-Improvement Policy

Resource Atlas should remember process mistakes and durable user preferences,
not just resource facts. This is an exception-triggered improvement loop, not a
requirement to write a retrospective after every intake.

Use this policy when:

- an intake missed important evidence
- a reviewer catches a repeatable quality issue
- the user corrects the workflow
- a template or policy caused confusion
- a resource page had to be fixed because the process was incomplete

## Rule

Do not only write a retrospective. Convert durable lessons into future behavior.

Each learning should answer:

- What happened?
- Why did it happen?
- What should change next time?
- Where was that rule promoted?

## Files

- `data/learnings.yaml` is the machine-readable learning index.
- `wiki/learnings/*.md` contains human-readable retrospectives.
- `runtime/templates/learning.md` defines the entry shape.
- `AGENTS.md`, `docs/*.md`, and `runtime/templates/*.md` are the places a learning becomes enforceable.

## Promotion Levels

- `logged`: recorded only.
- `active`: should affect future work.
- `promoted`: copied into a policy, template, or agent rule.
- `superseded`: replaced by a newer learning.

## What Deserves A Learning

Record a learning only if it would save future time or prevent future quality loss.

Good examples:

- "Always run multi-agent review for full resource intake."
- "Do not rely on GitHub license API alone; inspect the repository license file."
- "If a prompt library includes high-risk domains, add a safety caveat."

Bad examples:

- One-off typo fixes.
- Facts about a specific resource that belong only in that resource page.
- Vague advice like "be careful."

## Before Finishing Intake Or Rule Changes

For full analyses, refreshes, and rule changes, run a brief trigger check:

1. Did the user correct our process?
2. Did a reviewer catch something that could happen again?
3. Did verification fail in a reusable way?
4. Should this change `AGENTS.md`, a policy doc, or a template?

If yes, add or update a learning. If all answers are no, continue without adding
process documentation.
