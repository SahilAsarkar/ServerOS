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

echo "Copying package lists..."

sudo mkdir -p "$ROOTFS/tmp/packages"
sudo cp "$PROJECT_ROOT/packages/"*.txt "$ROOTFS/tmp/packages/"

echo "Installing packages..."

sudo chroot "$ROOTFS" bash <<'EOF'
set -e

apt update

if [ -f /tmp/packages/base.txt ]; then
    xargs -a /tmp/packages/base.txt apt install -y
fi

if [ -f /tmp/packages/server.txt ]; then
    xargs -a /tmp/packages/server.txt apt install -y
fi

if [ -f /tmp/packages/dev.txt ]; then
    xargs -a /tmp/packages/dev.txt apt install -y
fi

rm -rf /tmp/packages
EOF

echo "Cleaning up..."

sudo umount "$ROOTFS/dev/pts"
sudo umount "$ROOTFS/dev"
sudo umount "$ROOTFS/proc"
sudo umount "$ROOTFS/sys"

echo "Packages installed successfully."
