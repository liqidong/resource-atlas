# Compare Computer-Use Agents

Use this when comparing GUI agents, browser agents, remote sandboxes, and hosted computer-use APIs.

## Current Resources

- [UI-TARS Desktop](../resources/ui-tars-desktop.md): strong open-source reference for a full GUI agent stack, but high-risk for privacy-sensitive use and not yet verified as a stable daily driver.
- [CLI-Anything](../resources/cli-anything.md): useful counterpoint to screenshot-and-click agents; it tries to make real software agent-native through generated CLIs, registries, and skills instead of direct GUI operation.

## Comparison Axes

- Local execution vs local inference
- Screenshot and instruction data flow
- Desktop, browser, mobile, and remote sandbox support
- Model/provider portability
- Action reliability and recovery
- Guardrails against unsafe actions
- Telemetry/reporting defaults
- Setup cost and maintenance burden
- License and reuse boundaries
- Whether the task can avoid GUI control entirely by exposing a CLI or structured backend

## Next Resources To Analyze

- `bytedance/UI-TARS`
- Browser-use
- OpenAI computer-use examples
- Anthropic computer-use examples
- Agent sandbox implementations
