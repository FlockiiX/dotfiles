#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${HOME}/.dotfiles"

mkdir -p "${DOTFILES_DIR}"
mkdir -p "${HOME}/.config"

link() {
  local src="$1"
  local dst="$2"

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "${dst}.bak.$(date +%Y%m%d%H%M%S)"
  fi

  ln -sfn "$src" "$dst"
  echo "linked: $dst -> $src"
}

link "${DOTFILES_DIR}/zsh/zshrc" "${HOME}/.zshrc"
link "${DOTFILES_DIR}/config/starship.toml" "${HOME}/.config/starship.toml"
link "${DOTFILES_DIR}/git/gitconfig" "${HOME}/.gitconfig"

echo "Done. Restart terminal or run: exec zsh"