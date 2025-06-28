#!/bin/bash
# bootstrap.sh is a basic startup script for Vagrant VMs and other
# development type machines.
# jb, 11-2023

basePackages="tmux vim neovim curl htop gnupg2 git tree software-properties-common lsof"
workstationPackages="ripgrep fzf ranger screen cmake graphviz gcc git-lfs rsync zsh libreadline-dev"
HOMEDIR="/root"


echo "export PS1='\[\e[31m\]\u@\h:\w\$ \[\e[0m\]'" >> $HOMEDIR/.bashrc
echo "alias sl='ls $LS_OPTIONS'" >> $HOMEDIR/.bashrc
echo "alias ll='ls $LS_OPTIONS -l'" >> $HOMEDIR/.bashrc
echo "alias la='ls $LS_OPTIONS -la'" >> $HOMEDIR/.bashrc
#echo "" >> $HOMEDIR/.bashrc
source $HOMEDIR/.bashrc

# root vim setup
touch $HOMEDIR/.vimrc
echo "\" Basic vimrc " >> $HOMEDIR/.vimrc
# spaces instead of tabs
echo "set tabstop=4 shiftwidth=4 expandtab" >> $HOMEDIR/.vimrc
# syntax highlighting
echo "syntax on" >> $HOMEDIR/.vimrc
# fixes coloring issues that occur sometimes in ssh
echo "set background=dark" >> $HOMEDIR/.vimrc
# enables line numbering
echo "set number" >> $HOMEDIR/.vimrc
# prevents possible security issue
echo "set nomodeline" >> $HOMEDIR/.vimrc
echo "$HOMEDIR .bashrc and .vimrc updated"

apt update -y
apt upgrade -y
apt install $basePackages -y
# apt install $workstationPackages -y
