#!/usr/bin/env bash

# PREREQUISITES
# `ssh-keygen -t rsa`
# add pubkey to github
# END

cd ~

sudo apt update
sudo apt upgrade

#GITCONFIG
git config --global user.email "ryan.is.gray@gmail.com"
git config --global user.email "rdgd"

#DOTFILES
git clone git@github.com:rdgd/dotfiles.git
cp dotfiles/.bashrc .
cp dotfiles/.vimrc .
cp dotfiles/.tmuxrc .
cp dotfiles/.zshrc .

#INSTALL OHMYZSH
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#INSTALL VIMPLUG
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#INSTALL AWS CLI
sudo apt install awscli -y
aws configure

#INSTALL SAML2AWS
CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
wget -c https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -O - | tar -xzv -C ~/.local/bin
chmod u+x ~/.local/bin/saml2aws
hash -r
saml2aws --version

#INSTALL JAVA
sudo apt install openjdk-11-jdk

#INSTALL CLOJURE
curl -O https://download.clojure.org/install/linux-install-1.10.3.1029.sh
chmod +x linux-install-1.10.3.1029.sh
sudo ./linux-install-1.10.3.1029.sh

#INSTALL NVM/NODEJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
echo "which nvm start"
echo "$(which nvm)"
echo "which nvm end"
source ~/.bashrc
(nvm install --lts)
(npm install -g yarn)

#INSTALL GO AND GVM
#apt-get install golang -y
#curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
#gvm install go1.16.8
#gvm use go1.16.8

#INSTALL AVALANCHE TOOLS
curl https://downloads.avax.network/avalanchego.gpg.key > avatmpkey.gpg.key
(exec sudo su -c "apt-key add avatmpkey.gpg.key && echo \"deb https://downloads.avax.network/apt focal main\" > /etc/apt/sources.list.d/avalanche.list")

sudo apt update
sudo apt install avalanchego -y

go get github.com/ava-labs/avash
cd $GOPATH/src/github.com/ava-labs/avash
go build

#INSTALL KUBECTL
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
