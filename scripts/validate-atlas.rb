#!/usr/bin/env ruby
# frozen_string_literal: true

require "date"
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

yaml_paths = %w[
  data/resources.yaml
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

frontmatter_fields_to_match = %w[
  resource_id
  canonical_slug
  source_url
  canonical_source
  local_source
  reviewed_source_ref
  last_checked
  last_reviewed
  recommendation
  risk_level
  evidence_quality
  public_ready
  private_notes
  source_publishable
  redaction_needed
]

resources.each do |resource|
  slug = resource["canonical_slug"]
  resource_id = resource["resource_id"] || "(missing resource_id)"
  page_path = File.join(ROOT, "wiki/resources/#{slug}.md")
  source_path = File.join(ROOT, resource["local_source"].to_s)

  unless slug && !slug.empty?
    ERRORS << "#{resource_id}: missing canonical_slug"
    next
  end

  unless File.exist?(page_path)
    ERRORS << "#{resource_id}: missing page wiki/resources/#{slug}.md"
    next
  end

  ERRORS << "#{resource_id}: missing source directory #{resource["local_source"]}" unless Dir.exist?(source_path)

  page_text = read(page_path)
  frontmatter = resource_frontmatter(page_path)

  required_page_headings.each do |heading|
    ERRORS << "#{rel(page_path)}: missing required heading #{heading}" unless page_text.include?(heading)
  end

  frontmatter_fields_to_match.each do |field|
    next if resource[field].nil? && frontmatter[field].nil?

    if resource[field].to_s != frontmatter[field].to_s
      ERRORS << "#{rel(page_path)}: #{field} mismatch data=#{resource[field].inspect} page=#{frontmatter[field].inspect}"
    end
  end

  Array(resource["tags"]).each do |tag|
    ERRORS << "#{resource_id}: unknown tag #{tag}" unless tags.key?(tag)
  end

  Array(resource["use_cases"]).each do |use_case|
    ERRORS << "#{resource_id}: unknown use_case #{use_case}" unless use_cases.key?(use_case)
  end
end

use_cases.each do |slug, use_case|
  Array(use_case["resources"]).each do |resource_id|
    ERRORS << "use_case #{slug}: unknown resource #{resource_id}" unless resource_ids.include?(resource_id)
  end
end

learning_ids = Array(learnings_doc["learnings"]).map { |learning| learning["learning_id"] }
if learning_ids.uniq.length != learning_ids.length
  duplicates = learning_ids.tally.select { |_id, count| count > 1 }.keys
  ERRORS << "data/learnings.yaml: duplicate learning_id values: #{duplicates.join(", ")}"
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

if ERRORS.empty?
  puts "OK: Resource Atlas validation passed"
else
  warn "Resource Atlas validation failed:"
  ERRORS.each { |error| warn "- #{error}" }
  exit 1
end
