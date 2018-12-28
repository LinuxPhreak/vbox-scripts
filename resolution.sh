#!/usr/bin/env sh
echo -e "Choose a Screen Size to Change Your Mac OSX Screen"
choices=( '1920x1080' '2048x1080' '2560x1440' '3840x2160' '1280x800' '1280x1024' '1440x900' '1600x900')

echo -e "What is the name of the VM you want to change the screen size to?"
read name
echo -e "Your VM Name is $name correct? (y/N):"
read noyes
if [ $noyes == "y" -o $noyes == "Y" ]; then
	select choice in "${choices[@]}"; do
		[[ -n $choice ]] || { echo "Invalid choice." >&2; continue; }

		case $choice in
			'1920x1080')
				VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution 1920x1080
				;;
			'2048x1080')
				VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution 2048x1080
				;;
			'2560x1440')
				VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution 2560x1440
				;;
			'3840x2160')
				VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution 3840x2160
				;;
			'1280x800')
				VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution 1280x800
				;; 
			'1280x1024')
				VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution 1280x1024
				;;
			'1440x900') 
				VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution 1440x900
				;;
			'1600x900')
				VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution 1600x900
				;;
		esac
		break
	done
	#VBoxManage setextradata “$name” VBoxInternal2/EfiGraphicsResolution X
	#1280x720, 1920x1080, 2048x1080, 2560x1440, 3840x2160, 1280x800, 1280x1024, 1440x900, 1600x900
	#VirtualBox doesn't support: 1366x768 (you can use 1280x720 with "Scaled Mode"). 
fi