echo "Copying files from Host to target"
echo "zImage"
sshpass -p "epl@123" scp epl@192.168.0.2:/home/epl/LTIB/LTP_Source/home/epl/LTPbuildroot/pi2/zImage /tmp/                 
echo "bcm2709-rpi-2-b.dtb"
sshpass -p "epl@123" scp epl@192.168.0.2:/home/epl/LTIB/LTP_Source/home/epl/LTPbuildroot/pi2/bcm2709-rpi-2-b.dtb /tmp/                 
echo "rootfs.ext4"
sshpass -p "epl@123" scp epl@192.168.0.2:/home/epl/LTIB/LTP_Source/home/epl/LTPbuildroot/pi2/rootfs.ext4 /tmp/                 

echo "Check for New SW"
if [[ -f /tmp/zImage && -f /tmp/bcm2709-rpi-2-b.dtb && -f /tmp/rootfs.ext4 ]];then 
		echo "All required files are present\n"
		./SwUpg.sh
	else
		echo "All required files are not present\n"
fi
