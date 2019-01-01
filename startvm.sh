#!/usr/bin/env sh
echo -e "Type the name of the virtual machine you would like to start."
read vmname
VBoxManage startvm "$vmname"
controloptions=('Off' 'Shutdown' 'Pause' 'Reset')
echo -e "Enter A Number to control the VM"

select vmcontrol in "${controloptions[@]}"; do
	[[ -n $vmcontrol ]] || { echo "Invalid choice." >&2; continue; }
	while [ $vmcontrol != 1 -o $vmcontrol != 2 ]
	do
	case $vmcontrol in
		'Off')
			VBoxManage controlvm "$vmname" poweroff
			break
			;;
		'Shutdown')
			VBoxManage controlvm "$vmname" poweroff soft
			break
			;;
		'Pause')
			VBoxManage controlvm "$vmname" pause
			while [ x$resume != "r" -o x$resume != "R" ]
			do
				echo "Press R to resume machine state"
				read resume
				if [ $resume == "r" -o $resume == "R" ]; then
					VBoxManage controlvm "$vmname" resume
					break
				fi
			done
			;;
		'Reset')
			VBoxManage controlvm "$vmname" reset
			;;
 	esac
	break
	done
done	