#!/bin/bash

set -e

echo "Validating ISO..."

test -f iso/casper/vmlinuz
test -f iso/casper/initrd
test -f iso/casper/filesystem.squashfs
test -f iso/casper/filesystem.size
test -f iso/casper/filesystem.manifest
test -f iso/boot/grub/grub.cfg

echo "ISO validation passed."
