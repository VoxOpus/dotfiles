# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Force tools to respect XDG conventions
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export BUN_INSTALL="$XDG_DATA_HOME/bun"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# Doom Emacs XDG compliance
export EMACSDIR="$XDG_CONFIG_HOME/emacs"
export DOOMDIR="$XDG_CONFIG_HOME/doom"
export DOOMLOCALDIR="$XDG_DATA_HOME/doom"

# Go XDG compliance
export GOPATH="$XDG_DATA_HOME/go"

# Configure PATH (avoiding duplicates)
typeset -U path
path=(
	"$HOME/.local/bin"
	"$CARGO_HOME/bin"
	"$BUN_INSTALL/bin"
	"$EMACSDIR/bin"
    "$GOPATH/bin
    "$XDG_DATA_HOME/npm/bin"
	$path
)
export PATH
