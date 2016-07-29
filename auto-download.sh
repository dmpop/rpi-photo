#!/bin/bash 

# Wait for camera
DEVICE=$(gphoto2 --auto-detect | grep usb | cut -b 36-42 | sed 's/,/\//')
while [ -z ${DEVICE} ]
	do
	sleep 1
	DEVICE=$(gphoto2 --auto-detect | grep usb | cut -b 36-42 | sed 's/,/\//')
done

# Switch to /media/usb0 and create a directory with current date as its name
cd /media/usb0/
mkdir "`date --iso-8601`" && cd $_
# Transfer new files to a USB storage device mounted at /media/usb0
#gphoto2 --get-all-files
gphoto2 --new
# Rename files using ExifTool based on EXIF date and time data
exiftool -r -d %Y%m%d-%H%M%S.%%e "-FileName<DateTimeOriginal" .
# Shutdown
shutdown -h now
