#!/usr/bin/env python3
from subprocess import run

def intro():
	print("Press the number key that corisponds to the Mac OSX version your trying to install on VirtualBox.")
	print("1: Mac OSX 10.13 High Sierra		2: Mac OSX 10.14 Mojave")

	osxversion(mac_number = input("Enter Number: "))

def osxversion(mac_number):
	if (mac_number == '1'):
		print("Mac OSX High Sierra")
		hsierra(machine_name = input("What is the name of your VirtualBox VM?:"))
	elif (mac_number == '2'):
		print("Mac OSX Mojave")
		mojave(machine_name = input("What is the name of your VirtualBox VM?:"))
	else:
		print("Invalid Number try again:")
		intro()
	return
def hsierra(machine_name):
	namecmd = '"'+machine_name+'"'
	print('The name of your VirtualBox VM is '+namecmd)
	vbshcmd = 'VBoxManage modifyvm' + namecmd + '--cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff'
	correct_name = input('Is this correct? (y/N):')
	if (correct_name == 'y' or correct_name == 'Y'):
		print("Great")
		run(['VBoxManage','modifyvm',machine_name,'--cpuidset','00000001', '000106e5', '00100800', '0098e3fd', 'bfebfbff'])
		print("1st stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/efi/0/Config/DmiSystemProduct"','"iMac11,3"'])
		print("2nd stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/efi/0/Config/DmiSystemVersion"','"1.0"'])
		print("3rd stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/efi/0/Config/DmiBoardProduct"','"Iloveapple"'])
		print("4th stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/smc/0/Config/DeviceKey"','"ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"'])
		print("5th stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC"','1'])
		print("VM Modification is Finnished.")
	return

def mojave(machine_name):
	print("The name of your VirtualBox VM is ", machine_name)
	correct_name = input('Is this correct? (y/N):')
	if (correct_name == 'y' or correct_name == 'Y'):
		print("Great")
		run(['VBoxManage','modifyvm',machine_name,'--cpuidset','00000001','000106e5','00100800','0098e3fd','bfebfbff'])
		print("1st stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/efi/0/Config/DmiSystemProduct"','"iMac11,3"'])
		print("2nd stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/efi/0/Config/DmiSystemVersion"','"1.0"'])
		print("3rd stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/efi/0/Config/DmiBoardProduct"','"Iloveapple"'])
		print("4th stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/smc/0/Config/DeviceKey"','"ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"'])
		print("5th stage done.")
		run(['VBoxManage','setextradata',machine_name,'"VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC"','1'])
		print("VM Modification is Finnished.")
	return

intro()