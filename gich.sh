gich() {
  local dir=$(
    git worktree list --porcelain |
    awk -v b="$1" '
      /^worktree / { p= substr($0, 10) }
      $0 == ("branch refs/heads/" b) { print p; exit }
    '
  )
  if [ -n "$dir" ]; then
    cd "$dir"
  else
    git switch $1
  fi
}
