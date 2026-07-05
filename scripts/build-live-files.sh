#!/bin/bash

set -e

ROOTFS=rootfs
ISO=iso

rm -rf "$ISO/casper"
mkdir -p "$ISO/casper"

KERNEL=$(find "$ROOTFS/boot" -name "vmlinuz*" | head -1)
INITRD=$(find "$ROOTFS/boot" -name "initrd.img*" | head -1)

sudo cp "$KERNEL" "$ISO/casper/vmlinuz"
sudo cp "$INITRD" "$ISO/casper/initrd"

sudo mksquashfs \
"$ROOTFS" \
"$ISO/casper/filesystem.squashfs" \
-e boot

sudo du -sx --block-size=1 "$ROOTFS" \
| cut -f1 \
> "$ISO/casper/filesystem.size"
