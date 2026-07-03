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
echo "========================================"
echo "        Building ServerOS"
echo "========================================"
echo "Target: $TARGET"
echo

echo "[1/8] Creating Root Filesystem..."
"$SCRIPT_DIR/create-rootfs.sh" "$TARGET"

echo
echo "[2/8] Configuring Boot..."
"$SCRIPT_DIR/configure-boot.sh"

echo
echo "[3/8] Installing Packages..."
"$SCRIPT_DIR/install-packages.sh"

echo
echo "[4/8] Applying Branding..."
"$SCRIPT_DIR/apply-branding.sh"

echo
echo "[5/8] Installing Commands..."
"$SCRIPT_DIR/install-commands.sh"

echo
echo "[6/8] Creating Live Files..."
"$SCRIPT_DIR/build-live-files.sh"

echo
echo "[7/8] Generating GRUB Configuration..."
"$SCRIPT_DIR/generate-grub.sh"

echo
echo "[8/8] Building Live ISO..."
"$SCRIPT_DIR/build-live-iso.sh"

echo
echo "========================================"
echo "ServerOS build completed successfully!"
echo
echo "ISO Location:"
echo "$PROJECT_ROOT/output/ServerOS-amd64.iso"
echo "========================================"
