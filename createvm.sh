 #!/usr/bin/env sh
ostypes=('Other' 'Other_64' 'Windows31' 'Windows95' 'Windows98' 'Windows2000' 'WindowsMe' 'WindowsXP' 'WindowsXP_64' 'Windows2003' 'WindowsNT3x' 'WindowsNT4' 'WindowsNT_64' 'WindowsNT' 'WindowsVista' 'WindowsVista_64' 'Windows2008' 'Windows7' 'Windows7_64' 'Windows8' 'Windows8_64' 'Windows81' 'Windows81_64' 'Windows2012_64' 'Windows10' 'Windows10_64' 'Windows2016_64' 'Linux22' 'Linux24' 'Linux24_64' 'Linux26' 'Linux26_64' 'ArchLinux' 'ArchLinux_64' 'Debian' 'Debian_64' 'Fedora' 'Fedora_64' 'Gentoo' 'Gentoo_64' 'Mandriva' 'Mandriva_64' 'Oracle' 'Oracle_64' 'RedHat' 'RedHat_64' 'OpenSUSE' 'OpenSUSE_64' 'Turbolinux' 'Turbolinux_64' 'Ubuntu' 'Ubuntu_64' 'Xandros' 'Xandros_64' 'Solaris' 'Solaris_64' 'Solaris11_64' 'OpenSolaris' 'OpenSolaris_64' 'FreeBSD' 'FreeBSD_64' 'OpenBSD' 'OpenBSD_64' 'NetBSD' 'NetBSD_64' 'OS2Warp3' 'OS2Warp4' 'OS2Warp45' 'OS2eCS' 'OS21x' 'OS2' 'MacOS' 'MacOS_64' 'MacOS106' 'MacOS106_64' 'MacOS107_64' 'MacOS108_64' 'MacOS109_64' 'MacOS1010_64' 'MacOS1011_64' 'MacOS1012_64' 'MacOS1013_64' 'DOS' 'Netware' 'L4' 'QNX' 'JRockitVE' 'VBoxBS_64')
echo -e "Enter the number for the Operating System you wish to install..."
select ostype in "${ostypes[@]}"; do
	[[ -n $ostype ]] || { echo "Invalid choice." >&2; continue; }
	case $ostype in
		'Other')
 			echo -e "Operating System Type Other"
 			echo -e "What do you want to call this VM?"
 			read name
 			echo -e "How much memory do you want to givw your VM?"
 			read memory
 			echo -e "Would you like to create a new Hard Disk? (y/N)"
 			if [ x$no == "N" -o x$no == "n" ]; then
 				echo -e "Please select an existing hard disk to use as your VM"
 			else
 				echo -e "What size do you want to make your hard disk?"
 				read hdsize
 			fi
 			VBoxManage createvm --name "$name" --ostype Other --register
 			VBoxManage modifyvm testMachine --memory $memory
 			VBoxManage createhd --filename "$name.vdi" --size $hdsize --format
 			;;
 		'Other_64')
 			;;
 		'Windows31')
 			;;
 		'Windows95')
 			;;
 		'Windows98')
 			;;
 		'Windows2000')
 			;;
 		'WindowsMe')
 			;;
 		'WindowsXP')
 			;;
 		'WindowsXP_64')
 			;;
 		'Windows2003')
 			;;
 		'WindowsNT3x')
 			;;
 		'WindowsNT4')
 			;;
 		'WindowsNT_64')
 			;;
 		'WindowsNT')
 			;;
 		'WindowsVista')
 			;;
 		'WindowsVista_64')
 			;;
 		'Windows2008')
 			;;
 		'Windows7')
 			;;
 		'Windows7_64')
 			;;
 		'Windows8')
 			;;
 		'Windows8_64')
 			;;
 		'Windows81')
 			;;
 		'Windows81_64')
 			;;
 		'Windows2012_64')
 			;;
 		'Windows10')
 			;;
 		'Windows10_64')
 			;;
 		'Windows2016_64')
 			;;
done
#VBoxManage createvm --name "FBSD Test" --ostype FreeBSD_64 --register
#VBoxManage modifyvm testMachine --memory 256
#VBoxManage createhd --filename testMachine.vdi --size 18000 --format
#support@tester:~$ VBoxManage storageattach "testMachine" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium testMachine.vdi
#VBoxManage storagectl testMachine --name "SATA Controller" --add sata --controller IntelAhci
#VBoxManage storagectl testMachine --name "IDE Controller" --add ide --controller PIIX4
#VBoxManage storageattach testMachine --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium debian-6.0.3-amd64-i386-netinst.iso
#VBoxHeadless --startvm testMachine