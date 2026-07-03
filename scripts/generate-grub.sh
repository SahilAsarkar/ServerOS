#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ISO="$PROJECT_ROOT/iso"

echo "Creating grub.cfg..."

mkdir -p "$ISO/boot/grub"

cat > "$ISO/boot/grub/grub.cfg" <<EOF
set timeout=5
set default=0

menuentry "ServerOS Live" {
    linux /casper/vmlinuz boot=casper quiet splash ---
    initrd /casper/initrd
}
EOF

echo "GRUB configuration created."
