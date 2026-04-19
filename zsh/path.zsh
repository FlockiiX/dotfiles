# Homebrew environment (Apple Silicon vs Intel)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Use zsh's path array; keep it unique
typeset -U path

# Preferred bins first
preferred_paths=(
  "$HOME/.local/bin"
  "$HOME/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "/usr/local/bin"
  "$HOME/Development/flutter/bin"
  "/opt/homebrew/opt/ruby/bin"
  "$HOME/.antigravity/antigravity/bin"
)

# Homebrew LLVM (if installed)
if command -v brew >/dev/null 2>&1; then
  llvm_prefix="$(brew --prefix llvm 2>/dev/null)"
  [[ -n "$llvm_prefix" ]] && preferred_paths+=("$llvm_prefix/bin")
fi

# Prepend only existing directories, preserving the order above
for (( i=${#preferred_paths[@]}; i>=1; --i )); do
  p="${preferred_paths[i]}"
  [[ -d "$p" ]] && path=("$p" $path)
done

export PATH="${(j/:/)path}"

# OCaml / opam environment (if installed)
if command -v opam >/dev/null 2>&1; then
  eval "$(opam env)"
fi

# Android Studio JBR (if present)
if [[ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
fi