# ServerOS

ServerOS is a lightweight, Debian-based Linux distribution built from scratch for servers, cloud deployments, virtual machines, and Raspberry Pi devices.

The goal of this project is to create a fast, minimal, secure, and customizable operating system that contains only the components required to run server workloads while providing an easy build system for developers.

---

# Features

- Debian-based
- Lightweight root filesystem
- Custom ServerOS branding
- Automated build pipeline
- Live ISO generation
- GRUB bootloader
- BIOS support
- UEFI support
- SquashFS live filesystem
- Automatic manifest generation
- Automatic filesystem size generation
- Automatic checksum generation
- Custom ServerOS commands
- Git-based project structure
- Modular build scripts
- Rebuild automation

---

# Project Structure

```
ServerOS/
│
├── scripts/
│   ├── rebuild.sh
│   ├── create-rootfs.sh
│   ├── configure-boot.sh
│   ├── install-packages.sh
│   ├── install-commands.sh
│   ├── apply-branding.sh
│   ├── create-live-files.sh
│   ├── generate-grub.sh
│   ├── create-bios.sh
│   ├── create-efi.sh
│   ├── create-md5.sh
│   ├── validate-iso.sh
│   └── build-live-iso.sh
│
├── rootfs/
├── iso/
├── output/
├── branding/
├── configs/
├── packages/
├── docs/
└── README.md
```

---

# Requirements

Ubuntu 24.04 LTS or newer

Packages:

```
sudo apt update

sudo apt install \
debootstrap \
squashfs-tools \
xorriso \
grub-pc-bin \
grub-efi-amd64-bin \
grub-common \
mtools \
dosfstools \
xfsprogs \
rsync \
wget \
curl \
git \
nano
```

---

# Building ServerOS

Clone the repository

```
git clone <repository-url>

cd ServerOS
```

Make every script executable

```
chmod +x scripts/*.sh
```

Build ServerOS

```
./scripts/rebuild.sh amd64
```

For ARM64

```
./scripts/rebuild.sh arm64
```

---

# Build Pipeline

The rebuild script automatically performs:

```
1. Create Root Filesystem

2. Configure Boot

3. Install Packages

4. Apply Branding

5. Install Custom Commands

6. Create Live Files

7. Generate GRUB Configuration

8. Create BIOS Boot Image

9. Create EFI Boot Image

10. Generate MD5 Checksums

11. Build Live ISO

12. Validate ISO
```

---

# Output

The finished ISO is generated in

```
output/
```

Example

```
output/ServerOS-amd64.iso
```

---

# Goals

ServerOS aims to become a complete Linux distribution featuring

- Live ISO
- Installer
- Package Repository
- OTA Updates
- Raspberry Pi Support
- ARM64 Builds
- Server Profiles
- Docker Integration
- Kubernetes Support
- Monitoring Tools
- Secure Boot
- Disk Encryption
- CI/CD Build System

---

# Supported Platforms

Current

- AMD64

Planned

- ARM64
- Raspberry Pi Zero
- Raspberry Pi 4
- Raspberry Pi 5

---

# Contributing

Contributions are welcome.

Before submitting changes:

- Fork the repository
- Create a feature branch
- Commit using meaningful commit messages
- Open a Pull Request

---

# Author

Developed by Sahil Asarkar

Project Name

ServerOS

Version

0.1.0 Alpha
