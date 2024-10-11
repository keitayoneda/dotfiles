#!/usr/bin/sh

# install zsh
sudo apt-get update
sudo apt-get install -y zsh

# changing shell is not needed since Oh My Zsh will do it later
# chsh -s $(which zsh)

# install zsh plugins
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
zsh ${SCRIPTPATH}/install_zsh_plugin.zsh
