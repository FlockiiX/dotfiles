export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(git brew macos colored-man-pages flutter docker kubectl)

[[ -r "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

if command -v brew >/dev/null 2>&1; then
  [[ -r "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] \
    && source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

  [[ -r "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] \
    && source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

  [[ -r "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] \
    && source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  [[ -r "$(brew --prefix)/share/fzf-tab/fzf-tab.zsh" ]] \
    && source "$(brew --prefix)/share/fzf-tab/fzf-tab.zsh"

  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
  zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --color=always $realpath'
  zstyle ':fzf-tab:*' switch-group ',' '.'
fi

if command -v brew >/dev/null 2>&1; then
  FZF_BASE="$(brew --prefix)/opt/fzf"
  [[ -r "$FZF_BASE/shell/completion.zsh" ]] && source "$FZF_BASE/shell/completion.zsh"
  [[ -r "$FZF_BASE/shell/key-bindings.zsh" ]] && source "$FZF_BASE/shell/key-bindings.zsh"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"

  z() {
    if [[ $# -eq 0 ]]; then
      __zoxide_z "$@"
    elif zoxide query "$@" &>/dev/null; then
      __zoxide_z "$@"
    else
      zi
    fi
  }

  alias y='z'
  alias yi='zi'
fi

export NVM_DIR="$HOME/.nvm"
if command -v brew >/dev/null 2>&1; then
  __nvm_load() {
    unset -f nvm node npm npx
    [[ -r "$(brew --prefix)/opt/nvm/nvm.sh" ]] && source "$(brew --prefix)/opt/nvm/nvm.sh"
    [[ -r "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ]] && source "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
  }

  nvm() { __nvm_load; nvm "$@" }
  node() { __nvm_load; node "$@" }
  npm() { __nvm_load; npm "$@" }
  npx() { __nvm_load; npx "$@" }
fi

command -v atuin >/dev/null 2>&1 && eval "$(atuin init zsh)"

if command -v broot >/dev/null 2>&1; then
  [[ -r "${HOME}/.config/broot/launcher/bash/br" ]] && source "${HOME}/.config/broot/launcher/bash/br"
fi

command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"
