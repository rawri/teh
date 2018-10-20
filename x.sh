#!/bin/bash

loadkeys croata

timedatectl set-ntp true

yes | mkfs.ext4 /dev/sda1
yes | mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
mount /dev/sda1 /mnt
mkdir -p /mnt/home
mount /dev/sda2 /mnt/home
pacstrap -i /mnt base
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
pacman -S base-devel openssh grub-bios linux-headers linux-lts linux-lts-headers
mkinitcpio -p linux
mkinitcpio -p linux-lts
nano /etc/locale.gen


