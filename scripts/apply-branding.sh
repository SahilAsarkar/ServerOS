#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ROOTFS="$PROJECT_ROOT/rootfs"
BRANDING="$PROJECT_ROOT/branding"

echo "Applying ServerOS branding..."

sudo cp "$BRANDING/os-release" "$ROOTFS/etc/os-release"
sudo cp "$BRANDING/issue" "$ROOTFS/etc/issue"
sudo cp "$BRANDING/motd" "$ROOTFS/etc/motd"

echo "Branding applied successfully."
