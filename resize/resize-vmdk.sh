#!/usr/bin/env sh
echo -e "What is the name of the VMDK file you want to resize?"
read name
echo -e "The name of the VDMK file is $name. Is that correct (y/N):"
read noyes
if [ $noyes == "y" -o $noyes == "Y" ]; then
	echo -e "Okay great."
	VBoxManage clonehd "$name.vmdk" "$name.vdi" --format vdi
	echo -e "What size do you want to make your VM?"
	read size
	echo -e "You want the size of your VM to be $size MB. Is that correct? (y/N):"
	read yesno
	if [ $yesno == "y" -o $yesno == "Y"]; then
		VBoxManage modifyhd "$name.vdi" --resize $size
		rm $name.vmdk
		VBoxManage clonehd "$name.vdi" "$name.vmdk" --format vmdk
	fi
fi