#/usr/bin/env sh
echo -e "What VM do you want make larger?"
read vmname
echo -e "You want to make $vmname larger? (y/N)"
read yesno
if [[ $yesno == "n" || $yesno == "N" ]]; then
	while [[ $yesno != "y" || $yesno != "Y" ]]; do
		echo -e "What VM do you want make larger?"
		read vmname
		echo -e "You want to make $vmname larger? (y/N)"
		read yesno
		if [[ $yesno == "y" || $yesno == "Y" ]]; then
			break
		fi
	done
fi
echo -e "What size in MB do you want to make your VM?"
read size
