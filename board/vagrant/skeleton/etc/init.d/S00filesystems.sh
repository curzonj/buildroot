#!/bin/sh

mount_kernel_fs() {
	mount -t proc proc /proc
	mkdir -p /dev/pts
	mkdir -p /dev/shm
	mount -a
}

find_usr_local() {
	for cmd in $(cat /proc/cmdline) ; do
		case $cmd in
		usrlocal=*)
			device=$(echo $cmd | cut -d= -f2)
			mount $device /usr/local
			;;
		esac
	done
}

case "$1" in
	start|"")
		mount_kernel_fs
		find_usr_local
		;;
	*)	
		;;
esac

