#!/bin/bash


# make user #
clear
printf "enter you username: "
read USERNAME
useradd -m $USERNAME
usermod -a -G wheel $USERNAME
echo "set password for user"
passwd $USERNAME

# edit sudoers file #
clear
echo "now uncomment the line include %wheel ALL=(ALL) then :wq"
printf "[press any key to continue]"
read KEY
visudo

