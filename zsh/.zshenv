# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Zsh Configuration
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# Let Oh My Zsh initialize completion instead of Fedora's global zshrc.
[[ -r "$XDG_DATA_HOME/oh-my-zsh/oh-my-zsh.sh" ]] && export skip_global_compinit=1
[[ -n "$SSH_TTY" && "$TERM" == xterm-256color && -z "$COLORTERM" ]] && export COLORTERM=truecolor

# Tool XDG Compliance: General
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export BUN_INSTALL="$XDG_DATA_HOME/bun"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# Tool XDG Compliance: Doom Emacs
export EMACSDIR="$XDG_CONFIG_HOME/emacs"
export DOOMDIR="$XDG_CONFIG_HOME/doom"
export DOOMLOCALDIR="$XDG_DATA_HOME/doom"

# Tool XDG Compliance: Go
export GOPATH="$XDG_DATA_HOME/go"

# Tool XDG Compliance: Pi Coding Agent
export PI_CODING_AGENT_DIR="$XDG_CONFIG_HOME/pi"
export PI_CODING_AGENT_SESSION_DIR="$XDG_STATE_HOME/pi/sessions"

# PATH Configuration (Avoid Duplicates)
typeset -U path
path=(
  "$HOME/.local/bin"
  "$CARGO_HOME/bin"
  "$BUN_INSTALL/bin"
  "$EMACSDIR/bin"
  "$GOPATH/bin"
  "$XDG_DATA_HOME/npm/bin"
  $path
)
export PATH

