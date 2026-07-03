#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ROOTFS="$PROJECT_ROOT/rootfs"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <amd64|arm64>"
    exit 1
fi

TARGET="$1"

case "$TARGET" in
    amd64)
        ARCH="amd64"
        ;;
    arm64)
        ARCH="arm64"
        ;;
    *)
        echo "Unsupported architecture: $TARGET"
        exit 1
        ;;
esac

echo "Cleaning previous rootfs..."
sudo rm -rf "$ROOTFS"

echo "Creating rootfs..."
sudo mkdir -p "$ROOTFS"

echo "Running debootstrap..."
sudo debootstrap \
    --arch="$ARCH" \
    noble \
    "$ROOTFS" \
    http://archive.ubuntu.com/ubuntu

echo "Configuring APT repositories..."

cat <<EOF | sudo tee "$ROOTFS/etc/apt/sources.list" >/dev/null
deb http://archive.ubuntu.com/ubuntu noble main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu noble-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu noble-security main restricted universe multiverse
EOF

echo "Updating package lists..."

sudo mount --bind /dev "$ROOTFS/dev"
sudo mount --bind /dev/pts "$ROOTFS/dev/pts"
sudo mount --bind /proc "$ROOTFS/proc"
sudo mount --bind /sys "$ROOTFS/sys"

sudo chroot "$ROOTFS" bash <<EOF
apt update
apt install -y ubuntu-minimal
EOF

sudo umount "$ROOTFS/dev/pts"
sudo umount "$ROOTFS/dev"
sudo umount "$ROOTFS/proc"
sudo umount "$ROOTFS/sys"

echo
echo "==================================="
echo "Base system installed successfully."
echo "Root filesystem created successfully."
echo "==================================="
