#!/bin/sh


case "$1" in
	start|"")
		# Hosts are completely anonymous
		myname=vm-$(dd if=/dev/urandom count=1 2>/dev/null | md5sum | awk '{print substr($1,0,12)}')
		/bin/hostname $myname

		# /etc/hosts is a symlink to a tmpfs so that we can update it
		# because the host's name must always be in it's etc/hosts file
		echo "127.0.0.1	$myname localhost" > /etc/hosts
		;;
	*)	
		;;
esac
