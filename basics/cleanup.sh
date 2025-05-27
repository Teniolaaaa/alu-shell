#!/bin/bash
shopt -s nullglob

# Patterns of temp/backup files
patterns=("*.tmp" "*.swp" "*.bak" "*~" ".DS_Store" ".*.swp" ".#*" "lockfile")

deleted_any=false

for pattern in "${patterns[@]}"; do
  files=($pattern)
  if [ ${#files[@]} -gt 0 ]; then
    for f in "${files[@]}"; do
      echo "Removing: $f"
      rm -f "$f"
      deleted_any=true
    done
  fi
done

if ! $deleted_any; then
  echo "No temporary or backup files to remove."
fi
