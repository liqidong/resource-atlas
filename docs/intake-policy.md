# Intake Policy

Resource Atlas has three canonical intake modes plus non-canonical candidate and
rejected-note modes. This file is the canonical operating procedure for intake,
refresh/update, branch/worktree handling, submission, and completion gates.

## Default Agent Posture

Agents are expected to manage intake, not merely transcribe user instructions. If the user drops a new article, link, repository, paper, or rough note into the repository context, infer the intended resource workflow and proceed with the smallest safe intake mode.

Ask a question only when the missing answer would materially change the resource identity, privacy/publication status, or recommendation. Otherwise, act as the integrator: gather evidence, write/update the canonical files, and verify the result.

## Mode Triage

Use the smallest mode that preserves future recall:

- **Full analysis** when the user asks to add a resource to the library, the item is clearly high-value, or the judgment will drive future use.
- **Quick card** when a user-provided or user-approved item is interesting but evidence is thin or the value is not yet worth full analysis.
- **Refresh/update** when the URL, slug, alias, or `resource_id` matches an existing entry and the source or judgment may have changed.
- **Rejected/non-fit** when a reviewed item is not worth intake but should be remembered to avoid future re-suggestion.
- **Candidate note** only for proactive discoveries that the user has not approved for canonical intake.

## Branch And Worktree Gate

Default isolation is proportional to risk.

- Full analyses, substantial refreshes, and rule changes should use one
  resource, one branch, one git worktree, and one resource-scoped commit.
- Quick cards, rejected notes, and candidate notes may be handled as a small
  resource-scoped commit from a clean, current `main` when there is no parallel
  work, local WIP, or privacy risk.
- Use a dedicated branch/worktree whenever the task is high-risk, likely to touch
  source evidence, part of a batch, or easy to confuse with nearby intake work.

This keeps review, rollback, refresh, and provenance clean even when several
resources are being collected in parallel.

Before starting a branch-backed resource intake:

1. Return to a clean, current `main`.
2. Create a resource branch whose name matches the resource slug.
3. Prefer a dedicated worktree, for example:

   ```bash
   git worktree add ../resource-atlas-{slug} -b codex/{slug} main
   ```

4. Verify the new branch starts clean:

   ```bash
   git status --short --branch
   git diff --name-status main...HEAD
   ```

For a normal single-resource branch, the merge candidate should contain only one
resource page or inbox card, one matching source subtree when evidence is
retained, and the minimal shared catalog/index/log changes for that same
resource. If the diff contains multiple resource pages, multiple source
subtrees, or a branch name that no longer matches the actual scope, stop and
split the work before merging.

If the user intentionally wants several resources processed at once, use sibling
worktrees/branches by default. Only use a batch branch when batch mode is
explicitly requested; in batch mode, keep one commit per resource and reserve a
separate integration commit for cross-resource links or shared cleanup.

The resource branch is for isolation while the intake is being written. Unless
the user explicitly asks for a pull request, review branch, or branch-only
handoff, the default landing target for completed Resource Atlas intake is
`main`, pushed to `origin/main`.

## Submission Completion Gate

For submit, commit, push, or "finish this intake" requests, completion requires a
visibility check across the local checkout and upstream:

1. Run `ruby scripts/validate-atlas.rb`.
2. Confirm the expected commit is reachable from the target upstream branch and
   report the SHA in the handoff. For normal intake, this means `origin/main`,
   not only `origin/codex/{slug}`.
3. Confirm discoverable resources appear in `README.md`, `wiki/index.md`, and
   `wiki/log.md` when the policy says those front doors should be updated.
4. Check `git status --short --branch`. If the current `main` is behind
   `origin/main`, fast-forward with autostash when safe. If local WIP or risk
   prevents syncing, say plainly that the remote is updated but this window is
   not synced yet.

## Quick Card

Use when a user-provided or user-approved resource is interesting but not yet worth full analysis.

Required writes:

- `wiki/inbox/{slug}.md`
- `data/resources.yaml` entry with `lifecycle_status: quick_note`

The quick-card data entry should still include at least `resource_id`, `canonical_slug`, `title`, `resource_type`, `source_kind` when known, `source_url`, `lifecycle_status`, `recommendation`, `tags`, and `use_cases`. A source snapshot manifest is optional for quick cards unless evidence is retained beyond the inbox note.

