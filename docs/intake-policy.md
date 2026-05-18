# Intake Policy

Resource Atlas has three intake modes.

## Default Agent Posture

Agents are expected to manage intake, not merely transcribe user instructions. If the user drops a new article, link, repository, paper, or rough note into the repository context, infer the intended resource workflow and proceed with the smallest safe intake mode.

Ask a question only when the missing answer would materially change the resource identity, privacy/publication status, or recommendation. Otherwise, act as the integrator: gather evidence, write/update the canonical files, and verify the result.

## Branch And Worktree Gate

Default intake isolation is:

```text
one resource = one branch = one git worktree = one resource-scoped commit
```

This keeps review, rollback, refresh, and provenance clean even when several
resources are being collected in parallel.

Before starting a resource intake:

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
resource page or inbox card, one matching source subtree, and the minimal shared
catalog/index/log changes for that same resource. If the diff contains multiple
resource pages, multiple source subtrees, or a branch name that no longer matches
the actual scope, stop and split the work before merging.

If the user intentionally wants several resources processed at once, use sibling
worktrees/branches by default. Only use a batch branch when batch mode is
explicitly requested; in batch mode, keep one commit per resource and reserve a
separate integration commit for cross-resource links or shared cleanup.

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
10. Before merge, run `git diff --name-status main...HEAD` and confirm the branch scope still matches the intended resource.
11. Run `ruby scripts/validate-atlas.rb` before claiming completion. If the script is unavailable, manually verify YAML parsing, data/page consistency, local links, required sections, public path hygiene, and source references.

## Field Calibration

Before marking a full analysis public-ready or updating README:

- Make `recommendation` in `data/resources.yaml` and page frontmatter as specific as the narrative judgment. Use values such as `recommended_with_caveats` when caveats materially change how the resource should be used.
- Separate stable evidence from volatile community signal. Commit refs, content hashes, license files, and validation results are evidence; stars, forks, and issue counts are advisory snapshots with `observed_at` dates.
- Write validation commands and source paths in public artifacts as repo-relative or temporary-clone-relative paths. Do not publish absolute `/tmp`, home-directory, or machine-specific paths unless they are necessary evidence.

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
- Did branch/worktree isolation fail or did a single-resource branch accumulate multiple resources?
- Should a policy, template, or `AGENTS.md` rule change?

If yes, create or update a learning using `docs/self-improvement-policy.md`.
