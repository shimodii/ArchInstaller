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

printf "enter root partition: "
read ROOT

printf "enter swap partition: "
read SWAP

printf "enter EFI partition: "
read EFIPART

echo "now install process will start, you can have a coffee break :)"

echo "___________________________________________________________________"

  #############################################
############## install process ##################
  #############################################

#root partition
mkfs.ext4 $ROOT

#swap partition
mkswap $SWAP

#efi partition
mk.fat -F32 $EFIPART

#mount root to /mnt
mount $ROOT /mnt

#install linux base
pacstrap /mnt base base-devel linux linux-firmware vim

#generate fstab
genfstab /mnt > /mnt/etc/fstab

#chroot to base system 
arch-chroot /mnt

#config locale
mv /etc/locale.gen /etc/locale.gen.old
touch /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

#config hostname and hosts
echo "arch" > /etc/hostname
touch /etc/hosts
echo "127.0.0.1 	localhost" >> /etc/hosts
echo "::1 		localhost" >> /etc/hosts
echo "127.0.1.1 	     arch" >> /etc/hosts

#install and start networkmanager service
pacman -S networkmanager
systemctl start NetworkManager

#install and configuration bootloader
pacman -Sy grub efibootmgr
mkdir /boot/efi
mount $EFIPART /boot/efi
grub-install --target=x86_64-efi --bootloader-id=ARCH --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

#set root password
passwd
