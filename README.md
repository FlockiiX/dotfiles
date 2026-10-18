# Dotfiles

## Quick Setup (New Machine)

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

## Manual Steps

**Install packages only:**
```bash
brew bundle --file ~/.dotfiles/Brewfile
```

**Create symlinks only:**
```bash
./install.sh
```

## Maintenance

**Update Brewfile from current system:**
```bash
brew bundle dump --file ~/.dotfiles/Brewfile --force
```

**Local machine-specific settings:**
```bash
~/.dotfiles/zsh/local.zsh  # copy from local.example.zsh
```
