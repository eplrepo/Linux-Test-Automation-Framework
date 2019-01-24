echo "Copying files from Host to target"
echo "Copying new zImage...."
sshpass -p "epl@123" scp epl@10.144.172.149:/home/epl/LTIB/LTP_Source/home/epl/LTPbuildroot/pi2/zImage /tmp/                 
echo "Copying new Device Tree...."
sshpass -p "epl@123" scp epl@10.144.172.149:/home/epl/LTIB/LTP_Source/home/epl/LTPbuildroot/pi2/bcm2709-rpi-2-b.dtb /tmp/                 
echo "Copying new Filesystem..."
sshpass -p "epl@123" scp epl@10.144.172.149:/home/epl/LTIB/LTP_Source/home/epl/LTPbuildroot/pi2/rootfs.ext4 /tmp/                 

echo "Verify Checksum..."
if [[ -f /tmp/zImage && -f /tmp/bcm2709-rpi-2-b.dtb && -f /tmp/rootfs.ext4 ]];then 
		echo "Checksum Passed...\n"
		./SwUpg.sh
	else
		echo "Checksum Failed...\n"
fi
