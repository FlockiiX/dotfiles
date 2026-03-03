Dotfiles

Install:
  ~/.dotfiles/install.sh

Brew:
  brew bundle --file ~/.dotfiles/Brewfile

Regenerate Brewfile from current system:
  brew bundle dump --file ~/.dotfiles/Brewfile --force

Local, uncommitted machine settings:
  ~/.dotfiles/zsh/local.zsh  (copy from local.example.zsh)