#!/usr/bin/sh

# install necessary packages
sudo apt-get update
sudo apt-get install gettext
# clone neovim/neovim
git clone https://github.com/neovim/neovim.git --depth 1 -b v0.9.5

# build and install
NVIM_INSTALL_PATH=${HOME}/neovim
cd neovim
mkdir ${NVIM_INSTALL_PATH}
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=${NVIM_INSTALL_PATH}
make install

echo 'alias nvim=${NVIM_INSTALL_PATH}/bin/nvim' >> ${HOME}/.zshrc
