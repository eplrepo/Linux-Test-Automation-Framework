chmod +x *
#ls
echo "Check Partition 4 bootinfo.txt"
mount /dev/mmcblk0p4 /mnt/
cd /mnt/
value=`cat bootinfo.txt`
echo "Current bootinfo is Partition $value"
if [ $value == 2 ]; then
        sed -i 's/2/3/g' bootinfo.txt
        echo "Updated bootinfo to Partition"
        cat bootinfo.txt
        cd /root
        umount /mnt/
        sync

        echo "Writing rootfs...wait ###"
        dd if=/tmp/rootfs.ext4 of=/dev/mmcblk0p3 conv=fsync
        sync
        echo "Done"

	mount /dev/mmcblk0p1 /mnt/                  
        cd /mnt/                                    
        echo "Changing cmdline to Partition 3..."   
        sed -i 's/mmcblk0p2/mmcblk0p3/g' cmdline.txt
        cat cmdline.txt                             
        echo "Copying zImage..."                    
        cp /tmp/zImage .                            
        echo "Copying bcm2709-rpi-2-b.dtb..."              
        cp /tmp/bcm2709-rpi-2-b.dtb .                      
        cd /root                                           
        umount /mnt/                                       
        sync       
	cp -a /tmp/release.txt /usr/version/release.txt                                        
        echo "delete current files..."                     
        rm -Rf *                                           
        echo "reboot..."                                   
        reboot  

else                                                       
        sed -i 's/3/2/g' bootinfo.txt                      
        echo "Updated bootinfo to Partition"               
        cat bootinfo.txt                                   
        cd /root                                           
        umount /mnt/                                       
        sync                                               
                                                           
        echo "Writing rootfs... wait ###"                  
        dd if=/tmp/rootfs.ext4 of=/dev/mmcblk0p2 conv=fsync
        sync                                               
        echo "Done"                                          

	mount /dev/mmcblk0p1 /mnt/                  
        cd /mnt/                                    
        echo "Changing cmdline to Partition 2..."   
        sed -i 's/mmcblk0p3/mmcblk0p2/g' cmdline.txt       
        cat cmdline.txt                                    
        echo "Copying zImage..."                           
        cp /tmp/zImage .                                   
        echo "Copying bcm2709-rpi-2-b.dtb..."              
        cp /tmp/bcm2709-rpi-2-b.dtb .                      
        cd /root/                                          
        umount /mnt/                                       
        sync 
	cp -a /tmp/release.txt /usr/version/release.txt                                              
        echo "delete current files..."                     
        rm -Rf *                                           
        echo "reboot..."                                   
        reboot                                             
fi             
