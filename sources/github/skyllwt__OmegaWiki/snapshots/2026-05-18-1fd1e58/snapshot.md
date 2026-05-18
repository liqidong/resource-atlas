# Source Snapshot: OmegaWiki

- Source: https://github.com/skyllwt/OmegaWiki
- Reviewed ref: `1fd1e5856e09e5ccc36d31845af201351f8a3413`
- Reviewed date: 2026-05-18
- Commit subject: `Release v1.4.0 — /poster skill for academic poster generation (#51)`
- Changelog version reviewed: `1.4.0` dated 2026-05-18
- Temporary clone size: 19M
- Upstream files reviewed: 247
- Python files: 23
- Markdown files: 144
- Markdown lines: about 26,895
- GitHub API observed on 2026-05-18: 683 stars, 104 forks, 9 subscribers, 1 open issue, 0 open PRs, GitHub Pages disabled.
- GitHub API license detection: MIT; repository `LICENSE` file states MIT.
- Validation run: `python3 -m py_compile tools/*.py` -> OK
- Validation run: `PYTHONPATH=tools python3 .sleepcode/tests/test_discover_from_venue.py` -> 20 tests passed
- Validation not completed: `tools/lint.py` needs PyYAML in the Python environment; full setup was not run during intake.

## Evidence Files Reviewed

- `README.md`: project positioning, quick start, API keys, slash-command lifecycle, wiki entity model, automation, project structure, bilingual support, and latest `/poster` announcement.
- `CHANGELOG.md`: version history, including `1.4.0` `/poster`, `1.3.0` venue discovery, `1.1.0` visualization/methods schema change, and `0.1.0` initial platform.
- `CLAUDE.md`: runtime contract, hard rules, ownership zones, schema/policy pointers, and Python environment guidance.
- `runtime/CLAUDE.md`, `runtime/schema/entities.yaml`: wiki entity contract and schema-driven runtime.
- `.claude/skills/ingest/SKILL.md`: paper intake flow, entity writes, graph/citation writes, source enrichment, and validation expectations.
- `.claude/skills/init/SKILL.md`: bootstrap flow, local/discovered source handling, parallel ingest, and fan-in verification.
- `.claude/skills/daily-arxiv/SKILL.md`: daily paper recommendation, setup/status behavior, and auto-ingest guardrails.
- `.claude/skills/novelty/SKILL.md`: multi-source novelty checking and optional score persistence.
- `.claude/skills/poster/SKILL.md`: academic poster workflow added in `1.4.0`.
- `tools/serve.py`: local web UI server, loopback API, live reload, and explicit slash-command boundary.
- `tools/lint.py`: structural validator checks for links, frontmatter, enums, cross-reference symmetry, graph edges, and citations.
- `tools/discover.py`, `tools/fetch_s2.py`, `tools/fetch_deepxiv.py`: external discovery and paper metadata integrations.
- `.github/workflows/daily-arxiv.yml`: scheduled recommendation workflow, optional auto-ingest, artifacts, and push-back behavior.
- `.env.example`, `config/setup-guide.md`, `config/settings.local.json.example`: API keys, optional integrations, and broad Claude Code permission example.
- `.sleepcode/tests/test_discover_from_venue.py`: visible unittest coverage for venue discovery.
- `LICENSE`: MIT.

## Metadata Findings

- README still describes "24 slash commands" while the reviewed tree contains 26 skill directories, including `poster` and `visualize`. Treat the count as moving marketing metadata rather than a stable contract.
- `CHANGELOG.md` says the initial `0.1.0` release had 2,125 tests, but only `.sleepcode/tests/test_discover_from_venue.py` was visible in the reviewed tree.
- GitHub releases API returned no releases even though `CHANGELOG.md` records `1.4.0`; the tag list showed `v1.0.0`.
- The network/privacy boundary is intentionally broad: Claude Code or compatible Anthropic endpoints, Semantic Scholar, DeepXiv, arXiv, Paper Copilot, Wikipedia, SMTP, GitHub Actions, OpenAI-compatible review LLMs, and SSH/rsync remote experiment helpers may all be involved depending on the skill.

## Source Retention Decision

Do not commit the full upstream repo for this entry. The project is public but includes a large working platform, assets, skill prompts, generated wiki structure, and runtime code. Keep the commit ref, manifest, validation result, and evidence summary. Re-fetch upstream when refreshing.
