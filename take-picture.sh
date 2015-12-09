#!/bin/bash

VERSION="0.0.1"

# get external usb storage (empty if don't exists)
# Example: /media/pi/7C429DE0429DA006
EXTARNAL_USB_STORAGE=`lsblk | grep sd | grep part | grep "/media/$USER" | awk '{print $7;}'`

# check EXTARNAL_USB_STORAGE to set ROOT_PATH
if [ -z $EXTARNAL_USB_STORAGE ]; then
  ROOT_PATH="."
else
  ROOT_PATH="$EXTARNAL_USB_STORAGE"
fi

# directory name
DIRECTORY_NAME=`date +%Y_%m_%d`

# directory path
DIRECTORY_PATH="$ROOT_PATH/camera_pictures/$DIRECTORY_NAME"

# create directory if don't exists
if [ ! -d $DIRECTORY_PATH ]; then
  mkdir -p $DIRECTORY_PATH
fi

# file name
FILE_NAME=`date +%H_%M_%S`

# file path
FILE_PATH="$DIRECTORY_PATH/$FILE_NAME.jpg"

COMMAND=`fswebcam -r 800x600 $FILE_PATH`
