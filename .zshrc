# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# Oh My Zsh Configuration
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

# Performance optimizations
ZSH_DISABLE_COMPFIX=true
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

source $ZSH/oh-my-zsh.sh

# ============================================================================
# Theme & Plugins
# ============================================================================
source ~/.powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ ! -f ~/Repositories/dotfiles/.p10k.zsh ]] || source ~/Repositories/dotfiles/.p10k.zsh

# ============================================================================
# NVM (Node Version Manager) - Lazy Loading
# ============================================================================
export NVM_DIR="$HOME/.nvm"

nvm() {
  unset -f nvm node npm npx pnpm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm "$@"
}

node() { nvm node "$@"; }
npm()  { nvm npm  "$@"; }
npx()  { nvm npx  "$@"; }
pnpm() { nvm pnpm "$@"; }

# ============================================================================
# Environment Variables
# ============================================================================
export JAVA_HOME=/usr/lib/jvm/default
export PNPM_HOME="/home/accodius/.local/share/pnpm"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# ============================================================================
# PATH Configuration
# ============================================================================
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

# ============================================================================
# Aliases
# ============================================================================
alias p="python"
alias c="clear"
alias g="git"

alias v="nvim"
alias vim="nvim"
alias vi="nvim"

alias l="ls"
alias x="exit"
alias pn="git add . && git commit -m 'update $(date)' && git push"
alias zsh-bench="time zsh -i -c exit"
alias zsh-profile="zsh -i -c zprof"

# ============================================================================
# Platform-Specific Configuration (Linux)
# ============================================================================
if [[ "$(uname)" == "Linux" ]]; then
    alias task="go-task"

    export PATH="$HOME/miniconda3/bin:$PATH"
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
    source /etc/profile.d/google-cloud-cli.sh

    eval "$(atuin init zsh)"
    eval "$(zoxide init zsh)"
fi
