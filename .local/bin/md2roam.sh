#!/usr/bin/env bash

TARGET_DIR="/data/data/com.termux/files/home/storage/shared/Documents/Obsidian Vault/Documentations/Pi.dev"
BACKUP_DIR="${TARGET_DIR}_backup_$(date +%s)"

# Backup before destructive operations
cp -r "$TARGET_DIR" "$BACKUP_DIR"
echo "Backup created at: $BACKUP_DIR"

cd "$TARGET_DIR" || exit 1

for md_file in *.md; do
    # Skip loop iteration if no .md files exist
    [ -e "$md_file" ] || continue

    org_file="${md_file%.md}.org"

    # 1. Extract title from first H1 heading (fallback: filename without extension)
    title=$(grep -m 1 "^# " "$md_file" | sed 's/^# //')
    title="${title:-${md_file%.md}}"

    # 2. Convert Markdown to Org (pure body without Pandoc metadata)
    pandoc "$md_file" -f markdown -t org -o "$org_file"

    # 3. Generate Org-roam UUID
    node_id=$(cat /proc/sys/kernel/random/uuid)

    # 4. Create Org-roam header and merge with Pandoc output
    tmp_file=$(mktemp)
    cat <<EOF > "$tmp_file"
:PROPERTIES:
:ID:       $node_id
:END:
#+title: $title
#+filetags: :pi_dev:docs:

EOF

    cat "$org_file" >> "$tmp_file"
    mv "$tmp_file" "$org_file"

    echo "Created: $org_file"
done

echo "Conversion complete. The .md files still exist and can be deleted after verification."
