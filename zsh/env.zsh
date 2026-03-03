export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="${EDITOR:-vim}"
export PAGER="${PAGER:-less}"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# zsh cache dir
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR" 2>/dev/null