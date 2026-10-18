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

gitclone() {
  if (( $# < 1 || $# > 2 )); then
    print -u2 -- "usage: gitclone <repository> [directory]"
    return 2
  fi

  local arg
  for arg in "$@"; do
    if [[ "$arg" == -* ]]; then
      print -u2 -- "gitclone does not support git clone flags"
      print -u2 -- "usage: gitclone <repository> [directory]"
      return 2
    fi
  done

  local repo="$1"
  local target="${2:-}"

  if [[ -n "$target" ]]; then
    git clone "$repo" "$target" || return
  else
    git clone "$repo" || return
    target="${repo%/}"
    target="${target:t}"
    target="${target%.git}"
  fi

  cd "$target" || return
}
