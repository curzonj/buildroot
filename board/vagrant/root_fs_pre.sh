#!/bin/sh

TARGET_DIR=$1

mkdir -p $TARGET_DIR/usr/share/examples
mv $TARGET_DIR/etc/init.d/S01logging $TARGET_DIR/usr/share/examples/
