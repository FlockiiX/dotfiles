# Quality-of-life
alias reload!='source ~/.zshrc'
alias cls='clear'
alias clar='clear'
alias claer='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'
alias o='open .'
alias cat="bat"

# ls (macOS)
alias ll="eza -la --icons --group-directories-first"
alias la='ls -la'
alias l='ls -l'
alias ls="eza --icons --group-directories-first"

# Git
alias g='git'
alias gst='git status -sb'
alias gp='git pull'
alias gpl='git pull --rebase'
alias gundo='git reset --soft HEAD~'
alias gamend='git commit -av --amend --no-edit'

# Brew
alias install='brew install'
alias uninstall='brew uninstall'
alias upgradebrew='brew update && brew upgrade && brew cleanup'

# Network / disk
alias myip='curl -s https://ipecho.net/plain; echo'
alias usage='du -h -d1'