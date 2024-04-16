#!/usr/bin/sh

if [! -d ${HOME}/.config]; then
	mkdir ${HOME}/.config
fi

pushd ${HOME}/.config
ln -s ${HOME}/dotfiles/nvim nvim
popd 
