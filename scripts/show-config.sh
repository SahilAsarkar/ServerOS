#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <config-file>"
    exit 1
fi

source "../config/$1"

echo "Architecture : $ARCH"
echo "Ubuntu       : $DISTRO"
echo "Hostname     : $HOSTNAME"
echo "Version      : $VERSION"
echo "Image Name   : $IMAGE_NAME"
echo "Output Dir   : $OUTPUT_DIR"
echo "RootFS Dir   : $ROOTFS_DIR"
