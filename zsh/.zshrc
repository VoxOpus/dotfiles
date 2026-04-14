# ==============================================================================
# UNIVERSAL .zshrc (Managed by GNU Stow)
# ==============================================================================

# --- 0. SYSTEM-ERKENNUNG (Die Magie) ---
IS_TERMUX=false; IS_PROOT=false; IS_LAPTOP=false; IS_SERVER=false

if [[ -n "$PREFIX" ]]; then
    IS_TERMUX=true
elif [[ "$(hostname)" == "Vox" ]]; then
    IS_LAPTOP=true
elif [[ "$(hostname)" == "homeserver" ]]; then
    IS_SERVER=true
else
    # Wenn kein Prefix da ist und der Hostname nicht passt, sind wir in PRoot
    IS_PROOT=true
fi

# --- 1. POWERLEVEL10K INSTANT PROMPT ---
# Überall aktiviert, AUSSER in PRoot (verhindert den Freeze)
if [[ "$IS_PROOT" == false ]]; then
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
fi

# --- 2. UMGEBUNGSVARIABLEN & PFADE ---
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='micro'
export VISUAL='micro'

if [[ "$IS_LAPTOP" == true ]]; then
    export NVM_DIR="$HOME/.nvm"
    export PATH="/home/vox/.opencode/bin:$PATH"
elif [[ "$IS_PROOT" == true ]]; then
    # Spezifisch für glibc-Kompilierung in PRoot
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
fi

# --- 3. OH-MY-ZSH KONFIGURATION ---
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

# Dynamische Plugins (Basis-Plugins für alle)
plugins=(git sudo z extract)

if [[ "$IS_LAPTOP" == true ]]; then
    plugins+=(nvm)
    zstyle ':omz:plugins:nvm' lazy yes
fi

# Diese beiden MÜSSEN immer am Ende des Arrays stehen!
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)

# --- 4. HISTORIE EINSTELLUNGEN ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# --- 5. ALIASE (SHORTCUTS) ---

# Gemeinsame Aliase (Überall gültig)
alias m='micro'
alias n='nano'
alias c='clear'
alias ports='ss -tulanp'

# ==========================================
# GERÄTESPEZIFISCHE ALIASE
# ==========================================

if [[ "$IS_LAPTOP" == true ]]; then
    # --- LAPTOP (Linux Mint) ---
    alias update='sudo apt update && sudo apt upgrade -y'
    alias install='sudo apt install'
    alias autoremove='sudo apt autoremove -y'

    # Docker
    alias dockerupdate='docker compose pull && docker compose up -d'
    
	# Ollama
    alias oserve='docker compose up -d ollama'
    alias ostop='docker compose stop ollama'
    alias ols='docker compose exec ollama ollama list'
    alias orun='docker compose exec ollama ollama run'
    alias opull='docker compose exec ollama ollama pull'
    alias orm='docker compose exec ollama ollama rm'

	# Open-WebUI
    alias ouiserve='docker compose up -d open-webui'
    alias ouistop='docker compose stop open-webui'
    
elif [[ "$IS_SERVER" == true ]]; then
    # --- TOSHIBA SERVER (Ubuntu) ---
    alias update='sudo apt update && sudo apt upgrade -y'
    alias install='sudo apt install'
    alias autoremove='sudo apt autoremove -y'

elif [[ "$IS_TERMUX" == true ]]; then
    # --- TERMUX (Android Host) ---
    alias update='pkg update && pkg upgrade -y'
    alias install='pkg install'
    # pkg benötigt kein autoremove

    # Ollama
	alias oserve='ollama serve'
	alias ostop='ollama stop'
    alias ols='ollama list'
    alias orun='ollama run'
    alias opull='ollama pull'
    alias orm='ollama rm'

elif [[ "$IS_PROOT" == true ]]; then
    # --- PROOT (Ubuntu in Termux) ---
    # In PRoot sind wir root, daher kein sudo nötig
    alias update='apt update && apt upgrade -y'
    alias install='apt install'
    alias autoremove='apt autoremove -y'
fi
# --- 6. INITIALISIERUNG ---
source $ZSH/oh-my-zsh.sh

# Powerlevel10k Konfiguration laden
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
