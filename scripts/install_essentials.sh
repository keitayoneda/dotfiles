#!/usr/bin/sh

# use only apt-get as package manager

# update&upgrade
sudo apt-get update
sudo apt-get upgrade -y

# install editors
sudo apt-get install -y vim nano

# install network tool
sudo apt-get install -y wget curl network-manager

# install build-tools
sudo apt-get install -y build-essential ninja-build cmake

# install tmux
sudo apt-get install -y tmux

# install unzip
sudo apt-get install -y unzip
