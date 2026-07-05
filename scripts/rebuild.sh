#!/bin/bash

set -e

TARGET="$1"

./scripts/create-rootfs.sh "$TARGET"

./scripts/configure-boot.sh

./scripts/install-packages.sh

./scripts/create-user.sh

./scripts/apply-branding.sh

./scripts/install-commands.sh

./scripts/check-kernel.sh

./scripts/check-casper.sh

./scripts/build-live-files.sh

./scripts/create-manifest.sh

./scripts/generate-grub.sh

./scripts/validate-iso.sh

./scripts/build-live-iso.sh

echo
echo "ServerOS build complete."
