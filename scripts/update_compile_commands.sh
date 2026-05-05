#!/usr/bin/env bash
# Copies or symlinks the generated compile_commands.json from the build
# directory to the repository root so editors/IDEs that look for it at
# the project root (or have trouble finding nested build dirs) can pick
# it up easily.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR_DEFAULT="$REPO_ROOT/build"

# If the user passes a path, use it as the build directory
BUILD_DIR="${1:-$BUILD_DIR_DEFAULT}"

SRC="$BUILD_DIR/compile_commands.json"
DST="$REPO_ROOT/compile_commands.json"

if [ ! -f "$SRC" ]; then
    echo "Error: compile_commands.json not found in $BUILD_DIR" >&2
    echo "Run your build first (source /opt/esp-idf/export.sh && idf.py build)" >&2
    exit 2
fi

echo "Copying $SRC -> $DST"
cp -f "$SRC" "$DST"
echo "Done. If you prefer a symlink, run:\n  ln -sf $SRC $DST"

