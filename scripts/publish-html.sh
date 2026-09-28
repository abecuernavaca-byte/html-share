#!/bin/bash
# Usage: ./scripts/publish-html.sh /absolute/path/to/document.html desired-url-slug
# Copies one standalone HTML document to public/<slug>/index.html, commits, and pushes.
set -euo pipefail

source_file=${1:?"Usage: publish-html.sh /path/to/document.html desired-url-slug"}
slug=${2:?"Usage: publish-html.sh /path/to/document.html desired-url-slug"}

if [[ ! -f "$source_file" ]]; then
  printf 'HTML file not found: %s\n' "$source_file" >&2
  exit 1
fi
if [[ ! "$slug" =~ ^[a-z0-9][a-z0-9-]*$ ]]; then
  printf 'Slug must use lowercase letters, numbers, and hyphens only.\n' >&2
  exit 1
fi

repo_root=$(cd "$(dirname "$0")/.." && pwd)
target_dir="$repo_root/public/$slug"
mkdir -p "$target_dir"
cp "$source_file" "$target_dir/index.html"

cd "$repo_root"
git add "public/$slug/index.html"
git commit -m "Publish $slug"
git push origin main
printf 'Published source committed. GitHub Pages will deploy it automatically.\n'
