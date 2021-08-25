########################################
#                                      #
#     https://github.com/am-shm        #
#                                      #
########################################

############### start ##################
echo "welcome to arch installer"
echo "by https://github.com/am-shm"
printf "enter your root partition: "
read ROOT
printf "enter your swap partition: "
read SWAP

############# installtion ##############
mfs.xfs $ROOT
mkswap $SWAP
mount $ROOT /mnt

############# base system ##############
pacstrap /mnt base base-devel linux vim vi

########## fstab generation ############
genfstab /mnt>/mnt/etc/fstab

#### chroot & config installed arch ####
arch-chroot /mnt bash -c 'mv /etc/locale.gen /etc/locale.gen.old;touch /etc/locale.gen;echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen;locale-gen;echo "arch" > /etc/hostname;touch /etc/hosts;echo "127.0.0.1 	localhost" >> /etc/hosts;echo "::1 		localhost" >> /etc/hosts;echo "::1 		localhost" >> /etc/hosts;echo "127.0.1.1 	     arch" >> /etc/hosts;pacman -S networkmanager;systemctl enable NetworkManager;pacman -Sy grub;grub-install /dev/sda;grub-mkconfig -o /boot/grub/grub.cfg;pacman -S konsole;clear;echo "set root password";passwd;clear;'

# config locale
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
# systemctl enable NetworkManager

#install and configuration bootloader
# pacman -Sy grub
# grub-install /dev/sda
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
