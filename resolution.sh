#!/usr/bin/env sh
echo -e "Choose a Screen Size to Change Your Mac OSX Screen"
choices=( '' '' )

echo -e "What is the name of the VM you want to change the screen size to?"
read name
echo -e "Your VM Name is $name correct? (y/N):"
read noyes
if [ $noyes == "y" -o $noyes == "Y" ]; then
	#VBoxManage setextradata "Mac OSX High Sierra" VBoxInternal2/EfiGraphicsResolution 1600x900
fi