#!/usr/bin/env bash

# PREREQUISITES
# `ssh-keygen -t rsa`
# add pubkey to github
# END

cd ~

sudo apt update
sudo apt upgrade

#UTILITIES
sudo apt install bat -y
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

sudo apt install rlwrap -y

#GITCONFIG
git config --global user.email "ryan.is.gray@gmail.com"
git config --global user.email "rdgd"

#DOTFILES
git clone git@github.com:rdgd/dotfiles.git
cp dotfiles/.vimrc .
cp dotfiles/.tmuxrc .
cp dotfiles/.zshrc-tmpl .zshrc

#OHMYZSH
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#VIMPLUG
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#AWS CLI
sudo apt install awscli -y
aws configure

#SAML2AWS
CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
wget -c https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -O - | tar -xzv -C ~/.local/bin
chmod u+x ~/.local/bin/saml2aws
hash -r
saml2aws --version

#TERRAFORM
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform -y

#JAVA
sudo apt install openjdk-11-jdk

#CLOJURE
curl -O https://download.clojure.org/install/linux-install-1.10.3.1029.sh
chmod +x linux-install-1.10.3.1029.sh
sudo ./linux-install-1.10.3.1029.sh

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

#GO AND GVM
sudo apt-get install golang -y
curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
[[ -s "/home/ryan/.gvm/scripts/gvm" ]] && source "/home/ryan/.gvm/scripts/gvm"
export GOPATH=~/go
gvm install go1.16.8
gvm use go1.16.8

#AVALANCHE TOOLS
curl https://downloads.avax.network/avalanchego.gpg.key > avatmpkey.gpg.key
(exec sudo su -c "apt-key add avatmpkey.gpg.key && echo \"deb https://downloads.avax.network/apt focal main\" > /etc/apt/sources.list.d/avalanche.list")

sudo apt update
sudo apt install avalanchego -y

go get github.com/ava-labs/avash
cd $GOPATH/src/github.com/ava-labs/avash
go build

#KUBECTL
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl -y
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

#GENERATE KUBECONFIG
aws eks --region us-east-2 update-kubeconfig --name k8s-prod-cluster

#CHANGE SHELL TO ZSH
chsh -s $(which zsh)
