#!/bin/sh

# Author : David Thuilot

# Time zone (Need to check this before to run the script)
ln -sf /usr/share/zoneinfo/US/Central /etc/localtime
hwclock --systohc

# Localization
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Network configuration
echo "lutetia" > /etc/hostname

echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1     lutetia.localdomain  lutetia" >> /etc/hosts

# Install packages
pacman -Syu --noconfirm iwd sudo grub efibootmgr os-prober git base-devel

# Graphical things
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

# Grub
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Grub
grub-mkconfig -o /boot/grub/grub.cfg

