#!/usr/bin/env bash

cd $HOME 
mkdir -p $HOME/.config/

#MISE
if type -p mise >/dev/null; then
  echo "Mise already installed... skipping"
else
  echo "Installing mise..."
  curl https://mise.run | sh
  echo "eval \"\$($HOME/.local/bin/mise activate zsh│
  )\"" >> "$HOME/.zshrc"
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone git@github.com:rdgd/mise-config.git $HOME/.config/mise
cd $HOME/.config/mise && mise install
cd $HOME

git clone git@github.com:rdgd/neovim-config.git
cd $HOME

#GITCONFIG
git config --global user.email "ryan.is.gray@gmail.com"
git config --global user.name "rdgd"

#DOTFILES
git clone git@github.com:rdgd/dotfiles.git $HOME/dotfiles
cp $HOME/dotfiles/.vimrc .
cp $HOME/dotfiles/.tmux.conf .
cp $HOME/dotfiles/.zshrc .

chsh -s $(which zsh)
