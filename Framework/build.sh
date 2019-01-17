#!/bin/sh

#Ensure the script is running with sudo

#This script assumes SDCARD is mounted in System and 4 partitions are created with the first partition
#as FAT filesystem and bootable 

#sudo chown -R root *

echo "Compiler Set Up........"
#Export Cross Compiler Path
#export PATH=$PWD/Cross-compiler/bin:$PATH
#export CROSS_COMPILE=arm-buildroot-linux-uclibcgnueabihf-
#export ARCH=arm


#Build Kernel
echo "Building Kernel........"
cd Linux-Kernel/Linux
#make clean
#cp Rasperri-Pi2-config .config
#make distclean
#cp test_framework_config .config
#make
#Install Kernel Modules
echo "Installing Kernel Modules........"
#rm -rf lib/modules
#make INSTALL_MOD_PATH=./ modules_install
cd ../../

#Build LTP
#TODO - The LTP source is from LTIB due to which the cross compiler
#paths are harcoded. To come out of the issue , a workaround has been made
# to install the cross compiler in /home/LinuxBenchmarkAutomation and the 
#relevant files are updated with this path
echo "Building LTP........"
cd LTP-Source/ltp-testsuite-20180118/
#FIX THIS : Delete utils/ffsb-6.0-rc2 as the Jenkins build 
#error occurs due to this folder . Need to find the root cause
rm -rf utils/ffsb-6.0-rc2
rm -rf /usr/lib/ltp-testsuite
rm include/mk/config.mk
rm include/mk/config-openposix.mk
#rm utils/ffsb-6.0-rc2/Makefile
cp -a ../../Build-Scripts/LTP-Build-Scripts/config.mk include/mk/ 
cp -a ../../Build-Scripts/LTP-Build-Scripts/config-openposix.mk include/mk/
#cp -a ../../Build-Scripts/LTP-Build-Scripts/Makefile utils/ffsb-6.0-rc2/
make clean
#BEWARE!!! - Doing a distclean will result in reconfiguring
#the entire LTP again and build
#make distclean
make
make install
cd ../../

#Build Application

#Build Filesystem
echo "Set Up File System........"
umount mntpt
mount Filesystem/rootfs.ext4 mntpt/
#Copy Kernel Modules
echo "Copying Kernel Modules........"
rm -rf mntpt/lib/modules
cp -a Linux-Kernel/Linux/lib/modules mntpt/lib/

#Enable autologin scripts
echo "Copying Login Scripts........"
rm mntpt/usr/bin/autologin
cp Build-Scripts/autologin mntpt/usr/bin/
chmod +x mntpt/usr/bin/autologin
rm mntpt/etc/inittab
cp Build-Scripts/inittab mntpt/etc/
chmod +x mntpt/etc/inittab

#Copy profile
rm mntpt/etc/profile
cp Build-Scripts/profile mntpt/etc/

#Copy Known host
echo "Copying HOST Key........"
rm -rf mntpt/root/.ssh
cp -a Build-Scripts/.ssh mntpt/root/

#Copy LTP Binaries
echo "Copying LTP test cases........"
rm -rf mntpt/usr/lib/ltp-testsuite
echo 
cp -a /usr/lib/ltp-testsuite mntpt/usr/lib/
#cp -a /usr/lib/ltp-testsuite mntpt/usr/lib/


#copy software upgrade related scripts
echo "Copying SW-UPG scripts........"
rm -rf mntpt/root/swupg-scripts
mkdir mntpt/root/swupg-scripts
cp -a Build-Scripts/ChkForSwUpg.sh mntpt/root/swupg-scripts/
cp -a Build-Scripts/NewBinaries.sh mntpt/root/swupg-scripts/
cp -a Build-Scripts/SwUpg.sh mntpt/root/swupg-scripts/

umount mntpt
sync

echo "Filesystem Set up complete!!!"

#copy all binaries to a single folder 
#before writing to SDCARD
cp -a Filesystem/rootfs.ext2 Binaries/rfs/
cp -a Filesystem/rootfs.ext4 Binaries/rfs/
cp -a Linux-Kernel/Linux/arch/arm/boot/zImage Binaries/boot/
cp -a Linux-Kernel/Linux/arch/arm/boot/dts/bcm2709-rpi-2-b.dtb Binaries/boot/

if [ 1 -eq 0 ]; then
#copy zImage and its related binaries to Parition 1
echo "Writing Boot Partition........"
umount mntpt/
mount /dev/sdb1 mntpt/
cp Binaries/boot/* mntpt/
umount mntpt
sync

#Write RFS to Partition 2
echo "Writing RFS1........"
dd bs=4M if=Binaries/rfs/rootfs.ext4 of=/dev/sdb2 conv=fsync

#Write RFS to partition 3
echo "Writing RFS2........"
dd bs=4M if=Binaries/rfs/rootfs.ext4 of=/dev/sdb3 conv=fsync

#Write bootinfo to partition 4
echo "Writing BOOTINFO........"
umount mntpt/
mount /dev/sdb4 mntpt/
cp Binaries/bootinfo/* mntpt/
umount mntpt
sync

#echo "SDCARD READY!!!!!"

#DElete binaries
echo "Deleting Binaries Folder..."
rm -rf Binaries/rfs/*
rm -rf Binaries/boot/zImage
rm -rf Binaries/boot/bcm2709-rpi-2-b.dtb
rm -rf /usr/lib/ltp-testsuite
fi
