# Source Snapshot: MinerU

- Source: https://github.com/opendatalab/MinerU
- Reviewed ref: `603de17e95e7795374d02b604cc0fd27998613f4`
- Reviewed date: 2026-05-18
- Upstream version: `3.1.14`
- Latest release observed: `mineru-3.1.14-released`, published 2026-05-15
- Temporary clone size: 38M
- Upstream files reviewed: 419
- Python files: 214
- Markdown files: 64
- GitHub API observed on 2026-05-18: 63,477 stars, 5,351 forks, 17 open issues plus PRs, 5,429 commits.
- License: MinerU Open Source License, based on Apache 2.0 with additional commercial threshold and attribution terms.
- Validation run: Python 3.12 syntax compile over all upstream Python files passed.
- Python 3.9 compile failed on `match` syntax, which is expected because upstream requires Python 3.10-3.13.

## Evidence Files Reviewed

- `README.md`: project positioning, changelog, format support, hardware table, install commands, local deployment, online demos, quality caveats, license note.
- `README_zh-CN.md`: Chinese mirror of major positioning and usage claims.
- `LICENSE.md`: MinerU Open Source License terms.
- `pyproject.toml`: package metadata, Python range, dependencies, optional extras, console entrypoints, license expression.
- `mineru.template.json`: model directory config and disabled-by-default OpenAI-compatible LLM-aided title hierarchy config.
- `docs/en/usage/quick_usage.md`: CLI, FastAPI, Gradio, router, http-client/server, task retention, and local API behavior.
- `docs/en/usage/model_source.md`: Hugging Face default model source, ModelScope alternative, local model configuration, and download behavior.
- `docs/en/usage/cli_tools.md`: command options and environment variables.
- `docs/en/reference/output_files.md`: Markdown, JSON, visual debug, middle/model/content-list output formats.
- `docs/en/reference/changelog.md`: recent capability and compatibility changes.
- `docker/compose.yaml`: service topology, local model source environment, public HTTP-client SSRF warning.
- `docker/global/Dockerfile`: container base and model download behavior.
- `mineru/cli/client.py`: CLI orchestration around local or remote `mineru-api`.
- `mineru/cli/fast_api.py`: API endpoints, task state, upload handling, retention defaults, public HTTP-client policy hook.
- `mineru/cli/router.py`: multi-service/multi-GPU routing.
- `mineru/cli/public_http_client_policy.py`: default block on caller-provided remote inference endpoints when publicly bound.
- `mineru/cli/models_download.py` and `mineru/utils/models_download_utils.py`: model download and local model path behavior.
- `mineru/utils/llm_aided.py`: optional OpenAI-compatible title hierarchy cleanup.
- `tests/unittest/test_e2e.py`: pipeline sample test over PDF content elements.
- `.github/workflows/*.yml`: CI, docs, release, and package publishing signals.

## Key Findings

- MinerU converts PDFs, images, DOCX, PPTX, and XLSX into Markdown/JSON and structured intermediate artifacts for retrieval, extraction, and agent workflows.
- It has several user surfaces: CLI, FastAPI, Gradio WebUI, Docker, router, OpenAI-compatible VLM server/client modes, and ecosystem integrations.
- The core value is document ingestion quality: reading order, header/footer cleanup, tables to HTML, formulas to LaTeX, OCR for 109 languages, visual debug files, and layout-aware JSON.
- Local deployment is real but mode-dependent. The default model source is Hugging Face; ModelScope and local models are supported. Fully offline use requires pre-downloaded models and `MINERU_MODEL_SOURCE=local`.
- Optional LLM-aided title cleanup can call an OpenAI-compatible endpoint. It is disabled by default but important for privacy-sensitive setups.
- API and router task state is in process only and not durable across restarts or multiprocess deployments.
- When API/router binds publicly, MinerU disables caller-specified `*-http-client` backends and `server_url` by default because those can create SSRF or internal network probing risk.
- The license is not plain Apache-2.0. It is Apache-based with added commercial threshold and online-service attribution conditions.

## Source Retention Decision

Do not commit the full upstream repo for this entry. The project is public and sizeable enough that a source ref, metadata, manifest, validation result, and evidence summary are sufficient. Re-fetch upstream when refreshing.
