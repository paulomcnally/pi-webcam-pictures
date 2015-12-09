# pi-webcam-pictures
Take a picture with a webcam and a Raspberry Pi

## Install

    $ wget https://raw.githubusercontent.com/paulomcnally/pi-webcam-pictures/master/take-picture.sh

## Add to crontab

    * * * * * /bin/sh /home/pi/take-picture.sh >/dev/null 2>&1

## Get resolution list from device

    $ v4l2-ctl --list-formats-ext -d /dev/video0 | grep Size

All pictures save to ./camera_pictures
