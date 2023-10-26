export PATH=~/.local/bin:$HOME/bin:/usr/local/bin:$PATH:~/.vim/plugged/vim-iced/bin:/usr/local/opt/openjdk@17/bin

ZSH_THEME="lambda"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

plugins=(git web-search bazel terraform wd)

# User configuration
eval "$(saml2aws --completion-script-zsh)"

[[ -s "/home/ryan/.gvm/scripts/gvm" ]] && source "/home/ryan/.gvm/scripts/gvm"

set -o vi
export EDITOR='vim'
export GOPATH=~/go
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ZSH="/Users/ryan/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

