# Create Architecture Diagrams

Use this when a system, cloud deployment, security boundary, network topology, or service map needs to become a visual artifact quickly.

## Current Resources

- [Architecture Diagram Generator](../resources/architecture-diagram-generator.md): useful for turning plain-language system descriptions into polished dark-theme HTML/SVG diagrams with built-in copy, PNG, and PDF export.

## Decision Axes

- Does the diagram need to be accurate enough for architecture review or just clear enough for communication?
- Is the input a trusted architecture description, or does an agent first need to inspect the codebase?
- Can the output load Google Fonts and CDN export scripts, or does it need to be fully offline?
- Is a static HTML/SVG artifact enough, or is a real diagram DSL/editor required?
- Does the layout need manual review for overlapping labels, missing edges, or incorrect boundaries?

## Next Resources To Analyze

- `Cocoon-AI/process-flow-diagram-generator`
- Mermaid architecture diagram workflows
- PlantUML/C4 model tooling
- Structurizr DSL and C4 architecture docs
