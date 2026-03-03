# Keep history in XDG state dir
HISTDIR="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
mkdir -p "$HISTDIR" 2>/dev/null

export HISTFILE="$HISTDIR/history"
export HISTSIZE=50000
export SAVEHIST=50000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS