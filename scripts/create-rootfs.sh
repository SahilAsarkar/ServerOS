#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

if [ $# -ne 1 ]; then
    echo "Usage: $0 amd64|arm64"
    exit 1
fi

CONFIG_FILE="$PROJECT_ROOT/config/$1.conf"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file not found: $CONFIG_FILE"
    exit 1
fi

source "$CONFIG_FILE"

echo "====================================="
echo "Building ServerOS Root Filesystem"
echo "Architecture : $ARCH"
echo "Ubuntu       : $DISTRO"
echo "====================================="

sudo rm -rf "$PROJECT_ROOT/$ROOTFS_DIR"

sudo debootstrap \
    --arch="$ARCH" \
    "$DISTRO" \
    "$PROJECT_ROOT/$ROOTFS_DIR" \
    http://archive.ubuntu.com/ubuntu

echo
echo "Root filesystem created successfully."
