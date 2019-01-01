#/usr/bin/env sh
# This is a shell script to fix the problem VirtualBox 6.0.0 has when creating Desktop Shortcuts on Linux systems. 
# This shell script has been tested on Fedora 28 LXDE
# Bug report https://www.virtualbox.org/ticket/18259 LinuxPhreak2600 aka LinuxPhreak aka Ben P. Dorsi-Todaro
# This shell script is provided by Ben P. Dorsi-Todaro
echo -e "Which Virtual Machine do you want to make a Desktop Shortcut for?"
read vmname
echo -e "[Desktop Entry]" >> $HOME/Desktop/$vmname.Desktop
echo -e "Encoding=UTF-8" >> $HOME/Desktop/$vmname.Desktop
echo -e "Version=1.0" >> $HOME/Desktop/$vmname.Desktop
echo -e "Name=$vmname" >> $HOME/Desktop/$vmname.Desktop
echo -e "Comment=Starts the VirtualBox machine $vmname" >> $HOME/Desktop/$vmname.Desktop
echo -e "Type=Application" >> $HOME/Desktop/$vmname.Desktop
echo -e "Exec=VBoxManage startvm '$vmname' %u" >> $HOME/Desktop/$vmname.Desktop
echo -e "Icon=virtualbox-vbox.png" >> $HOME/Desktop/$vmname.Desktop
chmod +x "$HOME/Desktop/$vmname.Desktop"