---
title: MinerU
resource_id: res_20260518_mineru_603de17
slug: mineru
canonical_slug: mineru
aliases:
  - MinerU
  - opendatalab/MinerU
  - magic-pdf
resource_type: github_repo
source_url: https://github.com/opendatalab/MinerU
canonical_source: https://github.com/opendatalab/MinerU
local_source: sources/github/opendatalab__MinerU/
source_kind: github
source_fingerprints:
  - git:603de17e95e7795374d02b604cc0fd27998613f4
  - tree-content-sha256:7d8417f536a382f888820ef069d8a2b3c30aee776aa61ff7fa02e57b3a880f92
date_added: 2026-05-18
last_reviewed: 2026-05-18
reviewed_source_ref: 603de17e95e7795374d02b604cc0fd27998613f4
last_checked: 2026-05-18
update_status: current
review_status: reviewed
lifecycle_status: shortlisted
maturity: mature_project_unverified_workload
recommendation: recommended_with_caveats
fit_for_user: high
time_to_value: medium
setup_cost: high
maintenance_burden: high
risk_level: medium
evidence_quality: medium_high
will_i_actually_use_this: yes
public_ready: yes
private_notes: no
source_publishable: partial
language: en/zh
redaction_needed: no
tags:
  - document-parsing
  - pdf-extraction
  - ocr
  - rag-ingestion
  - multimodal-document-ai
  - office-document-parsing
  - local-first
  - open-source-template
use_cases:
  - parse-documents-for-rag
  - build-local-document-parsing-pipeline
  - compare-document-parsers
recommended_for:
  - 把 PDF、扫描件、图片、DOCX、PPTX、XLSX 转成 Markdown/JSON 供 RAG 或 agent 使用
  - 评估本地/私有文档解析基础设施
  - 处理论文、表格、公式、多栏版式和 OCR-heavy 文档的开源方案对比
not_recommended_for:
  - 完全不想处理模型下载、GPU/CPU 资源和部署环境的人
  - 要求许可证等同于原版 Apache-2.0 且没有附加条款的场景
  - 想把所有模式和集成都默认视为离线/本地的隐私敏感流程
confidence: high
---

# MinerU

## Beginner Verdict

- What this is: 一个高采用度的文档解析引擎，把 PDF、图片、DOCX、PPTX、XLSX 转成 Markdown、JSON、图片、表格、公式和 layout 中间结果，服务 RAG、LLM 和 agent 工作流。
- Who should care: 正在做 RAG 文档摄取、论文解析、表格/公式抽取、私有文档处理、Office 文件入库、或想比较开源 document AI 基建的人。
- When I should remember it: 当我需要“把复杂文档变成 LLM-ready Markdown/JSON”，尤其遇到扫描件、多栏论文、表格、公式、图片说明、阅读顺序和本地部署要求时。
- Not for: 想要零部署轻工具的人、不能接受重 ML 依赖的人、要求标准 Apache-2.0 无附加条款的商业场景、或把所有模式默认当作离线的隐私敏感流程。
- Setup difficulty: 中高。在线 demo 可快速试效果，但本地生产使用涉及 Python 3.10-3.13、模型下载、16GB+ RAM、磁盘空间、GPU/VRAM 或远程推理服务选择。
- My verdict: 推荐入库，标记 `recommended_with_caveats`。这是 RAG 文档解析方向的重要候选，但必须带着许可证、离线边界和部署成本一起记住。

## One-Sentence Summary

MinerU 是 OpenDataLab 的开源文档解析基础设施，把 PDF、扫描件、图片和 Office 文档转换成 Markdown/JSON 等结构化输出，适合 RAG/agent 摄取管线，但本地部署、许可证和隐私边界都需要认真配置。

Community signal observed on 2026-05-18: GitHub API reported 63,477 stars, 5,351 forks, 17 open issues plus PRs, 5,429 commits, GitHub Pages docs, PyPI version 3.1.14, and latest GitHub release `mineru-3.1.14-released`.

## What It Is

