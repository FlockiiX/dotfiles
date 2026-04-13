# Homebrew environment (Apple Silicon vs Intel)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Use zsh's path array; keep it unique
typeset -U path

# Preferred bins first (only if they exist)
for p in \
  "$HOME/.local/bin" \
  "$HOME/bin" \
  "/opt/homebrew/bin" \
  "/opt/homebrew/sbin" \
  "/usr/local/bin" \
  "$HOME/Development/flutter/bin" \
  "/opt/homebrew/opt/ruby/bin" \
  "$HOME/.antigravity/antigravity/bin" \
; do
    path=("$p" $path)
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