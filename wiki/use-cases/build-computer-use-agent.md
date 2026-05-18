# Build A Computer-Use Agent

Use this when looking for implementation references for an agent that can control a desktop, browser, mobile device, or remote sandbox through natural-language instructions.

## Current Resources

- [UI-TARS Desktop](../resources/ui-tars-desktop.md): useful reference for GUIAgent, operators, action parsing, Electron integration, and browser/MCP infra. Treat it as a reference stack before treating it as a production dependency.

## Implementation Axes

- OS permission model
- Screenshot and cursor feedback
- Vision-language model endpoint
- Action schema and parser
- Retry, stop, pause, max-loop handling
- Browser control strategy
- Remote sandbox strategy
- Audit trail and report export
- Prompt injection and unsafe action guardrails

## Next Resources To Analyze

- `browser-use/browser-use`
- `bytedance/UI-TARS`
- `agent-infra/sandbox`
- Hosted computer-use API examples
