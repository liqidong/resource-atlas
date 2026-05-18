#!/usr/bin/env ruby
# frozen_string_literal: true

require "date"
require "open3"
require "yaml"

ROOT = File.expand_path("..", __dir__)
ERRORS = []

def rel(path)
  path.delete_prefix("#{ROOT}/")
end

def read(path)
  File.read(path, encoding: "UTF-8")
end

def load_yaml(path)
  YAML.load_file(path)
rescue Psych::Exception => e
  ERRORS << "#{rel(path)}: invalid YAML: #{e.message}"
  nil
end

def resource_frontmatter(path)
  text = read(path)
  frontmatter = text[/\A---\n(.*?)\n---/m, 1]
  unless frontmatter
    ERRORS << "#{rel(path)}: missing YAML frontmatter"
    return {}
  end

  YAML.safe_load(frontmatter, permitted_classes: [Date], aliases: true) || {}
rescue Psych::Exception => e
  ERRORS << "#{rel(path)}: invalid frontmatter YAML: #{e.message}"
  {}
end

def each_markdown_link(path)
  read(path).scan(/\[[^\]]+\]\(([^)]+)\)/).flatten.each do |href|
    yield href
  end
end

def git_lines(*args)
  stdout, _stderr, status = Open3.capture3("git", *args, chdir: ROOT)
  return [] unless status.success?

  stdout.lines.map(&:strip).reject(&:empty?)
end

yaml_paths = %w[
  data/resources.yaml
  data/relationships.yaml
  data/use-cases.yaml
  data/tags.yaml
  data/learnings.yaml
].map { |path| File.join(ROOT, path) }

yaml_paths.each { |path| load_yaml(path) }

Dir[File.join(ROOT, "sources/**/*.yaml")].sort.each { |path| load_yaml(path) }

resources_doc = load_yaml(File.join(ROOT, "data/resources.yaml")) || {}
use_cases_doc = load_yaml(File.join(ROOT, "data/use-cases.yaml")) || {}
tags_doc = load_yaml(File.join(ROOT, "data/tags.yaml")) || {}
learnings_doc = load_yaml(File.join(ROOT, "data/learnings.yaml")) || {}

resources = resources_doc.fetch("resources", [])
use_cases = use_cases_doc.fetch("use_cases", {})
tags = tags_doc.fetch("tags", {})
resource_ids = resources.map { |resource| resource["resource_id"] }

if resource_ids.uniq.length != resource_ids.length
  duplicates = resource_ids.tally.select { |_id, count| count > 1 }.keys
  ERRORS << "data/resources.yaml: duplicate resource_id values: #{duplicates.join(", ")}"
end

required_page_headings = [
  "## Beginner Verdict",
  "## When To Remember This",
  "## Source Evidence",
  "## Evidence Standard",
  "## Update History"
]

required_quick_card_headings = [
  "## Quick Verdict",
  "## When To Remember This",
  "## Evidence Peek",
  "## Next Review Trigger"
]

frontmatter_fields_to_match = %w[
  resource_id
  canonical_slug
  resource_type
  source_kind
  source_url
  canonical_source
  local_source
  reviewed_source_ref
  last_checked
  last_reviewed
  update_status
  review_status
  lifecycle_status
  maturity
  recommendation
  fit_for_user
  time_to_value
  setup_cost
  maintenance_burden
  risk_level
  evidence_quality
  will_i_actually_use_this
  public_ready
  private_notes
  source_publishable
  language
  redaction_needed
  confidence
]

frontmatter_array_fields_to_match = %w[
  aliases
  tags
  use_cases
  recommended_for
  not_recommended_for
  source_fingerprints
]

required_manifest_fields = %w[
  source
  fetched_at
  source_ref
  content_hash
  fetch_method
  files_included
  files_excluded
  license
  sensitivity
  publishable
  notes
]

