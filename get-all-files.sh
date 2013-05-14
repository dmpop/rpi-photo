#!/bin/bash
#mkdir "`date +%F--%T`" && cd $_
mkdir "`date --iso-8601`" && cd $_
gphoto2 --get-all-files --filename
exiftool -r -d %Y%m%d-%H%M%S.%%e "-FileName<DateTimeOriginal" .
cd ~
