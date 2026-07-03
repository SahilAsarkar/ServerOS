#!/bin/bash

set -e

ROOTFS="rootfs"

sudo mount --bind /dev "$ROOTFS/dev"
sudo mount --bind /proc "$ROOTFS/proc"
sudo mount --bind /sys "$ROOTFS/sys"

sudo chroot "$ROOTFS" bash <<'EOF'
apt update
apt install -y linux-image-generic grub-pc-bin grub-efi-amd64-bin
update-initramfs -u
EOF

sudo umount "$ROOTFS/dev"
sudo umount "$ROOTFS/proc"
sudo umount "$ROOTFS/sys"

echo "Boot configuration completed."
