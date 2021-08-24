mfs.xfs /dev/sda1
mkswap /dev/sda2
mount /dev/sda1 /mnt
pacstrap /mnt base base-devel linux
genfstab /mnt>/mnt/etc/fstab
arch-chroot /mnt bash -c 'pacman -Sy grub;grub-install /dev/sda;grub-mkconfig -o /boot/grub/grub.cfg;pacman -Sy vim networkmanager;systemctl enable NetworkManager;passwd';reboot
