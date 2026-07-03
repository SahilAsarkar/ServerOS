#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ROOTFS="$PROJECT_ROOT/rootfs"
ISO="$PROJECT_ROOT/iso"

echo "Cleaning old live files..."
rm -rf "$ISO/casper"
mkdir -p "$ISO/casper"

echo "Copying kernel..."
sudo cp -L "$ROOTFS/boot/vmlinuz" "$ISO/casper/vmlinuz"

echo "Copying initrd..."
sudo cp -L "$ROOTFS/boot/initrd.img" "$ISO/casper/initrd"

echo "Creating SquashFS..."
sudo mksquashfs "$ROOTFS" \
"$ISO/casper/filesystem.squashfs" \
-e boot

echo "Creating filesystem.size..."
sudo du -sx --block-size=1 "$ROOTFS" | cut -f1 > "$ISO/casper/filesystem.size"

echo "Creating filesystem.manifest..."
sudo chroot "$ROOTFS" dpkg-query -W \
--showformat='${Package} ${Version}\n' \
> "$ISO/casper/filesystem.manifest"

echo "Live files created successfully."
