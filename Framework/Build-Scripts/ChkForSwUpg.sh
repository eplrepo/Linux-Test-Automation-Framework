#!/bin/sh
echo "Configuring Board IP....."
ifconfig
echo "Copying version file from Host to Target"
sshpass -p "epl@123" scp epl@10.144.172.149:/home/epl/LTIB/LTP_Source/home/epl/LTPbuildroot/pi2/release.txt /tmp/
if [ -e /tmp/release.txt ]; then
        currver=`cat /usr/version/release.txt`
        newver=`cat /tmp/release.txt`
        if [ $currver == $newver ]; then
                echo "Executing Application..."
        else
                echo "New Software Available"
                ./NewBinaries.sh
        fi
        else
                echo "No Upgrade"
fi
