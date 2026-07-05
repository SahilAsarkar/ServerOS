#!/bin/bash

set -e

ROOTFS=rootfs
ISO=iso

sudo chroot "$ROOTFS" dpkg-query \
-W \
--showformat='${Package} ${Version}\n' \
> "$ISO/casper/filesystem.manifest"

cp \
"$ISO/casper/filesystem.manifest" \
"$ISO/casper/filesystem.manifest-remove"
