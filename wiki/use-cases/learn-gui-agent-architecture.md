# Learn GUI Agent Architecture

Use this when studying how a multimodal agent can observe a GUI, call a vision-language model, parse actions, and execute them through desktop or browser operators.

## Current Resources

- [UI-TARS Desktop](../resources/ui-tars-desktop.md): large TypeScript/Electron monorepo with UI-TARS Desktop, Agent TARS, GUI agent SDK, action parser, operators, browser infra, and MCP packages.

## Study Axes

- Screenshot capture and compression
- Prompt/history/image window construction
- VLM provider boundary
- Action parser and coordinate scaling
- Operator interface design
- Desktop vs browser vs remote environments
- Event stream and visualization
- Permission and privacy boundaries

## Next Resources To Analyze

- `bytedance/UI-TARS`
- Browser-use repositories
- OpenAI computer-use docs
- Anthropic computer-use docs
