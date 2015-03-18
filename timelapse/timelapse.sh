#!/bin/bash
LOCAL_PHOTO_DIR=$1
CREDENTIALS_FILE=$3

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

python $CURRENT_DIR/take_picture.py $LOCAL_PHOTO_DIR
python $CURRENT_DIR/upload_picture.py $LOCAL_PHOTO_DIR $CREDENTIALS_FILE
