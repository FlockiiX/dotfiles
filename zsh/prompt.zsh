if [[ -r "$DOTFILES_DIR/config/ascii.txt" ]]; then
  echo -e "\033[1;36m"
  \cat "$DOTFILES_DIR/config/ascii.txt"
  echo -e "\033[0m"
fi

command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"