#!/bin/bash

set -e

mkdir -p output

sudo grub-mkrescue \
-o output/ServerOS-amd64.iso \
iso

echo
echo "ISO created:"
echo "output/ServerOS-amd64.iso"
