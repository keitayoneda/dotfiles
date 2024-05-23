#!/usr/bin/sh

if [[ -d ${HOME}/.config]] then
	echo "${HOME}/.config exists"
else
       	mkdir ${HOME}/.config
fi
cd ${HOME}/.config
ln -s ${HOME}/dotfiles/nvim nvim
cd ${HOME}/dotfiles/scripts 
