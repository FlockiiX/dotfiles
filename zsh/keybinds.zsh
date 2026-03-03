# Use emacs-style bindings
bindkey -e

# Fix common terminal sequences (iTerm can send both)
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history
bindkey '^[OA' up-line-or-history
bindkey '^[OB' down-line-or-history

# Home/End/Delete (optional but useful)
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# If history-substring-search is loaded, bind it to Ctrl+Up/Down (keeps arrows "normal")
if (( $+functions[history-substring-search-up] )); then
  bindkey '^[[1;5A' history-substring-search-up
  bindkey '^[[1;5B' history-substring-search-down
fi