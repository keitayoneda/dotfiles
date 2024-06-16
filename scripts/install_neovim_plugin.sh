#!/usr/bin/sh

if [[ -d ${HOME}/.config]] then
	echo "${HOME}/.config exists"
else
       	mkdir ${HOME}/.config
fi
cd ${HOME}/.config
ln -s ${HOME}/dotfiles/nvim nvim
cd ${HOME}/dotfiles/scripts 

# install clangd
sudo apt install clangd-12 -y
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100

sudo snap install pyright --classic

