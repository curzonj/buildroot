#!/bin/sh

DIR=$1

mv $DIR/etc/inittab $DIR/etc/inittab.bak
sed 's/getty/getting -a root/' $DIR/etc/inittab.bak > $DIR/etc/inittab
rm $DIR/etc/inittab.bak

grep vagrant $DIR/etc/passwd || echo 'vagrant:x:1001:1001:Linux User,,,:/home/vagrant:/bin/ash' >> $DIR/etc/passwd