MinerU 是一个文档内容提取和结构化解析项目。它面向的不是“打开 PDF 看一眼”，而是把复杂文档变成后续程序可以消费的内容：

- Markdown for humans and LLMs.
- JSON sorted by reading order.
- `middle.json` and `model.json` for secondary development and debugging.
- Images, tables, formulas, layout visualization, and span visualization files.

它覆盖 PDF、图片、DOCX、PPTX、XLSX，README 还把它明确放在 LLM、RAG、Agent 工作流里。它有 CLI、FastAPI、Gradio WebUI、Docker、router、多 GPU/多服务部署、OpenAI-compatible VLM server/client 等入口。

## What Problem It Solves

RAG 和 agent 系统的瓶颈经常不在模型，而在“输入材料脏成一团”：PDF 阅读顺序错、页眉页脚污染、扫描件 OCR 差、表格碎掉、公式丢失、多栏论文串行错、Office 文档需要先转 PDF 才能处理。

MinerU 试图把这类文档解析问题前置解决。它的价值是让下游检索、问答、抽取、摘要和知识库构建拿到更干净、更结构化的材料。

这不是一个保证所有文档都完美的魔法盒。README 自己提醒，复杂版式、扫描页、手写内容等场景仍可能效果不理想，建议先用在线 demo 或代表性样本评估。

## Who It Is For

适合：

- RAG/agent ingestion pipeline 开发者。
- 需要解析论文、技术报告、财报、合同、扫描 PDF、表格密集文档的人。
- 想自托管文档解析服务的团队。
- 想比较开源 document AI 工具的人。
- 需要从 DOCX、PPTX、XLSX 等 Office 文件直接提取内容的人。
- 需要视觉调试文件来判断解析质量的人。

不适合：

- 非技术用户的一键小工具期待。
- 不愿安装模型、处理 Python/torch/vLLM/LMDeploy/MLX 生态的人。
- 需要绝对稳定、无需样本验证的生产抽取流程。
- 所有文档都不能触网，但又不愿预下载模型和审配置的人。
- 法务上不能接受非标准 SPDX Apache-2.0 许可证的人。

## How It Works

MinerU 提供多种后端：

- `pipeline`: 兼容性较好，可 CPU/GPU 跑，适合作为稳定路径。
- `vlm-*`: 使用 VLM 模型，精度更高但硬件要求更高。
- `hybrid-*`: 结合原生文本提取、pipeline 和 VLM，当前默认后端是 `hybrid-auto-engine`。
- `*-http-client`: 把 VLM/hybrid 推理交给 OpenAI-compatible server，可是本地也可以是远程。

主要入口来自 `pyproject.toml`：

- `mineru`: CLI orchestration client.
- `mineru-api`: FastAPI service.
- `mineru-router`: 多服务/多 GPU 统一入口。
- `mineru-gradio`: WebUI.
- `mineru-openai-server`, `mineru-vllm-server`, `mineru-lmdeploy-server`: VLM inference server modes.
- `mineru-models-download`: 下载 pipeline/VLM 模型并写入配置。

CLI 如果不传 `--api-url`，会启动一个临时本地 `mineru-api`。传 `--api-url` 时会连接已有本地或远程 FastAPI 服务。

## How To Use It

快速安装路径：

```bash
pip install --upgrade pip
pip install uv
uv pip install -U "mineru[all]"
```

最小解析命令：

```bash
mineru -p <input_path> -o <output_path>
```

纯 CPU 路径：

```bash
mineru -p <input_path> -o <output_path> -b pipeline
```

本地模型路径：

```bash
mineru-models-download
export MINERU_MODEL_SOURCE=local
mineru -p <input_path> -o <output_path>
```

API 路径：

```bash
mineru-api --host 127.0.0.1 --port 8000
```

关键提醒：`mineru-models-download` 仍需要 Hugging Face 或 ModelScope 等远程模型源。离线运行是“先下载、再配置 local”，不是所有默认路径都不联网。

## Source Walkthrough

