# PREREQUISITES
# ssh-keygen -t rsa
# add key to github
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

#INSTALL JAVA
sudo apt install openjdk-11-jdk

#INSTALL CLOJURE
curl -O https://download.clojure.org/install/linux-install-1.10.3.1029.sh
chmod +x linux-install-1.10.3.1029.sh
sudo ./linux-install-1.10.3.1029.sh

#INSTALL NVM/NODEJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
npm install -g yarn

#INSTALL GO AND GVM
apt-get install golang -y
curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
gvm install go1.16.8
gvm use go1.16.8

#INSTALL AVALANCHE TOOLS
sudo su -
wget -O - https://downloads.avax.network/avalanchego.gpg.key | apt-key add -
echo "deb https://downloads.avax.network/apt focal main" > /etc/apt/sources.list.d/avalanche.list
exit

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
