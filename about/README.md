# Some description
some tutorials

# What is BIOS
In computing, BIOS (Basic Input/Output System and also known as the System BIOS, ROM BIOS, BIOS ROM or PC BIOS) is firmware used to perform hardware initialization during the booting process (power-on startup), and to provide runtime services for operating systems and programs. The BIOS firmware comes pre-installed on a personal computer's system board, and it is the first software to run when powered on. The name originates from the Basic Input/Output System used in the CP/M operating system in 1975. The BIOS originally proprietary to the IBM PC has been reverse engineered by some companies (such as Phoenix Technologies) looking to create compatible systems.

# What is UEFI/EFI
The Unified Extensible Firmware Interface (UEFI or EFI for short) is a new model for the interface between operating systems and firmware. It provides a standard environment for booting an operating system and running pre-boot applications.<br>
It is distinct from the commonly used "MBR boot code" method followed for BIOS systems.

# Arch boot process
In order to boot Arch Linux, a Linux-capable boot loader must be set up. The boot loader is responsible for loading the kernel and initial ramdisk before initiating the boot process. The procedure is quite different for BIOS and UEFI systems.<br>
<h3>-System initialization Under BIOS:</h3><br>
1-System switched on, the power-on self-test (POST) is executed.<br>
2-After POST, BIOS initializes the hardware required for booting (disk, keyboard controllers etc.).<br>
3-BIOS launches the first 440 bytes (the Master Boot Record bootstrap code area) of the first disk in the BIOS disk order.<br>
4-The boot loader's first stage in the MBR boot code then launches its second stage code.<br>
5-The actual boot loader is launched.<br>
6-The boot loader then loads an operating system by either chain-loading or directly loading the operating system kernel.<br><br>

<h3>-System initialization Under UEFI:</h3><br>
1-System switched on, the power-on self-test (POST) is executed.<br>
2-After POST, UEFI initializes the hardware required for booting (disk, keyboard controllers etc.).<br>
3-Firmware reads the boot entries in the NVRAM to determine which EFI application to launch and from where (e.g. from which disk and partition).<br>
4-Firmware launches the EFI application. (This could be a boot loader or the Arch kernel itself using EFISTUB OR could be some other EFI application such as a UEFI shell or a boot manager like systemd-boot or rEFInd)<br>
<b>If Secure Boot is enabled, the boot process will verify authenticity of the EFI binary by signature. </b><br>
and you can see difference beteween UEFI/EFI & BIOS<br?
<img src="https://github.com/am-shm/ArchInstaller/blob/main/about/image.png">

# What is fstab
The fstab file can be used to define how disk partitions, various other block devices, or remote filesystems should be mounted into the filesystem.<br>
Each filesystem is described in a separate line. These definitions will be converted into systemd mount units dynamically at boot, and when the configuration of the system manager is reloaded. The default setup will automatically fsck and mount filesystems before starting services that need them to be mounted. For example, systemd automatically makes sure that remote filesystem mounts like NFS or Samba are only started after the network has been set up. Therefore, local and remote filesystem mounts specified in /etc/fstab should work out-of-the-box. See systemd.mount for details. <br>
The mount command will use fstab, if just one of either directory or device is given, to fill in the value for the other parameter. When doing so, mount options which are listed in fstab will also be used. 

# Source
<a href="https://wiki.archlinux.org">
  <h3>Arch Wiki</h3>
</a>
