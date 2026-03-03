up() {
  local git_dir
  git_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
  if [[ -n "$git_dir" ]]; then
    cd "$git_dir" || return
  else
    cd .. || return
  fi
}

lazygitcommit() {
  git add -A || return
  local msg
  msg="$(curl -sL https://whatthecommit.com/index.txt | tr -d '\r')"
  [[ -z "$msg" ]] && msg="update"
  git commit -m "$msg" || return
  git push
}