- `README.md`: 项目定位、能力列表、硬件/部署表、安装命令、在线 demo、本地使用、许可证提示、release 重点。
- `pyproject.toml`: Python 3.10-3.13、依赖、optional extras、console scripts、LicenseRef metadata。
- `LICENSE.md`: Apache 2.0 based custom license with added commercial threshold and attribution terms.
- `docs/en/usage/quick_usage.md`: CLI/API/WebUI/router/http-client 使用方式、API task 生命周期、配置项。
- `docs/en/usage/model_source.md`: Hugging Face 默认、ModelScope 替代、local model workflow。
- `docs/en/reference/output_files.md`: 输出文件、layout/span 可视化、`model.json`、`middle.json`、`content_list.json` 结构。
- `mineru/cli/client.py`: CLI 作为本地/远程 API client 的 orchestration。
- `mineru/cli/fast_api.py`: FastAPI endpoints, task state, upload processing, cleanup.
- `mineru/cli/router.py`: multi-service and multi-GPU routing.
- `mineru/cli/public_http_client_policy.py`: 公开绑定时默认禁用 caller-specified http-client/server URL 的 SSRF 防护。
- `mineru/cli/models_download.py` and `mineru/utils/models_download_utils.py`: 模型下载、模型源和 local model path。
- `mineru/utils/llm_aided.py`: 可选的 OpenAI-compatible 标题层级优化。
- `tests/unittest/test_e2e.py`: 用样例 PDF 验证 image/table/equation/text content。
- `.github/workflows/*.yml`: CI、docs、release、PyPI 发布信号。

Local validation: Python 3.12 syntax compile over all upstream Python files passed. Python 3.9 syntax compile failed on `match`, which is expected because upstream requires Python 3.10+.

## What It Can Do Well

- 把 PDF/图片/Office 文档转成 Markdown 和结构化 JSON。
- 处理页眉页脚、阅读顺序、多栏版式、表格、公式、图片说明等 RAG 预处理痛点。
- OCR 覆盖 109 languages。
- 提供 visual debug 文件，方便人工检查 layout 和 span。
- 同时提供 CLI、API、WebUI、Docker、router，适合从试用到服务化。
- 支持本地部署和多种推理后端。
- 社区采用度和发布频率都很强。
- 对中文用户友好：中英文 README/docs，ModelScope 路径，国产 AI 芯片适配文档。

## Limits And Risks

- 许可证不是原版 Apache-2.0。它是 MinerU Open Source License，Apache 2.0 based with additional terms: 超过 100M MAU 或 USD 20M monthly revenue 需要单独商业许可；基于 MinerU 向第三方提供在线服务时有显著标识义务。
- “Private / Fully Offline” 要按模式理解。默认模型源是 Hugging Face，ModelScope 可选；真正离线需要预下载模型、配置 `mineru.json`、设置 `MINERU_MODEL_SOURCE=local`。
- 可选 LLM-aided title hierarchy 会调用 OpenAI-compatible endpoint。默认关闭，但隐私敏感场景要检查配置。
- `*-http-client` 可连接本地或远程 OpenAI-compatible VLM server；远程服务会把推理边界移出本机。
- API task state 只在进程内保存，重启、reload、多进程部署不会保留任务状态；完成/失败任务默认保留 24 小时后清理。
- Docker 官方说明不支持 macOS Docker 路径，macOS 要走 pip/source install。
- 硬件和环境要求不轻。README 建议 16GB+ RAM，某些路径需要 20GB disk，VLM/hybrid local engine 需要 GPU/VRAM 或 Apple Silicon/特定推理框架。
- README 承认复杂 layout、扫描件、手写内容等结果可能不达预期。必须用代表性样本测。
- Public API/router 若允许 caller-specified remote HTTP inference endpoint，会有 SSRF/internal network probing 风险；上游默认做了保护，但部署者可以打开。

## Similar Resources

