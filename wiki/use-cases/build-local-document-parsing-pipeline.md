# Build A Local Document Parsing Pipeline

Use this when the goal is to self-host document parsing for private files, batch ingestion, or repeatable RAG preprocessing.

## Best Current Resource

- [MinerU](../resources/mineru.md): provides CLI, FastAPI, Gradio, Docker, router, local model configuration, and multiple inference backends.

## Selection Notes

- Strongest path if the workflow needs PDF/Office/image coverage plus structured Markdown/JSON outputs.
- Local deployment still has real setup cost: model downloads, Python 3.10-3.13, 16GB+ RAM, disk space, and backend-specific GPU/VRAM choices.
- Offline use requires pre-downloaded models and correct `mineru.json` paths.

## Gaps

- Need a hands-on local benchmark with representative private PDFs before using it as a default production ingestion layer.
