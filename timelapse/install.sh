#!/bin/bash

DEFAULT_USER=pi
USER_HOME=/home/$DEFAULT_USER
LOCAL_PHOTO_DIR=$USER_HOME/timelapse
LOCAL_CREDENTIALS_FILE=$USER_HOME/credentials_timelapse.txt
CURRENT_DIRECTORY=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

CRONJOB_TIMING="1 5,8,11,14,17 * * *"
CRONJOB_JOB="$CURRENT_DIRECTORY/timelapse.sh $LOCAL_PHOTO_DIR $LOCAL_CREDENTIALS_FILE"

CRONJOB_LINE="$CRONJOB_TIMING $CRONJOB_JOB"

#takes a command to exectute as user pi
function as_user {
    su $DEFAULT_USER -c "$1"
}

if [ "$(id -u)" != "0" ]; then
    echo "You need to be root to run this script"
    exit 1
fi 

#make timelapse.sh and cronjob.sh executable
as_user "chmod +x $CURRENT_DIRECTORY/timelapse.sh"
as_user "chmod +x $CURRENT_DIRECTORY/cronjob.sh"
#create local directory as user pi
as_user "mkdir -p $LOCAL_PHOTO_DIR"

#install a cronjob for the timelapse
echo "installing cronjob $CRONJOB_LINE"
as_user "(crontab -l ; echo '$CRONJOB_LINE') | sort - | uniq - | crontab -"
