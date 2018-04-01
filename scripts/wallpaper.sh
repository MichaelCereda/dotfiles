#!/bin/bash

folder="$HOME/wallpapers"
file="wallpaper-$(date --iso-8601=seconds)"

cd $folder

if [[ -z $1 ]]; then
	wget https://source.unsplash.com/1920x1200/?nature,water,canyon,star,moon,night -O $file.jpg
	convert $file.jpg $file.png
	rm $file.jpg
else
	convert $1 $folder/$file.png
fi
feh --bg-fill $file.png

ln -fs $folder/$file.png ~/.wallpaper
