echo "Downloading New Software from Host to target..."
echo "Downloading Kernel Image...."
sshpass -p "epl@123" scp epl@10.144.172.148:/home/epl/pi2-shared/zImage /tmp/                 
echo "Downloading Device Tree...."
sshpass -p "epl@123" scp epl@10.144.172.148:/home/epl/pi2-shared/bcm2709-rpi-2-b.dtb /tmp/      
echo "Downloading Application..."
sshpass -p "epl@123" scp epl@10.144.172.148:/home/epl/pi2-shared/rootfs.ext4 /tmp/                 

echo "Verify Checksum..."
if [[ -f /tmp/zImage && -f /tmp/bcm2709-rpi-2-b.dtb && -f /tmp/rootfs.ext4 ]];then 
		echo "Checksum Passed..."
		./SwUpg.sh
	else
		echo "Checksum Failed..."
fi
