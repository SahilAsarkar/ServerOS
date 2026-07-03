#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ROOTFS="$PROJECT_ROOT/rootfs"

echo "Mounting virtual filesystems..."

sudo mount --bind /dev "$ROOTFS/dev"
sudo mount --bind /dev/pts "$ROOTFS/dev/pts"
sudo mount --bind /proc "$ROOTFS/proc"
sudo mount --bind /sys "$ROOTFS/sys"

echo "Mounting package directory..."

sudo mkdir -p "$ROOTFS/packages"
sudo mount --bind "$PROJECT_ROOT/packages" "$ROOTFS/packages"

echo "Installing packages..."

sudo chroot "$ROOTFS" bash <<EOF
set -e

apt update

xargs -a /packages/base.txt apt install -y
xargs -a /packages/server.txt apt install -y
xargs -a /packages/dev.txt apt install -y
EOF

echo "Cleaning up..."

sudo umount "$ROOTFS/packages"
sudo umount "$ROOTFS/dev/pts"
sudo umount "$ROOTFS/dev"
sudo umount "$ROOTFS/proc"
sudo umount "$ROOTFS/sys"

echo "Packages installed successfully!"
