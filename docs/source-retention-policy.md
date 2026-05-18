# Source Retention Policy

Do not blindly commit full upstream sources.

## Defaults

- GitHub repositories: store source URL, commit/ref, manifest, validation results, and evidence notes. Copy selected files only when needed.
- Web resources: store URL, fetch date, content hash, title/author/date when available, and summary. Avoid full mirrors unless clearly safe.
- Local resources: store hash, path, and selected safe copies. Absolute local paths belong only in private or non-public evidence records; public pages should use repo-relative, redacted, or descriptive paths.
- Packages: store package name, version, registry URL, and selected metadata.

## Snapshot Manifest

Every source snapshot should include:

- source
- fetched_at
- source_ref
- content_hash
- fetch_method
- files_included
- files_excluded
- total_size when practical
- license
- sensitivity
- publishable
- notes

For a retained web snapshot, prefer `sources/web/{domain}__{slug}/snapshots/{date}-{hash}/manifest.yaml`. Use `runtime/templates/source-manifest-web.yaml` as the starting shape.

## Public Rule

Analysis can be public-ready even when source snapshots are partial. The source page must say what was reviewed and what was not reviewed.
