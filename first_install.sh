#!/usr/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

bash ${SCRIPTPATH}/scripts/install_essentials.sh 

bash ${SCRIPTPATH}/scripts/applications/zsh/install_zsh.sh

# (below scripts use zsh)
zsh ${SCRIPTPATH}/scripts/applications/neovim/install_neovim.zsh
