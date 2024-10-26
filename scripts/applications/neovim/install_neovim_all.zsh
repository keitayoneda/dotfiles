#!/usr/bin/env zsh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

zsh ${SCRIPT_PATH}/install_neovim.zsh
zsh ${SCRIPT_PATH}/install_neovim_plugin.zsh
zsh ${SCRIPT_PATH}/install_nerdfont.zsh
