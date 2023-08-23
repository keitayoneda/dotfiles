#!/bin/sh

sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git

#install latest node,npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g n
sudo n latest
sudo apt-get purge -y nodejs

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
ln -s ${HOME}/dotfiles/nvim ${HOME}/.config/kyoneda

# download nerdfont
curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
unzip FiraCode.zip -d FiraCode
mkdir -p ~/.local/share/fonts
cp FiraCode/*.ttf ~/.local/share/fonts/
fc-cache -f -v


