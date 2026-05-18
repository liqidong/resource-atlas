# Source Retention Policy

Do not blindly commit full upstream sources.

## Defaults

- GitHub repositories: store source URL, commit/ref, manifest, validation results, and evidence notes. Copy selected files only when needed.
- Web resources: store URL, fetch date, content hash, and summary. Avoid full mirrors unless clearly safe.
- Local resources: store hash, path, and selected safe copies.
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

## Public Rule

Analysis can be public-ready even when source snapshots are partial. The source page must say what was reviewed and what was not reviewed.
