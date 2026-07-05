#!/bin/bash
set -e
ROOTFS="${ROOTFS:-rootfs}"
sudo chroot "$ROOTFS" /bin/bash <<'EOF'
id serveros >/dev/null 2>&1 || useradd -m -s /bin/bash serveros
echo "serveros:serveros" | chpasswd
echo "root:root" | chpasswd
usermod -aG sudo serveros
EOF
