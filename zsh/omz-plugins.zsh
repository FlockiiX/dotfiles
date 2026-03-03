# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# Keep OMZ plugin list lean to reduce conflicts
plugins=(git brew macos colored-man-pages flutter docker kubectl zoxide nvm fzf)

# Load OMZ if installed
[[ -r "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# External plugins from Homebrew (loaded if present)
# autosuggestions first, syntax-highlighting last
if command -v brew >/dev/null 2>&1; then
  [[ -r "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] \
    && source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

  [[ -r "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] \
    && source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

  # Optional (can be intrusive):
  # [[ -r "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]] \
  #   && source "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

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
  [[ -r "$(brew --prefix)/opt/nvm/nvm.sh" ]] && source "$(brew --prefix)/opt/nvm/nvm.sh"
  [[ -r "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ]] && source "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
fi