# Source Snapshot: Yao Open Prompts

- Source: https://github.com/yaojingang/yao-open-prompts
- Reviewed ref: `fd1fdf0fa49ee4bf4aedb44842377db57240030c`
- Reviewed date: 2026-05-18
- Temporary clone size: 3.1M
- Upstream files reviewed: 267
- Chinese prompt files: 117
- English prompt files: 117
- Markdown lines: about 42,136
- GitHub API observed on 2026-05-18: 2,132 stars, 328 forks, 0 open issues, GitHub Pages enabled.
- GitHub API license detection: `NOASSERTION`; repository `LICENSE` file states CC BY 4.0.
- Validation run: `python3 scripts/check_repo.py` -> `Checked 234 prompt files. OK`

## Evidence Files Reviewed

- `README.md`: project positioning, usage flow, category stats, maintenance commands, license/source strategy.
- `CATALOG.md`: 117-prompt catalog and category distribution.
- `prompts/`: Chinese prompt library organized into 9 scenario categories.
- `prompts-en/`: English mirror with matching relative paths.
- `scripts/check_repo.py`: validates prompt frontmatter, status values, Feishu style residue, attachment references, and Chinese/English mirror completeness.
- `scripts/generate_catalog.py`: generates `CATALOG.md` from prompt frontmatter.
- `scripts/generate_english_readmes.py`: builds English README files from mirrored prompt structure.
- `templates/prompt-file-template.md`: required prompt page structure.
- `maintenance/taxonomy.md`: category definitions.
- `maintenance/prompt-review-checklist.md`: quality review checklist.
- `maintenance/release-checklist.md`: release process checklist.
- `CONTRIBUTING.md`: contribution and version rules.
- `LICENSE`: CC BY 4.0 prompt text license.

## Metadata Findings

- 24 Chinese prompt files and the matching 24 English prompt files have an empty or missing `created` field.
- `scripts/check_repo.py` does not require `created`, while `README.md` says prompt files include it.
- The repository has no release tags in the reviewed clone.

## Source Retention Decision

Do not commit the full upstream repo for this entry. The upstream source is public and small, but this Resource Atlas should avoid becoming a mirror of prompt libraries. Keep the commit ref, manifest, validation result, and analysis page. Re-fetch upstream when refreshing.
