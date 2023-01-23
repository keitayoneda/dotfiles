#!/bin/sh

sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git

#install latest node,npm
sudo apt-get -y install nodejs npm
sudo npm install -g n
sudo n stable
sudo apt-get purge nodejs npm

git clone https://github.com/neovim/neovim
cd neovim 
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=${HOME}/.local
make install

#clone packer.nvim
git clone https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

#setting up init.nvim
cd ${HOME}
mkdir ${HOME}/.config
ln -s ${HOME}/dotfiles/nvim ${HOME}/.config/nvim

