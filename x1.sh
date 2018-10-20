genfstab -U -p /mnt >> /mnt/etc/fstab
      
      
        

arch-chroot /mnt
      
      
        
pacman -S base-devel openssh grub-bios linux-headers linux-lts linux-lts-headers
      
      
        
mkinitcpio -p linux
      
      
        
mkinitcpio -p linux-lts
      
      
        
nano /etc/locale.gen
