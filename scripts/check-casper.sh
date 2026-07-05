#!/bin/bash

set -e

ROOTFS=rootfs

INITRD=$(find "$ROOTFS/boot" -name "initrd.img*" | head -1)

echo "Checking Casper..."

if lsinitramfs "$INITRD" | grep -q casper
then
    echo "Casper found."
else
    echo "Casper missing."
    exit 1
fi
