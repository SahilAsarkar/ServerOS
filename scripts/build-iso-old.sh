#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ROOTFS="$PROJECT_ROOT/rootfs"
ISO="$PROJECT_ROOT/iso"
OUTPUT="$PROJECT_ROOT/output"

echo "Preparing ISO..."

sudo rm -rf "$ISO"

mkdir -p "$ISO/boot/grub"
mkdir -p "$ISO/live"
mkdir -p "$OUTPUT"

echo "Copying kernel..."

sudo install -m 644 "$ROOTFS/boot/vmlinuz" "$ISO/boot/vmlinuz"
sudo install -m 644 "$ROOTFS/boot/initrd.img" "$ISO/boot/initrd.img"

sudo chown "$USER:$USER" "$ISO/boot/vmlinuz"
sudo chown "$USER:$USER" "$ISO/boot/initrd.img"

echo "Creating SquashFS..."

sudo mksquashfs "$ROOTFS" \
    "$ISO/live/filesystem.squashfs" \
    -e boot

echo "Creating grub.cfg..."

cat > "$ISO/boot/grub/grub.cfg" <<EOF
set timeout=5
set default=0

menuentry "ServerOS" {
    linux /boot/vmlinuz boot=live quiet
    initrd /boot/initrd.img
}
EOF

echo "Building ISO..."

grub-mkrescue \
    -o "$OUTPUT/ServerOS-amd64.iso" \
    "$ISO"

echo
echo "========================================"
echo " ServerOS ISO created successfully!"
echo " $OUTPUT/ServerOS-amd64.iso"
echo "========================================"
