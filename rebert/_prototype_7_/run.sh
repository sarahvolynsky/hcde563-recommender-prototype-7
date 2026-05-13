#!/bin/bash
#
# GenAI disclosure (course syllabus): Cursor assisted — source ~/.zshenv for
# PYTHONPATH; run recommender_7.0.py with .venv/bin/python3 when present.

[ -f "$HOME/.zshenv" ] && . "$HOME/.zshenv"

cd "$(dirname "$0")"

if [ -x ".venv/bin/python3" ]; then
  exec .venv/bin/python3 recommender_7.0.py "$@"
else
  exec python3 recommender_7.0.py "$@"
fi
