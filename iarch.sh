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

pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

echo monika /mnt/etc/hostname

curl https://raw.githubusercontent.com/LukeSmithxyz/LARBS/master/testing/chroot.sh > /mnt/chroot.sh && arch-chroot /mnt bash chroot.sh && rm /mnt/chroot.sh
