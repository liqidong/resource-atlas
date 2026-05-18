# Parse Documents For RAG

Use this when source documents need to become retrieval-friendly Markdown, JSON, images, tables, formulas, or layout-aware intermediate files.

## Best Current Resource

- [MinerU](../resources/mineru.md): strongest current entry for parsing PDFs, scanned documents, images, DOCX, PPTX, and XLSX into Markdown/JSON for RAG and agent workflows.

## Selection Notes

- Best fit when layout, tables, formulas, reading order, and OCR quality matter.
- Use local models and `MINERU_MODEL_SOURCE=local` when document privacy matters.
- Treat hosted demos, remote model downloads, remote OpenAI-compatible inference servers, and optional LLM-assisted title cleanup as networked modes.

## Gaps

- Need to compare MinerU against Marker, Docling, Unstructured, Nougat-style academic parsers, and hosted document AI products.
