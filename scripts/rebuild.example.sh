#!/bin/bash
set -e
./scripts/create-rootfs.sh
./scripts/configure-boot.sh
./scripts/install-packages.sh
./scripts/create-user.sh
./scripts/apply-branding.sh
./scripts/build-live-files.sh
./scripts/create-manifest.sh
./scripts/build-live-iso.sh
