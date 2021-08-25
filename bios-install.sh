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
pacman -Sy grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

#install konsole as terminal
pacman -S konsole

#set root password
clear
echo "set root password"
passwd

#make user
printf "enter you username: "
read USERNAME
useradd -m $USERNAME
usermod -a -G wheel $USERNAME
echo "set password for user"
passwd $USERNAME

#edit sudoers file
clear
echo "now uncomment the line include %wheel ALL=(ALL) then :wq"
printf "[press any key to continue]"
read KEY
visudo

#done
clear
echo "Done !"
printf "[press any key to reboot!]"
read K
reboot
