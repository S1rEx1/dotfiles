#!/usr/bin/env bash
set -euo pipefail

REPOS_DIR="$HOME/repos"

dir="$(
  find "$REPOS_DIR" -mindepth 1 -maxdepth 1 -type d \
    | sort \
    | sed "s|^$REPOS_DIR/||" \
    | rofi -dmenu -i -p "repo"
)"

[ -z "${dir:-}" ] && exit 0

full_path="$REPOS_DIR/$dir"
session_name="$(basename "$full_path" | tr '. ' '__')"

if tmux has-session -t "$session_name" 2>/dev/null; then
  exec st -e tmux attach -t "$session_name"
fi

tmux new-session -d -s "$session_name" -n code  -c "$full_path"
tmux new-window  -t "$session_name" -n cargo -c "$full_path"
tmux new-window  -t "$session_name" -n git   -c "$full_path"

exec st -e tmux attach -t "$session_name"
