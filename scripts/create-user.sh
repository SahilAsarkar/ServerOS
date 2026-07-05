#!/bin/bash

set -e

ROOTFS=rootfs

sudo chroot "$ROOTFS" bash <<'EOF'

if ! id serveros >/dev/null 2>&1
then
    useradd -m -s /bin/bash serveros
fi

echo "serveros:serveros" | chpasswd

usermod -aG sudo serveros

echo "root:root" | chpasswd

EOF

echo "Default users created."
