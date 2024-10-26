#!/usr/bin/env zsh

# install nodejs, npm via apt -> install n via npm -> install stable nodejs via n -> remove nodejs, npm
sudo apt update
sudo apt install nodejs npm -y
sudo npm -g install n
sudo n stable
sudo apt purge nodejs npm -y

