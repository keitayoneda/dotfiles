# clone packer.nvim
git clone https://github.com/wbthomason/packer.nvim \
	  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

# setting up init.nvim
cd ${HOME}
if [ ! -d ${HOME}/.config ]; then
  mkdir ${HOME}/.config 
fi

ln -s ${HOME}/dotfiles/nvim ${HOME}/.config/nvim

# nerd-font
sudo apt-get install fontconfig

curl -fLo "FiraCodeNerdFont-Regular.ttf" \
https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf

if [ ! -d ${HOME}/.fonts ]; then
	mkdir ${HOME}/.fonts
fi

cp FiraCodeNerdFont-Regular.ttf ${HOME}/.fonts
fc-cache -f -v

rm FiraCodeNerdFont-Regular.ttf

echo "Please reboot your pc, to complete the installation"
