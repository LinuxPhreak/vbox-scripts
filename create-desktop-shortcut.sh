#/usr/bin/env sh
# This is a shell script to fix the problem VirtualBox 6.0.0 has when creating Desktop Shortcuts on Linux systems. 
# This shell script has been tested on Fedora 28 LXDE
# Bug report https://www.virtualbox.org/ticket/18259 LinuxPhreak2600 aka LinuxPhreak aka Ben P. Dorsi-Todaro
# This shell script is provided by Ben P. Dorsi-Todaro

if [[ -d "$HOME/VirtualBox VMs/$*" ]]; then
	echo -e "[Desktop Entry]" >> "$HOME/Desktop/$*.desktop"
	echo -e "Encoding=UTF-8" >> "$HOME/Desktop/$*.desktop"
	echo -e "Version=1.0" >> "$HOME/Desktop/$*.desktop"
	echo -e "Name=$*" >> "$HOME/Desktop/$*.desktop"
	echo -e "Comment=Starts the VirtualBox machine $vmname" >> "$HOME/Desktop/$*.desktop"
	echo -e "Type=Application" >> "$HOME/Desktop/$*.desktop"
	echo -e "Exec=VBoxManage startvm '$*' %u" >> "$HOME/Desktop/$*.desktop"
	echo -e "Icon=virtualbox-vbox.png" >> "$HOME/Desktop/$*.desktop"
	chmod +x "$HOME/Desktop/$*.desktop"
	echo -e "The shortcut was successfully created..."
else
	echo "VM $* doesn't appear to exists."
fi
