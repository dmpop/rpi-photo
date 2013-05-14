#!/bin/bash 

#Wait for camera

DEVICE=$(gphoto2 --auto-detect | grep usb | cut -b 36-42 | sed 's/,/\//')
while [ -z ${DEVICE} ]
	do
	sleep 1
	DEVICE=$(gphoto2 --auto-detect | grep usb | cut -b 36-42 | sed 's/,/\//')
done

cd /media/usb0/
mkdir "`date --iso-8601`" && cd $_
#gphoto2 --get-all-files --filename "%Y%m%d-%H%M%S-%03n.%C"
gphoto2 --get-all-files
exiftool -r -d %Y%m%d-%H%M%S.%%e "-FileName<DateTimeOriginal" .
cd ~
halt
