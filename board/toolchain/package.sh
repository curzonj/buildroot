#!/bin/sh

set -e
set -x

# Becauces the toolchain is unfornately not relocatable.
POSTFIX=$(echo $HOST_DIR | tr '[/]' '[_]')

echo $HOST_DIR

tar -czf /vagrant/toolchain$POSTFIX.tar.gz -C $HOST_DIR .
