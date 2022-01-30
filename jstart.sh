#!/bin/bash

#a simple script to get debian based server machines working
# used mainly for AWS/VM instances

if [[ $EUID -ne 0 ]]; then
	printf 'Must be run as root, exiting!\n'
	exit 1
fi


apt-get update -y
apt-get upgrade -y

#essentials
apt install tmux vim curl htop gnupg2 software-properties-common lsof -y

################################
#bashrc updates
################################
# set root prompt to my default with red color
echo "export PS1='\[\e[31m\]\u@\h:\w\$ \[\e[0m\]'" >> /root/.bashrc
echo "alias sl='ls $LS_OPTIONS'" >> /root/.bashrc
echo "alias ll='ls $LS_OPTIONS -l'" >> /root/.bashrc
echo "alias la='ls $LS_OPTIONS -la'" >> /root/.bashrc
#echo "" >> /root/.bashrc

source /root/.bashrc

################################
# vim setup
################################
touch /root/.vimrc
echo "# Basic vimrc " >> /root/.vimrc
# spaces instead of tabs
echo "set tabstop=4 shiftwidth=4 expandtab" >> /root/.vimrc
# syntax highlighting
echo "syntax on" >> /root/.vimrc
# fixes coloring issues that occur sometimes in ssh
echo "set background=dark" >> /root/.vimrc
# enables line numbering
echo "set number" >> /root/.vimrc
# prevents possible security issue
echo "set nomodeline" >> /root/.vimrc

echo ".bashrc and .vimrc updated"

#install osquery
#export OSQUERY_KEY=1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys $OSQUERY_KEY
#sudo add-apt-repository 'deb [arch=amd64] https://pkg.osquery.io/deb deb main'
# sudo apt-get update sudo apt-get install osquery

# change machine hostname?

#start tmux session named using machine hostname
tmux new -s $(hostname)
