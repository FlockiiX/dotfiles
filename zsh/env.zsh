export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="${EDITOR:-vim}"
export PAGER="${PAGER:-less}"

# zsh cache dir
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR" 2>/dev/null