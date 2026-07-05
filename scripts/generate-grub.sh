#!/bin/bash

set -e

mkdir -p iso/boot/grub

cat > iso/boot/grub/grub.cfg <<EOF
set timeout=5
set default=0

menuentry "ServerOS Live" {
    linux /casper/vmlinuz boot=casper hostname=serveros quiet splash ---
    initrd /casper/initrd
}
EOF

echo "GRUB generated."