resources.each do |resource|
  slug = resource["canonical_slug"]
  resource_id = resource["resource_id"] || "(missing resource_id)"
  lifecycle_status = resource["lifecycle_status"].to_s

  unless slug && !slug.empty?
    ERRORS << "#{resource_id}: missing canonical_slug"
    next
  end

  if lifecycle_status == "quick_note"
    page_path = File.join(ROOT, "wiki/inbox/#{slug}.md")
    unless File.exist?(page_path)
      ERRORS << "#{resource_id}: missing quick card wiki/inbox/#{slug}.md"
      next
    end

    page_text = read(page_path)
    frontmatter = resource_frontmatter(page_path)
    page_slug = frontmatter["canonical_slug"] || frontmatter["slug"]

    if page_slug.to_s != slug.to_s
      ERRORS << "#{rel(page_path)}: slug mismatch canonical_slug=#{slug.inspect} page=#{page_slug.inspect}"
    end

    required_quick_card_headings.each do |heading|
      ERRORS << "#{rel(page_path)}: missing required heading #{heading}" unless page_text.include?(heading)
    end

    %w[title resource_id canonical_slug resource_type source_kind source_url date_added lifecycle_status recommendation].each do |field|
      next if resource[field].nil? && frontmatter[field].nil?

      if resource[field].to_s != frontmatter[field].to_s
        ERRORS << "#{rel(page_path)}: #{field} mismatch data=#{resource[field].inspect} page=#{frontmatter[field].inspect}"
      end
    end

    %w[tags use_cases].each do |field|
      next if resource[field].nil? && frontmatter[field].nil?

      data_value = Array(resource[field]).map(&:to_s)
      page_value = Array(frontmatter[field]).map(&:to_s)
      if data_value != page_value
        ERRORS << "#{rel(page_path)}: #{field} mismatch data=#{data_value.inspect} page=#{page_value.inspect}"
      end
    end

    Array(resource["tags"]).each do |tag|
      ERRORS << "#{resource_id}: unknown tag #{tag}" unless tags.key?(tag)
    end

    Array(resource["use_cases"]).each do |use_case|
      ERRORS << "#{resource_id}: unknown use_case #{use_case}" unless use_cases.key?(use_case)
    end

    next
  end

  page_path = File.join(ROOT, "wiki/resources/#{slug}.md")
  source_path = File.join(ROOT, resource["local_source"].to_s)
  metadata_path = File.join(source_path, "metadata.yaml")

  unless File.exist?(page_path)
    ERRORS << "#{resource_id}: missing page wiki/resources/#{slug}.md"
    next
  end

  ERRORS << "#{resource_id}: missing source directory #{resource["local_source"]}" unless Dir.exist?(source_path)
  ERRORS << "#{resource_id}: missing source metadata #{resource["local_source"]}metadata.yaml" unless File.exist?(metadata_path)

  page_text = read(page_path)
  frontmatter = resource_frontmatter(page_path)

  if frontmatter["slug"].to_s != slug.to_s
    ERRORS << "#{rel(page_path)}: slug mismatch canonical_slug=#{slug.inspect} page=#{frontmatter["slug"].inspect}"
  end

  required_page_headings.each do |heading|
    ERRORS << "#{rel(page_path)}: missing required heading #{heading}" unless page_text.include?(heading)
  end

  frontmatter_fields_to_match.each do |field|
    next if resource[field].nil? && frontmatter[field].nil?

    if resource[field].to_s != frontmatter[field].to_s
      ERRORS << "#{rel(page_path)}: #{field} mismatch data=#{resource[field].inspect} page=#{frontmatter[field].inspect}"
    end
  end

  frontmatter_array_fields_to_match.each do |field|
    next if resource[field].nil? && frontmatter[field].nil?

    data_value = Array(resource[field]).map(&:to_s)
    page_value = Array(frontmatter[field]).map(&:to_s)
    if data_value != page_value
      ERRORS << "#{rel(page_path)}: #{field} mismatch data=#{data_value.inspect} page=#{page_value.inspect}"
    end
  end

  Array(resource["tags"]).each do |tag|
    ERRORS << "#{resource_id}: unknown tag #{tag}" unless tags.key?(tag)
  end

  Array(resource["use_cases"]).each do |use_case|
    ERRORS << "#{resource_id}: unknown use_case #{use_case}" unless use_cases.key?(use_case)
  end

  if File.exist?(metadata_path)
    metadata = load_yaml(metadata_path) || {}
    {
      "resource_id" => resource_id,
      "source_url" => resource["source_url"],
      "source_kind" => resource["source_kind"],
      "reviewed_ref" => resource["reviewed_source_ref"]
    }.each do |field, expected|
      next if expected.nil?
      ERRORS << "#{rel(metadata_path)}: #{field} mismatch expected #{expected.inspect} got #{metadata[field].inspect}" unless metadata[field].to_s == expected.to_s
    end

    snapshot = metadata["snapshot"]
    if snapshot && !File.exist?(File.join(source_path, snapshot.to_s))
      ERRORS << "#{rel(metadata_path)}: snapshot path does not exist: #{snapshot}"
    end
  end

  manifest_paths = Dir[File.join(source_path, "snapshots/*/manifest.yaml")].sort
  if manifest_paths.empty?
    ERRORS << "#{resource_id}: missing source snapshot manifest under #{resource["local_source"]}snapshots/"
  end

  matching_manifest = nil
  manifest_paths.each do |manifest_path|
    manifest = load_yaml(manifest_path) || {}
    required_manifest_fields.each do |field|
      ERRORS << "#{rel(manifest_path)}: missing required field #{field}" unless manifest.key?(field)
    end
    matching_manifest = [manifest_path, manifest] if manifest["source_ref"].to_s == resource["reviewed_source_ref"].to_s
  end

  unless manifest_paths.empty? || matching_manifest
    ERRORS << "#{resource_id}: no source manifest source_ref matches reviewed_source_ref #{resource["reviewed_source_ref"]}"
  end
end

use_cases.each do |slug, use_case|
  Array(use_case["resources"]).each do |resource_id|
    ERRORS << "use_case #{slug}: unknown resource #{resource_id}" unless resource_ids.include?(resource_id)
  end
end

