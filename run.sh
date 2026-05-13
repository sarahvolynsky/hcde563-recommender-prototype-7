#!/bin/bash
#
# GenAI disclosure (course syllabus): Cursor assisted — run from repo root;
# PYTHONPATH still must resolve course `rebert` with `classes` (see README §5 symlink).

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
[ -f "$HOME/.zshenv" ] && . "$HOME/.zshenv"
cd "$SCRIPT_DIR/rebert/_prototype_7_" || {
  echo "Missing $SCRIPT_DIR/rebert/_prototype_7_"
  exit 1
}

if [ -x "$SCRIPT_DIR/.venv/bin/python3" ]; then
  exec "$SCRIPT_DIR/.venv/bin/python3" recommender_7.0.py "$@"
fi
if [ -x "./.venv/bin/python3" ]; then
  exec ./.venv/bin/python3 recommender_7.0.py "$@"
fi
exec python3 recommender_7.0.py "$@"
