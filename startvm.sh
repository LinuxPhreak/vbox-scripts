#!/usr/bin/env sh
echo -e "Type the name of the virtual machine you would like to start."
read vmname
VBoxManage startvm "$vmname" &