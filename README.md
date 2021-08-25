# ArchInstaller
a small script to install arch linux 

# Arch linux installtion
we have 2 scripts that you can run them depend on your system<br>
and just partition your disk then run the script like this:<br>


    1- pacman -Sy git
    2- git clone https://github.com/am-shm/ArchInstaller.git
    3- cd ArchInstaller
    4- bash bios-install.sh
    or
    4- bash efi-install.sh
    
<b>these scripts</b><br>
     * install arch linux<br>
     * install bootloader<br>
     * install vi & vim TE<br>
     * install konsole as terminal
     * configure locale<br>
     * configure hostname and hosts<br>
     * make user and config that for sudo<br>

# Desktop installtion
after you finished arch installtion you can run one of that scripts (installgnome.sh/install-xfce.sh/install-kde.sh) to install desktop environment for arch linux.<br>
and if you install one of them and want to test the others you can run:<br>
    
    head -1 -DE YOU WANT- | bash
    
and reboot system and choose DE you want from DM<br>
you also can watch <a href="https://github.com/am-shm/minimal-desktop-configuration">here</a> for i3 configuration.<br>
<center>
    <img src="https://github.com/am-shm/ArchInstaller/blob/main/image_2021-08-25_17-25-52.png">
</center>

# Good to read
it's good to read <a href="https://github.com/am-shm/ArchInstaller/tree/main/about">here</a> !
# Done
in the end you will see [press any key to reboot!] message and when you press any key system will reboot to your grub bootloader!
<br><br>
made with 💙
<br>
<h1>Enjoy it 🍬</h1>
