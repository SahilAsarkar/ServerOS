#!/bin/bash

set -e

ROOTFS="rootfs"

sudo mount --bind /dev "$ROOTFS/dev"
sudo mount --bind /proc "$ROOTFS/proc"
sudo mount --bind /sys "$ROOTFS/sys"

cleanup() {
    sudo umount -lf "$ROOTFS/dev" || true
    sudo umount -lf "$ROOTFS/proc" || true
    sudo umount -lf "$ROOTFS/sys" || true
}

trap cleanup EXIT

sudo chroot "$ROOTFS" bash <<EOF
set -e

apt update

apt install -y \
linux-image-generic \
casper \
grub-common \
grub-pc-bin \
grub-efi-amd64-bin \
os-prober

update-initramfs -u -k all

ls -lh /boot
EOF

echo "Boot configuration completed."
