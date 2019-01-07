#!/usr/bin/env sh
vboxdir="$HOME/VirtualBox VMs"

while getopts ":m:n:" o; do
	case "${o}" in
		m)
			m=${OPTARG}
		;;
		n)
			n=${OPTARG}
		;;
	esac
done

if [[ -d "$vboxdir" && ${m} =~ ^[0-9]+$ ]]; then
		VBoxManage modifyhd "$vboxdir/${n}/${n}.vdi" --resize ${m}
else
	echo "Memory argument needs to be an integer"
fi