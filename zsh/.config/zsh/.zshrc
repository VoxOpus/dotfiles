# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block;
# everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Ensure history directory exists and set XDG-compliant HISTFILE
[[ -d "${XDG_STATE_HOME:-$HOME/.local/state}/zsh" ]] || mkdir -p "${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"

[[ -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh" ]] || mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"

[[ -r "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# Load external aliases
[[ -f "${ZDOTDIR:-$HOME}/zsh_aliases.zsh" ]] && source "${ZDOTDIR:-$HOME}/zsh_aliases.zsh"

# Load secrets
[[ -r "$HOME/.secrets/api_keys.zsh" ]] && source "$HOME/.secrets/api_keys.zsh"

# Ensure strict permissions on ~/.ssh/config (follows symlink)
() { (( $# )) && chmod 600 "$@"; } "$HOME/.ssh/config"(N-.^f:go-rwx:)

# Load environment-specific aliases (Zero-Pollution & Subshell-Free)
() {
    local env_id=""
    if [[ -n "$TERMUX_VERSION" ]]; then
        env_id="termux"
    elif [[ -r /etc/os-release ]]; then
        local line
        while IFS= read -r line; do
            if [[ "$line" == ID=* ]]; then
                env_id="${${line#ID=}#[\"\']}"
                env_id="${env_id%[\"\']}"
                break
            fi
        done < /etc/os-release
    fi

    [[ -n "$env_id" && -f "${ZDOTDIR:-$HOME}/${env_id}_aliases.zsh" ]] && source "${ZDOTDIR:-$HOME}/${env_id}_aliases.zsh"
}

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ -f "${ZDOTDIR:-$HOME}/.p10k.zsh" ]] && source "${ZDOTDIR:-$HOME}/.p10k.zsh"

# Restore npm global binaries after system profiles reset PATH.
if [[ ":$PATH:" != *":$XDG_DATA_HOME/npm/bin:"* ]]; then
  path=("$XDG_DATA_HOME/npm/bin" $path)
fi
