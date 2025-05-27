#!/bin/bash
shopt -s nullglob

# Define patterns of temp/backup files
patterns=("*~" "*.bak" "*.tmp" "*.swp" ".#*" ".DS_Store")

# Track what was deleted
deleted_any=false

for pattern in "${patterns[@]}"; do
    files=($pattern)
    if [ ${#files[@]} -gt 0 ]; then
        echo "Removing: ${files[@]}"
        rm "${files[@]}"
        deleted_any=true
    fi
done

if ! $deleted_any; then
    echo "No temporary or backup files to remove."
fi
