#!/usr/bin/env sh
vboxdir="$HOME/VirtualBox VMs"
usuage() 
{ 
	echo "Usuage:"
	echo "-s =>
			'Other' 
			'Other_64' 
			'Windows31' 
			'Windows95' 
			'Windows98' 
			'Windows2000' 
			'WindowsMe' 
			'WindowsXP' 
			'WindowsXP_64' 
			'Windows2003' 
			'WindowsNT3x' 
			'WindowsNT4' 
			'WindowsNT_64' 
			'WindowsNT' 
			'WindowsVista' 
			'WindowsVista_64' 
			'Windows2008' 
			'Windows7' 
			'Windows7_64' 
			'Windows8' 
			'Windows8_64' 
			'Windows81' 
			'Windows81_64' 
			'Windows2012_64' 
			'Windows10' 
			'Windows10_64' 
			'Windows2016_64' 
			'Linux22' 
			'Linux24' 
			'Linux24_64' 
			'Linux26' 
			'Linux26_64' 
			'ArchLinux' 
			'ArchLinux_64' 
			'Debian' 
			'Debian_64' 
			'Fedora' 
			'Fedora_64' 
			'Gentoo' 
			'Gentoo_64' 
			'Mandriva' 
			'Mandriva_64' 
			'Oracle' 
			'Oracle_64' 
			'RedHat' 
			'RedHat_64' 
			'OpenSUSE' 
			'OpenSUSE_64' 
			'Turbolinux' 
			'Turbolinux_64' 
			'Ubuntu' 
			'Ubuntu_64' 
			'Xandros' 
			'Xandros_64' 
			'Solaris' 
			'Solaris_64' 
			'Solaris11_64' 
			'OpenSolaris' 
			'OpenSolaris_64' 
			'FreeBSD' 
			'FreeBSD_64' 
			'OpenBSD' 
			'OpenBSD_64' 
			'NetBSD' 
			'NetBSD_64' 
			'OS2Warp3' 
			'OS2Warp4' 
			'OS2Warp45' 
			'OS2eCS' 
			'OS21x' 
			'OS2' 
			'MacOS' 
			'MacOS_64' 
			'MacOS106' 
			'MacOS106_64' 
			'MacOS107_64' 
			'MacOS108_64' 
			'MacOS109_64' 
			'MacOS1010_64' 
			'MacOS1011_64' 
			'MacOS1012_64' 
			'MacOS1013_64' 
			'DOS' 
			'Netware' 
			'L4' 
			'QNX' 
			'JRockitVE' 
			'VBoxBS_64'"
		echo "-m Integer (Memory size in MB)"
		echo "-s Integer (Storage Space in MB"
	1>&2; 
	exit 1; 
}

while getopts ":n:a:m:s:" o; do
  case "${o}" in
  	n)
		n=${OPTARG}
		;;
    a)
      #echo "-a was triggered!" >&2
		a=${OPTARG}
		((a == "Other" || a == "Other_64" || a == "Windows31" || a == "Windows95" || a == "Windows98" || a == "Windows2000" || a == "WindowsMe" || a == "WindowsXP" || a == "WindowsXP_64" || a == "Windows2003" || a == "WindowsNT3x" || a == "WindowsNT4" || a == "WindowsNT_64" || a == "WindowsNT" || a == "WindowsVista" || a == "WindowsVista_64" || a == "Windows2008" || a == "Windows7" || a == "Windows7_64" || a == "Windows8" || a == "Windows8_64" || a == "Windows81" || a == "Windows81_64" || a == "Windows2012_64" || a == "Windows10" || a == "Windows10_64" || a == "Windows2016_64" || a == "Linux22" || a == "Linux24" || a == "Linux24_64" || a == "Linux26" || a == "Linux26_64" || a == "ArchLinux" || a == "ArchLinux_64" || a == "Debian" || a == "Debian_64" || a == "Fedora" || a == "Fedora_64" || a == "Gentoo" || a == "Gentoo_64" || a == "Mandriva" || a == "Mandriva_64" || a == "Oracle" || a == "Oracle_64" || a == "RedHat" || a == "RedHat_64" || a == "OpenSUSE" || a == "OpenSUSE_64" || a == "Turbolinux" || a == "Turbolinux_64" || a == "Ubuntu" || a == "Ubuntu_64" || a == "Xandros" || a == "Xandros_64" || a == "Solaris" || a == "Solaris_64" || a == "Solaris11_64" || a == "OpenSolaris" || a == "OpenSolaris_64" || a == "FreeBSD" || a == "FreeBSD_64" || a == "OpenBSD" || a == "OpenBSD_64" || a == "NetBSD" || a == "NetBSD_64" || a == "OS2Warp3" || a == "OS2Warp4" || a == "OS2Warp45" || a == "OS2eCS" || a == "OS21x" || a == "OS2" || a == "MacOS" || a == "MacOS_64" || a == "MacOS106" || a == "MacOS106_64" || a == "MacOS107_64" || a == "MacOS108_64" || a == "MacOS109_64" || a == "MacOS1010_64" || a == "MacOS1011_64" || a == "MacOS1012_64" || a == "MacOS1013_64" || a == "DOS" || a == "Netware" || a == "L4" || a == "QNX" || a == "JRockitVE" || a == "VBoxBS_64"))
		;;
	m)
		m=${OPTARG}
		;;
	s)
		s=${OPTARG}
		;;
	\?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
	*)
		usuage
		;;
  esac
done

shift $((OPTIND-1))

if [ -z "${n}" ] || [ -z "${a}" ] || [ -z "${m}" ] || [ -z "${s}" ]; then
    usuage
fi

VBoxManage createvm --name "${n}" --ostype ${a} --register
VBoxManage modifyvm "${n}" --memory ${m}
VBoxManage createhd --filename "$vboxdir/${n}/${n}.vdi" --size ${s} --format VDI
VBoxManage storagectl "${n}" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "${n}" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium "$vboxdir/${n}/${n}.vdi"
VBoxManage storageattach "${n}" --storagectl "IDE Controller" --port 0 --device 1 --type dvddrive --medium emptydrive