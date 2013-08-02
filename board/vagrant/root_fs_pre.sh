#!/bin/sh

TARGET_DIR=$1

mkdir -p $TARGET_DIR/usr/share/examples

if [ -f $TARGET_DIR/etc/init.d/S01logging ]; then
	mv $TARGET_DIR/etc/init.d/S01logging $TARGET_DIR/usr/share/examples/
fi
