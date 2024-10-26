#!/usr/bin/env zsh

# extract tar.gz
# wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

if [ $? -ne 0 ]; then
  echo "[ERROR] failed to download nvim-linux64.tar.gz"
  exit 1
fi


tar zxf nvim-linux64.tar.gz

# mv extracted bin to home directory
mv nvim-linux64 ${HOME}

echo "alias nvim='${HOME}/nvim-linux64/bin/nvim'" >> ${HOME}/.zshrc


# remove nvim-linux64
rm nvim-linux64.tar.gz

# install neovim plugins
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
