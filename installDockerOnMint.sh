#!/bin/bash
#To run: 
#curl -sSL https://gist.githubusercontent.com/sethbergman/955f6ad392fff733a62c/raw/41c229998634df722cefdd589da121af624bf2ce/Install-Docker-on-Linux-Mint.sh | bash -x

#Special Thanks for sethbergman/Install-Docker-on-Linux-Mint.sh
#https://gist.github.com/sethbergman/bb34cd3aed91a4e87a86
#This Bash Script is modify from His script.
#The old script is for install docker 1.6.3
#this script is install docker 1.9 for Mint 17.3.



# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	sudo apt-get update
	sudo apt-get install -y apt-transport-https
fi

# Add the repository to your APT sources
sudo echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list

# Then import the repository key
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Install docker
sudo apt-get update
sudo apt-get install -y docker-engine cgroup-lite apparmor


echo "Add current current user to Docker Group"
sudo usermod -a -G docker $USER

