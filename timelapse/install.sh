#!/bin/bash

LOCAL_PHOTO_DIR=$HOME/timelapse
LOCAL_CREDENTIALS_FILE=$HOME/credentials_timelapse.txt
CURRENT_DIRECTORY=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DEFAULT_USER=pi

CRONJOB_TIMING="1 5,8,11,14,17 * * *"
CRONJOB_JOB="$CURRENT_DIRECTORY/timelapse.sh $LOCAL_PHOTO_DIR $LOCAL_CREDENTIALS_FILE"

CRONJOB_LINE="$CRONJOB_TIMING $CRONJOB_JOB"

#takes a command to exectute as user pi
function as_user {
    su $DEFAULT_USER -c $1
}

#make timelapse.sh and cronjob.sh executable
as_user "chmod +x timelapse.sh"
as_user "chmod +x cronjob.sh"
#create local directory as user pi
as_user "mkdir -p $LOCAL_PHOTO_DIR"

#install a cronjob for the timelapse
as_user "(crontab -l ; echo "$CRONJOB_LINE") | sort - | uniq - | crontab -"
