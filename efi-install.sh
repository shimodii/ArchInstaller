############## arch installer ###############
#                                           #
#                                           #
#       https://github.com/am-shm           #
#                                           #
#                                           #
#                                           #
############################################# 


ehco "welcome to arch installer script, first of all read the README.md"

echo ""

echo "make sure you did these to your hard: "
echo "/dev/sda1		root"
echo "/dev/sda2		swap"
echo "/dev/sda3		EFI"

echo ""

printf "[press any key to continue!]"
read K

echo ""

echo "___________________________________________________________________"

  #############################################
############## install process ##################
  #############################################

#root partition
mkfs.ext4 /dev/sda1

#swap partition
mkswap /dev/sda2

#efi partition
mkfs.fat -F32 /dev/sda3

#mount root to /mnt
mount /dev/sda1 /mnt

#install linux base
pacstrap /mnt base base-devel linux linux-firmware vim vi

#generate fstab
genfstab /mnt > /mnt/etc/fstab

#chroot to base system 
arch-chroot /mnt bash -c 'mv /etc/locale.gen /etc/locale.gen.old;touch /etc/locale.gen;echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen;locale-gen;echo "arch" > /etc/hostname;touch /etc/hosts;echo "127.0.0.1 	localhost" >> /etc/hosts;echo "::1 		localhost" >> /etc/hosts;echo "::1 		localhost" >> /etc/hosts;echo "127.0.1.1 	     arch" >> /etc/hosts;pacman -S networkmanager;systemctl enable NetworkManager;pacman -Sy grub efibootmgr;mkdir /boot/efi;mount /dev/sda3 /boot/efi;grub-install --target=x86_64-efi --bootloader-id=ARCH --efi-directory=/boot/efi;grub-mkconfig -o /boot/grub/grub.cfg;pacman -S konsole;clear;echo "set root password";passwd'

#config locale
# mv /etc/locale.gen /etc/locale.gen.old
# touch /etc/locale.gen
# echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
# locale-gen

#config hostname and hosts
# echo "arch" > /etc/hostname
# touch /etc/hosts
# echo "127.0.0.1 	localhost" >> /etc/hosts
# echo "::1 		localhost" >> /etc/hosts
# echo "127.0.1.1 	     arch" >> /etc/hosts

#install and start networkmanager service
# pacman -S networkmanager
# systemctl start NetworkManager

#install and configuration bootloader
# pacman -Sy grub efibootmgr
# mkdir /boot/efi
# mount $EFIPART /boot/efi
# grub-install --target=x86_64-efi --bootloader-id=ARCH --efi-directory=/boot/efi
# grub-mkconfig -o /boot/grub/grub.cfg

#install konsole as terminal
# pacman -S konsole

#set root password
# clear
# echo "set root password"
# passwd


#done
clear
echo "Done !"
printf "[press any key to reboot!]"
read K
reboot
