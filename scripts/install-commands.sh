#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ROOTFS="$PROJECT_ROOT/rootfs"
COMMANDS="$PROJECT_ROOT/commands"

echo "Installing ServerOS commands..."

sudo mkdir -p "$ROOTFS/usr/local/bin"

sudo cp "$COMMANDS"/* "$ROOTFS/usr/local/bin/"

sudo chmod +x "$ROOTFS"/usr/local/bin/*

echo "Commands installed successfully."
