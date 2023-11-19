# clone packer.nvim
git clone https://github.com/wbthomason/packer.nvim \
	  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

# setting up init.nvim
cd ${HOME}
mkdir ${HOME}/.config
ln -s ${HOME}/dotfiles/nvim ${HOME}/.config/nvim

