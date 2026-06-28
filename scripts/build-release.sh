#!/usr/bin/env bash
set -euo pipefail

# Reproducible release build for bug-destroyer skill.
# Usage: ./scripts/build-release.sh [VERSION]
# Outputs: dist/bug-destroyer-VERSION.zip + .sha256

VERSION="${1:-$(git describe --tags --always)}"
ROOT="$(git rev-parse --show-toplevel)"
DIST_DIR="$ROOT/dist"
WORK_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$WORK_DIR"
}
trap cleanup EXIT

mkdir -p "$DIST_DIR"

install -m644 "$ROOT/SKILL.md" "$ROOT/TAXONOMY.md" "$ROOT/TEMPLATE.md" "$ROOT/.gitignore" "$WORK_DIR/"
install -Dm644 "$ROOT/profiles/"*.md -t "$WORK_DIR/profiles/"
install -Dm644 "$ROOT/.claude-plugin/plugin.json" -t "$WORK_DIR/.claude-plugin/"

OUT="$DIST_DIR/bug-destroyer-$VERSION.zip"
rm -f "$OUT"

# Deterministic ZIP: sorted file list, fixed timestamps.
(cd "$WORK_DIR" && find . -type f | sort | zip "$OUT" -@ >/dev/null)

# Deterministic mtime so checksums are reproducible for the same source.
TIME="$(git log -1 --format=%ct)"
touch -d "@$TIME" "$OUT"

sha256sum "$OUT" > "$OUT.sha256"

echo "Built: $OUT"
echo "Checksum: $(cat "$OUT.sha256")"
