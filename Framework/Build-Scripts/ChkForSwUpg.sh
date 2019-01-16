#!/bin/sh
echo "Configuring Board IP....."
ifconfig eth0 192.168.0.1
ifconfig
echo "Copying version file from Host to Target"
sshpass -p "epl@123" scp epl@192.168.0.2:/home/epl/LTIB/LTP_Source/home/epl/LTPbuildroot/pi2/release.txt /tmp/
if [ -e /tmp/release.txt ]; then
        currver=`cat /usr/version/release.txt`
        newver=`cat /tmp/release.txt`
        if [ $currver == $newver ]; then
                echo "Same Software"
        else
                echo "New Software Available"
                ./NewBinaries.sh
        fi
        else
                echo "No Upgrade"
fi