- [Marker](https://github.com/datalab-to/marker): PDF/document to Markdown方向的重要开源对照。
- [Docling](https://github.com/docling-project/docling): IBM 方向的文档转换和结构化解析工具。
- [Unstructured](https://github.com/Unstructured-IO/unstructured): 企业文档摄取和多格式解析生态。
- [LlamaParse](https://www.llamaindex.ai/llamaparse): Hosted/API-first document parsing option.
- [PaddleOCR](https://github.com/PaddlePaddle/PaddleOCR): OCR 和版面相关基础组件，MinerU README 也在 acknowledgments 中提到。

## My Judgment

推荐入库，标记为 `shortlisted` 和 `recommended_with_caveats`。

MinerU 是 Resource Atlas 里第一类“文档摄取基础设施”资源。它和 prompt/research agent 资源不同，它解决的是 RAG/agent 之前的原材料问题：把 PDF、扫描件、Office 文档变成更可信的 Markdown/JSON。

个人使用时，我会把它当作：

1. RAG 文档解析候选基线。
2. 本地/私有 document parsing pipeline 的重要参考。
3. 比较 Marker、Docling、Unstructured、LlamaParse 时的高采用度开源对象。
4. 遇到表格、公式、扫描件、论文版式时优先想起的工具。

推荐等级：A- 作为“应该知道并评估”的 document parsing resource；B 作为“直接上生产”的默认选择，原因是样本文档质量、部署环境、许可证和隐私边界都要先验证。

Judgment axes:

- fit for user: high
- time to value: medium
- setup cost: high for local production, low/medium for online demo evaluation
- maintenance burden: high
- maturity: mature project, unverified for my real workload
- evidence quality: medium-high overall: high for structure and claims, medium for real-world parsing quality
- risk level: medium

## When To Remember This

- “我要把 PDF/扫描件/Office 文档变成 RAG 可用的 Markdown/JSON。”
- “我需要解析论文里的公式、表格、多栏布局、图片说明。”
- “我想自托管一个文档解析 API，而不是把文档交给 hosted parser。”
- “我需要先验证一个 document parser 的离线边界。”
- “我在比较 MinerU、Marker、Docling、Unstructured、LlamaParse。”
- “我需要能给解析质量做 visual debug 的输出。”

## Open Questions

- 在我的真实文档样本上，MinerU 和 Marker/Docling/Unstructured/LlamaParse 的 Markdown、table、formula、reading order 质量谁更稳？
- `hybrid-auto-engine` 默认路径在 CPU-only、Apple Silicon、CUDA GPU 上的实际 time-to-value 如何？
- 最新 release 的 custom license 在目标使用场景中是否能被接受？
- 是否需要把 `mineru-router` 和 durable queue/storage 结合，才能作为长期生产 API？
- Optional LLM-aided title cleanup 对隐私和质量的收益是否值得？
- Web page input claim在当前 CLI/docs里是否有完整、稳定的本地路径？

## Source Evidence

- Snapshot manifest: `sources/github/opendatalab__MinerU/snapshots/2026-05-18-603de17/manifest.yaml`
- Snapshot summary: `sources/github/opendatalab__MinerU/snapshots/2026-05-18-603de17/snapshot.md`
- Upstream commit reviewed: `603de17e95e7795374d02b604cc0fd27998613f4`
- GitHub API observed on 2026-05-18: 63,477 stars, 5,351 forks, 17 open issues plus PRs, 5,429 commits, GitHub Pages docs, latest release `mineru-3.1.14-released`.
- PyPI observed on 2026-05-18: package version 3.1.14, Python requirement `>=3.10,<3.14`, license expression `LicenseRef-MinerU-Open-Source-License`.
- Upstream files reviewed: `README.md`, `README_zh-CN.md`, `LICENSE.md`, `pyproject.toml`, `mineru.template.json`, `docs/en/usage/*.md`, `docs/en/reference/*.md`, `docker/compose.yaml`, `docker/global/Dockerfile`, `mineru/cli/*.py`, `mineru/utils/models_download_utils.py`, `mineru/utils/llm_aided.py`, `tests/unittest/test_e2e.py`, `.github/workflows/*.yml`.
- Local validation: Python 3.12 `py_compile` over all upstream Python files passed; Python 3.9 failed because the project uses Python 3.10+ syntax.
- Multi-agent review: one source/structure reviewer and one value/use-case reviewer both recommended full analysis and highlighted the same caveats around offline boundary, setup, and license.

## Evidence Standard

```yaml
evidence_reviewed:
  - file_or_url: README.md
    why_it_matters: Project positioning, supported formats, RAG/agent claims, hardware table, install/use commands, online/local modes, quality caveats.
  - file_or_url: LICENSE.md
    why_it_matters: Confirms Apache 2.0 based custom license, commercial thresholds, and online-service attribution obligation.
  - file_or_url: pyproject.toml
    why_it_matters: Package metadata, Python version support, dependencies, optional extras, entrypoints, license expression.
  - file_or_url: mineru.template.json
    why_it_matters: Shows local model paths and disabled-by-default OpenAI-compatible LLM-aided title config.
  - file_or_url: docs/en/usage/quick_usage.md
    why_it_matters: CLI, API, Gradio, router, http-client/server, task behavior, and configuration.
  - file_or_url: docs/en/usage/model_source.md
    why_it_matters: Verifies Hugging Face default, ModelScope alternative, and actual local model workflow.
  - file_or_url: docs/en/reference/output_files.md
    why_it_matters: Defines structured output artifacts for downstream RAG and debugging.
  - file_or_url: docker/compose.yaml
    why_it_matters: Shows local-model Docker service topology and public HTTP-client SSRF warning.
  - file_or_url: mineru/cli/public_http_client_policy.py
    why_it_matters: Confirms network-boundary protection around public API/router deployments.
  - file_or_url: mineru/cli/models_download.py and mineru/utils/models_download_utils.py
    why_it_matters: Confirms model downloads require remote model sources unless models are already local.
  - file_or_url: mineru/utils/llm_aided.py
    why_it_matters: Confirms optional OpenAI-compatible LLM call path.
  - file_or_url: tests/unittest/test_e2e.py
    why_it_matters: Shows upstream has at least one sample pipeline E2E content validation.
  - file_or_url: GitHub API, GitHub releases API, PyPI JSON
    why_it_matters: Current community signal, latest release, package version, and license metadata.
evidence_not_reviewed:
  - item: end-to-end MinerU run on real documents
    reason: Requires model download and representative documents; this intake avoided heavy model/runtime setup.
  - item: OmniDocBench or linked arXiv technical reports
    reason: Benchmarks and papers were referenced by README but not independently read or reproduced.
  - item: all docs, all issues, all PRs, and full ecosystem repositories
    reason: Intake focused on source structure, core docs, CLI/API boundary, and current release metadata.
  - item: commercial legal review
    reason: License terms were read, but acceptability depends on actual organization/use case.
  - item: security testing
    reason: SSRF-related upstream safeguards were inspected, but no exploit or deployment test was run.
ran_locally: partial
run_notes: Python 3.12 syntax compile passed for all upstream Python files. No app/model run was attempted.
license_checked: yes
security_or_privacy_notes: Offline use is possible only with pre-downloaded local models and careful config. Default model source, hosted demos, optional LLM-aided titles, remote http-client/server modes, HTTP/S3 IO, and online integrations can leave the local machine.
confidence_limits: High confidence in source structure, license caveats, and network-boundary summary; medium confidence in real-world parsing quality until tested on representative documents.
```

## Update History

```yaml
- date: 2026-05-18
  old_judgment: none
  new_judgment: recommended_with_caveats
  why_changed: First full analysis and intake.
  evidence: README, LICENSE, pyproject, docs, CLI/API/router/model-download code, Docker config, tests, GitHub API, PyPI metadata, multi-agent review, Python 3.12 py_compile.
  still_true: n/a
  no_longer_true: n/a
  confidence_change: none -> high
  source_ref: 603de17e95e7795374d02b604cc0fd27998613f4
```
