export PATH=$HOME/.ghcup/bin/bin:/usr/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/scripts:$HOME/.local/share/nvim/lazy/vim-iced/bin:$PATH

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
# Ensure ghcup's GHC takes precedence over mise's GHC
export PATH="$HOME/.ghcup/bin:$PATH"
alias ls='eza --git --group-directories-first'
alias bazel='bazelisk'
eval "$(saml2aws --completion-script-zsh)"
