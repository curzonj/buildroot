#! /bin/sh
#
# urandom	This script saves the random seed between reboots.
#		It is called from the boot, halt and reboot scripts.
#
# credits:  	http://permalink.gmane.org/gmane.linux.lfs.beyond.support/42849
#

[ -c /dev/urandom ] || exit 0
#. /etc/default/rcS

case "$1" in
	start|"")
		# Get number of seconds since epoch (or date in any other format).
		D=`date +%s`
		# Get some (pseudo)random data (better to use /dev/random instead of
		#/dev/urandom but this may be dangerous if /dev/random does'nt have
		#sufficiently amount of random data).
		R=`dd if=/dev/urandom count=64 bs=1 2>/dev/null`
		# Calculate sha512 hash of concatenation of our two data. It will be
		#our random seed.
		St=`echo -n "$R$D"|sha512sum -b|sed "s/ .*//"`
		# Convert hash to string with hexes.
		S=`echo $St|sed -r 's/([0-9a-f]{2})/\\\\x\1/g'`
		# Write our seed in binary form to /dev/urandom.
		echo -ne $S>/dev/urandom
		;;
	*)
		;;
esac
