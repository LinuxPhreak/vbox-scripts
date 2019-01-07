#!/usr/bin/env sh
oses="ArchLinux|ArchLinux_64|Debian|Debian_64|DOS|Fedora|Fedora_64|FreeBSD|FreeBSD_64|Gentoo|Gentoo_64|JRockitVE|L4|Linux22|Linux24|Linux24_64|Linux26|Linux26_64|MacOS|MacOS1010_64|MacOS1011_64|MacOS1012_64|MacOS1013_64|MacOS106|MacOS106_64|MacOS107_64|MacOS108_64|MacOS109_64|MacOS_64|Mandriva|Mandriva_64|NetBSD|NetBSD_64|Netware|OpenBSD|OpenBSD_64|OpenSolaris|OpenSolaris_64|OpenSUSE|OpenSUSE_64|Oracle|Oracle_64|OS2|OS21x|OS2eCS|OS2Warp3|OS2Warp4|OS2Warp45|Other|Other_64|QNX|RedHat|RedHat_64|Solaris|Solaris11_64|Solaris_64|Turbolinux|Turbolinux_64|Ubuntu|Ubuntu_64|VBoxBS_64Windows10|Windows10_64|Windows2000|Windows2003|Windows2008|Windows2012_64|Windows2016_64|Windows31|Windows7|Windows7_64|Windows8|Windows81|Windows81_64|Windows8_64|Windows95|Windows98|WindowsMe|WindowsNT|WindowsNT3x|WindowsNT4|WindowsNT_64|WindowsVista|WindowsVista_64|WindowsXP|WindowsXP_64|Xandros|Xandros_64"

vboxdir="$HOME/VirtualBox VMs"

usuage() 
{ 
	echo "Usuage:"
	echo "-s Operating System you can choose from the list => $oses"
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
		a=${OPTARG}
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

if [[ -d "$vboxdir" ]]; then
	if [[ ${a} =~ ^($oses)$ && ${m} =~ ^[0-9]+$ && ${s} =~ ^[0-9]+$ ]]; then
		VBoxManage createvm --name "${n}" --ostype ${a} --register
		VBoxManage modifyvm "${n}" --memory ${m}
		VBoxManage createhd --filename "$vboxdir/${n}/${n}.vdi" --size ${s} --format VDI
		VBoxManage storagectl "${n}" --name "IDE Controller" --add ide --controller PIIX4
		VBoxManage storageattach "${n}" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium "$vboxdir/${n}/${n}.vdi"
		VBoxManage storageattach "${n}" --storagectl "IDE Controller" --port 0 --device 1 --type dvddrive --medium emptydrive
	elif [[ ${a} =~ ^($oses)$ && ${m} =~ ^[0-9]+$ && ! ${s} =~ ^[0-9]+$ ]]; then
		echo -e "HDD size must be an integer in MB"
	elif [[ ${a} =~ ^($oses)$ && ! ${m} =~ ^[0-9]+$ && ${s} =~ ^[0-9]+$ ]]; then
		echo -e "Memory size must be an integer in MB"
	elif [[ ${a} =~ ^($oses)$ && ! ${m} =~ ^[0-9]+$ && ! ${s} =~ ^[0-9]+$ ]]; then
		echo -e "Sizes must be numbers"
	elif [[ ! ${a} =~ ^($oses)$ && ${m} =~ ^[0-9]+$ && ${s} =~ ^[0-9]+$ ]]; then
		echo -e "Operating System type not found"
	else
		echo -e "Something went wrong"
	fi
fi