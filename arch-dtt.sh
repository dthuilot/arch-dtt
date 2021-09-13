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
pacman -Syu --noconfirm iwd sudo grub efibootmgr os-prober git base-devel vim nano

# Graphical drivers
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

# Display manager
pacman -S --noconfirm xorg lightdm lightdm-gtk-greeter xmonad xmonad-contrib xmobar dmenu nitrogen xterm alacritty pulseaudio
# This video could be helpful https://www.youtube.com/watch?v=JmPLbZQRgas to setup systemd etc..

# Graphical utilities
pacman -S --noconfirm firefox

# Grub
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Grub
grub-mkconfig -o /boot/grub/grub.cfg

