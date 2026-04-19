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

# Fixes scaling issues with ghostty launched from WSL
# Unsure how this will interact with MacOS
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export XCURSOR_SIZE=24

alias ls='eza --git --group-directories-first'
alias bazel='bazelisk'
alias cl='clear'
alias co='xclip -selection clipboard'
alias tl='tmux ls'
alias ta='tmux attach'
alias tn='tmux new'
alias al="bat $HOME/.zshrc | grep 'alias'"
alias ga='git add .'
alias gs='git status'
alias gc='git commit'
alias gl='git log'
alias gp='git push'
alias gpm='git push origin master'
alias gpmt='git push origin master --tags'
alias gpl='git pull'
alias v='nvim'    
alias vim='nvim'
alias cr='cargo run'
alias sz="source $HOME/.zshrc"
alias vnc="cd $HOME/.config/nvim/ && nvim"
alias vz="nvim $HOME/.zshrc"
alias cdm="cd $HOME/.config/mise"
alias cdv="cd $HOME/.config/nvim"
alias mi="mise install"
eval "$(saml2aws --completion-script-zsh)"
export PULSE_SERVER=unix:/mnt/wslg/PulseServer
export GAMES_HOME=/mnt/c/Users/ryani/Documents/game-dev/

# Bootstrap tmuxp on first shell after install
if ! command -v tmuxp >/dev/null 2>&1; then
  if command -v pipx >/dev/null 2>&1; then
    echo "tmuxp not found — installing via pipx..."
    pipx install tmuxp
  else
    echo "tmuxp not found and pipx unavailable; skipping bootstrap"
  fi
fi

tnd() {
  tmuxp load --yes dev
}
