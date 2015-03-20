#!/bin/bash

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
