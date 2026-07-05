#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

ROOTFS="$PROJECT_ROOT/rootfs"
BRANDING="$PROJECT_ROOT/branding"

echo "====================================="
echo " Applying ServerOS Branding"
echo "====================================="

# Copy branding files
cp "$BRANDING/os-release"  "$ROOTFS/etc/os-release"
cp "$BRANDING/lsb-release" "$ROOTFS/etc/lsb-release"
cp "$BRANDING/issue"       "$ROOTFS/etc/issue"
cp "$BRANDING/issue.net"   "$ROOTFS/etc/issue.net"
cp "$BRANDING/motd"        "$ROOTFS/etc/motd"
cp "$BRANDING/hostname"    "$ROOTFS/etc/hostname"
cp "$BRANDING/hosts"       "$ROOTFS/etc/hosts"

# Root prompt
mkdir -p "$ROOTFS/root"

cat > "$ROOTFS/root/.bashrc" <<'EOF'
export PS1="root@serveros:\w# "
EOF

# Disable Ubuntu MOTD
if [ -d "$ROOTFS/etc/update-motd.d" ]; then
    chmod -x "$ROOTFS/etc/update-motd.d/"* 2>/dev/null || true
fi

rm -f "$ROOTFS/etc/legal" 2>/dev/null || true

# Replace "ubuntu" text where possible
find "$ROOTFS/etc" -type f 2>/dev/null | while read file; do
    sed -i \
        -e 's/Ubuntu/ServerOS/g' \
        -e 's/ubuntu/ServerOS/g' \
        -e 's/UBUNTU/ServerOS/g' \
        "$file" 2>/dev/null || true
done

# Hostname
echo "serveros" > "$ROOTFS/etc/hostname"

# Machine information
mkdir -p "$ROOTFS/etc"

cat > "$ROOTFS/etc/serveros-release" <<EOF
ServerOS 0.1.0
Minimal Linux Distribution

https://github.com/SahilAsarkar/ServerOS
EOF

echo "Branding completed successfully."
