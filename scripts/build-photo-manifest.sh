#!/bin/bash
# Regenerate images/gato2025/manifest.json from current files in that directory.
# Run this after adding/removing photos in images/gato2025/.

set -e
cd "$(dirname "$0")/.."

DIR="images/gato2025"
OUT="$DIR/manifest.json"

ls -1t "$DIR" \
  | grep -iE '\.(jpe?g|png|gif|webp|avif)$' \
  | jq -R . \
  | jq -s . > "$OUT"

echo "Wrote $(jq length "$OUT") entries to $OUT"
