#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
git \
build-essential \
debootstrap \
squashfs-tools \
xorriso \
grub-pc-bin \
grub-efi-amd64-bin \
mtools \
dosfstools \
python3 \
python3-pip \
curl \
wget \
tree \
vim \
nano
