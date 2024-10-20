#!/usr/bin/env zsh

# add ppa repository
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update

# if you have already installed git, you can upgrade it
sudo apt-get upgrade git -y