index_path = File.join(ROOT, "wiki/index.md")
if File.exist?(index_path)
  index_text = read(index_path)
  resources.each do |resource|
    next unless resource["lifecycle_status"].to_s == "shortlisted"

    slug = resource["canonical_slug"]
    ERRORS << "wiki/index.md: shortlisted resource #{slug} is missing from index" unless index_text.include?("resources/#{slug}.md")
  end
else
  ERRORS << "wiki/index.md: missing index file"
end

learning_ids = Array(learnings_doc["learnings"]).map { |learning| learning["learning_id"] }
if learning_ids.uniq.length != learning_ids.length
  duplicates = learning_ids.tally.select { |_id, count| count > 1 }.keys
  ERRORS << "data/learnings.yaml: duplicate learning_id values: #{duplicates.join(", ")}"
end

learning_pages = {}
Dir[File.join(ROOT, "wiki/learnings/*.md")].sort.each do |path|
  frontmatter = resource_frontmatter(path)
  learning_id = frontmatter["learning_id"]
  next unless learning_id

  learning_pages[learning_id] = [path, frontmatter]
end

Array(learnings_doc["learnings"]).each do |learning|
  learning_id = learning["learning_id"]
  page_path, page_frontmatter = learning_pages[learning_id]
  unless page_path
    ERRORS << "data/learnings.yaml: missing learning page for #{learning_id}"
    next
  end

  %w[status type].each do |field|
    if learning[field].to_s != page_frontmatter[field].to_s
      ERRORS << "#{rel(page_path)}: #{field} mismatch data=#{learning[field].inspect} page=#{page_frontmatter[field].inspect}"
    end
  end

  data_promoted_to = Array(learning["promoted_to"]).map(&:to_s)
  page_promoted_to = Array(page_frontmatter["promoted_to"]).map(&:to_s)
  if data_promoted_to != page_promoted_to
    ERRORS << "#{rel(page_path)}: promoted_to mismatch data=#{data_promoted_to.inspect} page=#{page_promoted_to.inspect}"
  end
end

Dir[File.join(ROOT, "**/*.md")].sort.each do |path|
  next if path.include?("/.git/")

  each_markdown_link(path) do |href|
    next if href.match?(/\Ahttps?:\/\//)
    next if href.start_with?("mailto:", "#")

    target = href.split("#", 2).first
    next if target.empty?

    full_path = File.expand_path(target, File.dirname(path))
    ERRORS << "#{rel(path)}: missing local link target #{href}" unless File.exist?(full_path)
  end
end

public_files = Dir[
  File.join(ROOT, "{AGENTS.md,CLAUDE.md,README.md}"),
  File.join(ROOT, "{data,docs,runtime,sources,wiki}/**/*")
].select { |path| File.file?(path) }

public_files.each do |path|
  text = read(path)
  next unless text.match?(%r{/Users/|/home/|/tmp/})

  ERRORS << "#{rel(path)}: contains absolute local or temporary path"
end

current_branch = git_lines("branch", "--show-current").first
if current_branch == "main"
  origin_main = git_lines("rev-parse", "--verify", "origin/main").first
  if origin_main
    counts = git_lines("rev-list", "--left-right", "--count", "HEAD...origin/main").first
    if counts
      _ahead, behind = counts.split(/\s+/, 2).map(&:to_i)
      if behind.positive?
        ERRORS << "branch main is behind origin/main by #{behind} commit(s); sync before claiming completion"
      end
    end
  end
end

if current_branch && current_branch != "main"
  diff_lines = git_lines("diff", "--name-status", "main...HEAD")
  changed_paths = diff_lines.filter_map do |line|
    parts = line.split(/\s+/)
    parts.length >= 2 ? parts[1] : nil
  end

  added_intake_pages = diff_lines.filter_map do |line|
    status, path = line.split(/\s+/, 2)
    next unless status&.start_with?("A")
    next unless path&.match?(%r{\Awiki/(resources|inbox|rejected|candidates)/[^/]+\.md\z})

    path
  end

  source_roots = changed_paths.filter_map do |path|
    next unless path.start_with?("sources/")

    parts = path.split("/")
    parts.length >= 3 ? parts[0, 3].join("/") : nil
  end.uniq

  unless current_branch.include?("batch")
    if added_intake_pages.length > 1
      ERRORS << "branch #{current_branch}: non-batch branch adds multiple intake pages: #{added_intake_pages.join(", ")}"
    end
    if source_roots.length > 1
      ERRORS << "branch #{current_branch}: non-batch branch changes multiple source roots: #{source_roots.join(", ")}"
    end
  end

  if current_branch.start_with?("codex/") && !added_intake_pages.empty?
    branch_slug = current_branch.sub(%r{\Acodex/}, "")
    page_slugs = added_intake_pages.map { |path| File.basename(path, ".md") }
    unless current_branch.include?("batch") || page_slugs.include?(branch_slug)
      ERRORS << "branch #{current_branch}: branch slug does not match added intake page(s): #{page_slugs.join(", ")}"
    end
  end
end

if ERRORS.empty?
  puts "OK: Resource Atlas validation passed"
else
  warn "Resource Atlas validation failed:"
  ERRORS.each { |error| warn "- #{error}" }
  exit 1
end
