# Use emacs-style bindings
bindkey -e

# Fix common terminal sequences (iTerm can send both)
if (( $+functions[history-substring-search-up] )); then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey '^[OA' history-substring-search-up
  bindkey '^[OB' history-substring-search-down
else
  bindkey '^[[A' history-beginning-search-backward
  bindkey '^[[B' history-beginning-search-forward
  bindkey '^[OA' history-beginning-search-backward
  bindkey '^[OB' history-beginning-search-forward
fi

# Home/End/Delete (optional but useful)
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# Keep Ctrl+Up/Down available for the same filtered history search in terminals
# that send distinct modified arrow sequences.
if (( $+functions[history-substring-search-up] )); then
  bindkey '^[[1;5A' history-substring-search-up
  bindkey '^[[1;5B' history-substring-search-down
fi
