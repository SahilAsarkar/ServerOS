#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

if [ $# -ne 1 ]; then
    echo "Usage:"
    echo "./rebuild.sh amd64"
    echo "./rebuild.sh arm64"
    exit 1
fi

TARGET="$1"

echo
echo "==================================="
echo "      Building ServerOS"
echo "==================================="
echo "Target: $TARGET"
echo

echo "[1/6] Creating Root Filesystem..."
"$SCRIPT_DIR/create-rootfs.sh" "$TARGET"

echo
echo "[2/6] Configuring Boot..."
"$SCRIPT_DIR/configure-boot.sh"

echo
echo "[3/6] Installing Packages..."
"$SCRIPT_DIR/install-packages.sh"

echo
echo "[4/6] Applying Branding..."
"$SCRIPT_DIR/apply-branding.sh"

echo
echo "[5/6] Installing Commands..."
"$SCRIPT_DIR/install-commands.sh"

echo
echo "[6/6] Build Complete"

echo
echo "==================================="
echo " ServerOS build completed!"
echo "==================================="
