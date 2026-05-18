# Update Policy

Resource updates preserve judgment history.

## Status Fields

- `update_status: current` means no known upstream change.
- `update_status: upstream_changed` means the source changed but the analysis has not been reviewed.
- `update_status: review_needed` means the resource needs a human/agent judgment pass.
- `update_status: partially_stale` means some use cases or claims may be outdated.
- `update_status: unavailable` means the source cannot currently be fetched.
- `update_status: archived` means no active refresh is expected.

## Refresh Steps

1. Resolve the resource by `resource_id`, slug, URL, or alias.
2. Fetch upstream metadata.
3. Compare upstream ref/hash with `reviewed_source_ref`.
4. If unchanged, update `last_checked` only.
5. If changed, create a new snapshot manifest.
6. Review whether old judgment still holds.
7. Append `Update History`.
8. Update data and README only if recommendation or discoverability changed.

## Stewardship Refresh Signals

Agents should watch for refresh needs that emerge from the atlas itself:

- Upstream repositories have new commits, releases, major README changes, or meaningful issue/PR shifts.
- A newer successor or competing resource appears and may change the old recommendation.
- A resource's original use case becomes more or less important based on later accepted entries.
- The user's repeated judgments reveal that a previous fit, risk, or "will I use this" assessment should be revisited.

For proactive refresh, propose the reason and expected scope first when the change would rewrite judgment, public positioning, or README discoverability.
