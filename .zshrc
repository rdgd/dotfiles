export PATH=~/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ryan/.oh-my-zsh"

ZSH_THEME="lambda"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
set -o vi
eval "$(saml2aws --completion-script-zsh)"