Do not update README unless the resource is immediately important.

Do not use canonical quick cards for proactive discoveries without user approval. For unapproved proactive discovery, propose the candidate in conversation or, if the user asks to keep a queue, write a non-canonical candidate note under `wiki/candidates/{slug}.md` without adding it to `data/resources.yaml`.

## Candidate Note

Use when an agent proactively discovers a possible future resource and the user wants it queued without approving intake yet.

Required writes:

- `wiki/candidates/{slug}.md`

Do not update `data/resources.yaml`, README, use-case pages, or source manifests for an unapproved candidate note unless explicitly delegated.

## Rejected / Non-Fit

Use when a reviewed item should be remembered as not worth intake, especially to avoid re-suggesting it later.

Required writes:

- `wiki/rejected/{slug}.md`

Rejected/non-fit notes are not canonical resources by default. Do not add them to `data/resources.yaml` unless the user explicitly wants rejected resources tracked there with `lifecycle_status: rejected`.

## Full Analysis

Use when the user asks to add a resource to the library.

Default workflow:

1. Assign or resolve a stable `resource_id`.
2. Run independent review passes when possible:
   - source/structure reviewer
   - value/use-case reviewer
   - integrator
   Use subagents for non-trivial or high-risk resources when tools allow it. If
   subagent tooling is unavailable or would add more overhead than value, the
   integrator should run the source/structure and value/use-case passes
   sequentially and note that fallback in the resource page.
3. Capture source evidence under `sources/`.
4. Write `wiki/resources/{slug}.md`.
5. Update `data/resources.yaml`.
6. Update `data/tags.yaml`, `data/use-cases.yaml`, and `data/relationships.yaml` only when needed.
7. Update README only when the resource is shortlisted, recommended, or important to watch.
8. Append `wiki/log.md`.
9. Run the self-improvement trigger check. Create or update a learning only if
   the intake revealed a durable process lesson.
10. Before merge, run `git diff --name-status main...HEAD` and confirm the branch scope still matches the intended resource.
11. Run `ruby scripts/validate-atlas.rb` before claiming completion. If the script is unavailable, manually verify YAML parsing, data/page consistency, local links, required sections, public path hygiene, and source references.

## Field Calibration

Before marking a full analysis public-ready or updating README:

- Make `recommendation` in `data/resources.yaml` and page frontmatter as specific as the narrative judgment. Use values such as `recommended_with_caveats` when caveats materially change how the resource should be used.
- Separate stable evidence from volatile community signal. Commit refs, content hashes, license files, and validation results are evidence; stars, forks, and issue counts are advisory snapshots with `observed_at` dates.
- For GitHub forks, make the source identity explicit. Preserve the user-provided fork as reviewed source when appropriate, record the parent/source repository and freshness comparison when available, and label fork metrics separately from parent project metrics.
- Write validation commands and source paths in public artifacts as repo-relative or temporary-clone-relative paths. Do not publish absolute `/tmp`, home-directory, or machine-specific paths unless they are necessary evidence.

After batch intake or multi-branch integration, do not only check that YAML parses. Confirm `ruby scripts/validate-atlas.rb` passes after it has checked page/data field calibration, `wiki/index.md`, source metadata/manifests, learning pages, local links, and branch scope.

## Refresh / Update

Use when an already analyzed resource may have changed. Follow `docs/update-policy.md`; preserve judgment history, distinguish `last_checked` from `last_reviewed`, and update README/use-case pages only when recommendation or discoverability changes.

## Self-Improvement Check

Before finishing a full analysis, refresh, or rule change, apply
`docs/self-improvement-policy.md` as a trigger check, not as a mandatory
retrospective. At minimum ask:

- Did the user correct the process?
- Did multi-agent review catch a repeatable issue?
- Did verification fail in a way that could happen again?
- Did branch/worktree isolation fail or did a single-resource branch accumulate multiple resources?
- Should a policy, template, or `AGENTS.md` rule change?

If yes, create or update a learning using `docs/self-improvement-policy.md`.
Do not add a learning for one-off typos, resource-specific facts, or vague
advice that will not change future behavior.
