#!/usr/bin/env bash

# PREREQUISITES
# `ssh-keygen -t rsa`
# add pubkey to github
# END

cd ~

#HOMEBREW
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap Homebrew/bundle
cp dotfiles/Brewfile .
brew bundle

#OHMYZSH
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#DOTFILES
git clone git@github.com:rdgd/dotfiles.git
cp dotfiles/.vimrc .
cp dotfiles/.tmux.conf .
cp dotfiles/.zshrc-tmpl .zshrc
cat dotfiles/maczshrc >> .zshrc

#GITCONFIG
git config --global user.email "ryan.is.gray@gmail.com"
git config --global user.name "rdgd"

#VIMPLUG
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#CLOJURE LSP
sudo bash < <(curl -s https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install)

#NVM/NODEJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts
npm install -g yarn

#BAZELISK
npm install -g @bazel/bazelisk

# MUST INSTALL AWS CLI FIRST
aws configure

#GENERATE KUBECONFIG
aws eks --region us-east-2 update-kubeconfig --name k8s-prod-cluster

#GO AND GVM
curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
[[ -s "/Users/ryan/.gvm/scripts/gvm" ]] && source "/Users/ryan/.gvm/scripts/gvm"
export GOPATH=~/go
gvm install go1.16.8
gvm use go1.16.8
