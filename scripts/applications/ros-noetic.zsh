#!/usr/bin/zsh
# install ROS Noetic for ubuntu 20.04

OS_VERSION=$(lsb_release -rs)
if [ $OS_VERSION != "20.04" ]; then
		echo "This script is for Ubuntu 20.04"
		exit 1
fi

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update

sudo apt install ros-noetic-desktop-full -y

echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc


