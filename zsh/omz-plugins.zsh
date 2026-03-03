# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# Keep OMZ plugin list lean to reduce conflicts
plugins=(git brew macos colored-man-pages flutter docker kubectl)

# Load OMZ if installed
[[ -r "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# External plugins from Homebrew
if command -v brew >/dev/null 2>&1; then
  # 1. Autosuggestions
  [[ -r "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] \
    && source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

  # 2. History Substring Search
  [[ -r "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] \
    && source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

  # 3. fzf-tab
  [[ -r "$(brew --prefix)/share/fzf-tab/fzf-tab.zsh" ]] \
    && source "$(brew --prefix)/share/fzf-tab/fzf-tab.zsh"

  # fzf-tab Styling
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
  zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --color=always $realpath'
  zstyle ':fzf-tab:*' switch-group ',' '.'

  # 4. Syntax Highlighting
  [[ -r "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] \
    && source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# fzf (keybindings + completion)
if command -v brew >/dev/null 2>&1; then
  FZF_BASE="$(brew --prefix)/opt/fzf"
  [[ -r "$FZF_BASE/shell/completion.zsh" ]] && source "$FZF_BASE/shell/completion.zsh"
  [[ -r "$FZF_BASE/shell/key-bindings.zsh" ]] && source "$FZF_BASE/shell/key-bindings.zsh"
fi

# zoxide
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# nvm (Homebrew)
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