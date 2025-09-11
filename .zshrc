export PATH=/bin:/usr/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/scripts:$HOME/.local/share/nvim/lazy/vim-iced/bin:$PATH

# Path to your oh-my-zsh installation.
autoload -Uz compinit
compinit

ZSH_THEME="lambda"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

plugins=(git web-search bazel terraform wd)

# User configuration
set -o vi
export EDITOR='nvim'

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
eval "$($HOME/.local/bin/mise activate zsh)"
alias ls='eza --git --group-directories-first'
eval "$(saml2aws --completion-script-zsh)"
