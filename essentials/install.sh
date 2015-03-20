#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "You need to be root to run this script"
    exit 1
fi 

#setup environment
#essential alias for human interaction with the system
echo "alias fucking='sudo'" >> $HOME/.bashrc
source $HOME/.bashrc

#install essential packages
apt-get install vim
#python
apt-get update
apt-get install python-dev
apt-get install python-setuptools

#install essential python packages
easy_install paramiko
easy_install picamera
