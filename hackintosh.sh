#!/usr/bin/env sh
choices=( 'Mac OSX High Sierra' 'Mac OSX Mojave' )
reschoose=('1920x1080' '1680x1050' '1400x1050' '1600x900' '1280x1024' '1400x900')
echo "Enter the correct number for the version you wish to install..."

select choice in "${choices[@]}"; do
	[[ -n $choice ]] || { echo "Invalid choice." >&2; continue; }

	case $choice in 
		'Mac OSX High Sierra')
			echo Mac OSX High Sierra
			while [ x$no != "N" -o x$no != "n" ]
			do
				echo -e "What did you name the VM?"
				read name
				echo -e "Your VM Name is $name."
				echo -e "Is that correct?"
				read no
				if [ $no == "y" -o $no == "Y" ]; then
					break
				fi
			done
			VBoxManage modifyvm "$name" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
			echo -e "1st Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
			echo -e "2nd Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
			echo -e "3rd Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
			echo -e "4th Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
			echo -e "5th Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
			echo -e "6th Stage Done"
			echo -e "All Done"
			;;
		'Mac OSX Mojave')
			echo Mac OSX Mojave
			while [ x$no != "N" -o x$no != "n" ]
			do
				echo -e "What did you name the VM?"
				read name
				echo -e "Your VM Name is $name."
				echo -e "Is that correct?"
				read no
				if [ $no == "y" -o $no == "Y" ]; then
					break
				fi
			done
			VBoxManage modifyvm "$name" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
			echo -e "1st Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
			echo -e "2nd Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
			echo -e "3rd Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
			echo -e "4th Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
			echo -e "5th Stage Done"
			VBoxManage setextradata "$name" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
			echo -e "6th Stage Done"
			echo -e "All Done"
			;;
	esac
	break
done