#!/usr/bin/sh

sudo apt update
sudo apt install fontconfig

curl -fLo "FiraCodeNerdFont-Regular.ttf" \
https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf

if [ ! -d ${HOME}/.fonts ]; then
	mkdir ${HOME}/.fonts
fi

cp FiraCodeNerdFont-Regular.ttf ${HOME}/.fonts
fc-cache -f -v

rm FiraCodeNerdFont-Regular.ttf

echo "Please reboot your pc, to complete the installation"
