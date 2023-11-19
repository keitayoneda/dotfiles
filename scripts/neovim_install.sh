#!/bin/sh

# extract tar.gz
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar zxf nvim-linux64.tar.gz
sudo cp -r nvim-linux64/bin/nvim /usr/local/bin
sudo cp -r nvim-linux64/share/nvim /usr/local/share/nvim
sudo cp -r nvim-linux64/lib/nvim /usr/local/lib/nvim

# remove nvim-linux64
rm -rf nvim-linux64 
rm -i nvim-linux64.tar.gz
