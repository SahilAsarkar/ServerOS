#!/bin/bash

set -e

ROOTFS=rootfs

echo "Checking kernel..."

KERNEL=$(find "$ROOTFS/boot" -name "vmlinuz*" | head -1)
INITRD=$(find "$ROOTFS/boot" -name "initrd.img*" | head -1)

[ -f "$KERNEL" ]
[ -f "$INITRD" ]

echo "Kernel : $KERNEL"
echo "Initrd : $INITRD"

echo "Kernel check passed."
