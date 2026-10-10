# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block;
# everything else may go below.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$XDG_DATA_HOME/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

## Ensure history directory exists and set XDG-compliant HISTFILE
[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"

[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

# Load external aliases
[[ -f $ZDOTDIR/zsh_aliases.zsh ]] && source $ZDOTDIR/zsh_aliases.zsh

# Load secrets
[[ -f $ZDOTDIR/.zsh_secrets ]] && source $ZDOTDIR/.zsh_secrets

# Load environment-specific aliases
if [[ -n "$TERMUX_VERSION" ]]; then
    [[ -f $ZDOTDIR/termux_aliases.zsh ]] && source $ZDOTDIR/termux_aliases.zsh
elif [[ -f $ZDOTDIR/arch_aliases.zsh ]]; then
    source $ZDOTDIR/arch_aliases.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
