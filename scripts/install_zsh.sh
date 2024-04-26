#!/usr/bin/sh

# install zsh
sudo apt-get update
sudo apt-get install -y zsh

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# change shell
# chsh -s $(which zsh)

