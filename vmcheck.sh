#!/usr/bin/env sh
while getopts ":n:" o; do
	case "${o}" in
		n)
			n=${OPTARG}
		;;
	esac
done

if [ "$(VBoxManage list vms | grep -c "${n}")" != 0 ]; then
    echo exists
fi