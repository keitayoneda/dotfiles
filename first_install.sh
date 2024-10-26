#!/usr/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

bash ${SCRIPTPATH}/scripts/install_essentials.sh 

bash ${SCRIPTPATH}/scripts/applications/zsh/install_zsh.sh

zsh ${SCRIPTPATH}/scripts/applications/nodejs.zsh

zsh ${SCRIPTPATH}/scripts/applications/neovim/install_neovim_all.zsh

zsh ${SCRIPTPATH}/scripts/applications/tmux/tmux.zsh
