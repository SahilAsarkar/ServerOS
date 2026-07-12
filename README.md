# ServerOS

ServerOS is a lightweight Linux distribution built from Ubuntu using Debian's `debootstrap`. It is designed as a minimal server operating system that contains only the essential components required to boot and operate reliably while remaining fully customizable.

The project is built completely through Bash automation scripts, making the build process reproducible and easy to modify.

---

# Features

- Minimal Ubuntu-based Linux distribution
- Automated ISO generation
- BIOS and UEFI boot support
- Live boot support using Casper
- Custom ServerOS branding
- Custom login banner
- Custom MOTD
- Custom commands
- Automatic user creation
- Automatic package installation
- Modular build system
- Easy to customize
- Open source

---

# Requirements

Ubuntu 24.04 or newer

Required packages

```bash
sudo apt update

sudo apt install \
debootstrap \
squashfs-tools \
xorriso \
grub-pc-bin \
grub-efi-amd64-bin \
mtools \
dosfstools \
casper \
git \
wget \
curl
```

---

# Clone the Repository

```bash
git clone https://github.com/SahilAsarkar/ServerOS.git

cd ServerOS
```

---

# Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

---

# Build ServerOS

Build the AMD64 ISO

```bash
./scripts/rebuild.sh amd64
```

After the build finishes, the ISO will be generated in

```
output/ServerOS-amd64.iso
```

---

# Writing the ISO to USB

Use any ISO writing software such as

- Rufus
- Balena Etcher
- Ventoy

Then boot your computer from the USB drive.

---

# Login

Default user

```
Username: serveros
Password: serveros
```

Root

```
Username: root
Password: root
```

(Replace these with your own passwords before distributing the OS.)

---

# Custom Commands

ServerOS installs several custom terminal commands.

Example

```bash
server-info
```

Displays

- Distribution information
- Hostname
- Kernel version
- CPU information
- Memory usage
- Disk usage
- Uptime

Additional commands can be placed inside the `commands/` directory.

---

# Customizing ServerOS

Branding files are located in

```
branding/
```

Examples

```
branding/
├── os-release
├── lsb-release
├── hostname
├── hosts
├── issue
├── issue.net
└── motd
```

Modify these files to change the operating system branding.

---

# Build Scripts

The entire build process is automated through modular scripts.

```
create-rootfs.sh
configure-boot.sh
install-packages.sh
create-user.sh
apply-branding.sh
install-commands.sh
check-kernel.sh
check-casper.sh
build-live-files.sh
create-manifest.sh
generate-grub.sh
validate-iso.sh
build-live-iso.sh
rebuild.sh
```

Each script performs a specific task, making the project easy to understand and maintain.

---

# Roadmap

Future versions will include

- Better branding system
- Package manager improvements
- Installer
- Automatic updates
- Additional ServerOS utilities
- ARM support
- Raspberry Pi support
- More custom commands
- Better hardware detection

---

# Contributing

Contributions, improvements, bug reports, and feature requests are welcome.

Fork the repository, create a branch, make your changes, and submit a pull request.

---

# License

This project is released under the MIT License.

---

# Author

**Sahil Asarkar**

GitHub

https://github.com/SahilAsarkar

Project

https://github.com/SahilAsarkar/ServerOS

---

# Acknowledgements

ServerOS is built using open-source Linux technologies including

- Ubuntu
- Debian
- debootstrap
- GRUB
- Casper
- SquashFS
- xorriso

Thanks to the Linux open-source community for providing the tools that make this project possible.
