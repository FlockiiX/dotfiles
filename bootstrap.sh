#!/usr/bin/env bash
set -euo pipefail

echo "Bootstrap dotfiles on new machine..."

DOTFILES_DIR="${HOME}/.dotfiles"

if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ $(uname -m) == "arm64" ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${HOME}/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "Homebrew already installed"
fi

echo "Installing packages from Brewfile..."
brew bundle --file="${DOTFILES_DIR}/Brewfile"

echo "Creating symlinks..."
bash "${DOTFILES_DIR}/install.sh"

if [ -d "${HOME}/.nvm" ]; then
  echo "Setting up Node.js via nvm..."
  export NVM_DIR="${HOME}/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

  if ! nvm ls | grep -q "v"; then
    echo "Installing Node.js LTS..."
    nvm install --lts
    nvm use --lts
    nvm alias default node
  fi
fi

echo "Bootstrap complete!"
echo "Please restart your terminal or run: exec zsh"
