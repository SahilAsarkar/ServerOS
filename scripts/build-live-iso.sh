#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ISO="$PROJECT_ROOT/iso"
OUTPUT="$PROJECT_ROOT/output"

mkdir -p "$OUTPUT"

echo "Building ServerOS ISO..."

sudo grub-mkrescue \
-o "$OUTPUT/ServerOS-amd64.iso" \
"$ISO"

echo ""
echo "========================================"
echo "ServerOS Live ISO created successfully!"
echo "$OUTPUT/ServerOS-amd64.iso"
echo "========================================"
