#!/usr/bin/zsh

if [! -d ${HOME}/.config]; then
	mkdir ${HOME}/.config
fi

cd ${HOME}/.config
ln -s ${HOME}/dotfiles/nvim nvim
cd ${HOME}/dotfiles/scripts 
