# Ensure Homebrew zsh completions are discoverable BEFORE compinit (oh-my-zsh runs compinit)
if command -v brew >/dev/null 2>&1; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

# Completion styles
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/completion"

# If you paste with tabs, don't instantly complete
zstyle ':completion:*' insert-tab pending