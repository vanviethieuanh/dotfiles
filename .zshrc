zmodload zsh/zprof
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export NVM_DIR="$HOME/.nvm"

nvm() {
  unset -f nvm node npm npx pnpm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm "$@"
}

node() { nvm node "$@"; }
npm()  { nvm npm  "$@"; }
npx()  { nvm npx  "$@"; }
pnpm()  { nvm pnpm "$@"; }

export JAVA_HOME=/usr/lib/jvm/default

alias p="python"
alias c="clear"
alias g="git"
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias l="ls"
alias pn="git add . && git commit -m 'update $(date)' && git push"
alias task="go-task"


export PNPM_HOME="/home/accodius/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[ -s "/home/accodius/.bun/_bun" ] && source "/home/accodius/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

[[ ! -f ~/Repositories/dotfiles/.p10k.zsh ]] || source ~/Repositories/dotfiles/.p10k.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

export PATH=$PATH:$(go env GOPATH)/bin

if [[ "$(uname)" == "Linux" ]]; then
    export PATH="$HOME/miniconda3/bin:$PATH"
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
    source /etc/profile.d/google-cloud-cli.sh
fi

# if [[ "$(uname)" == "Darwin" ]]; then
#     if command -v brew >/dev/null; then
#       GCP_PATH="$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
#       [ -f "$GCP_PATH" ] && source "$GCP_PATH"
#     fi
# fi

zprof
