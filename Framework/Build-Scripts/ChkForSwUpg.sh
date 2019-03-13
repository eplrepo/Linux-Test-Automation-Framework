#!/bin/sh
echo "Configuring Board IP....."
ifconfig eth0
echo "Copying version file from Host to Target..."
sshpass -p "epl@123" scp epl@10.144.172.148:/home/epl/pi2-shared/release.txt /tmp/
if [ -e /tmp/release.txt ]; then
        currver=`cat /usr/version/release.txt`
        newver=`cat /tmp/release.txt`
        if [ $currver == $newver ]; then
                echo "Running Driver Test Framework..."
        else
                echo "New Software Available..."
                ./NewBinaries.sh
        fi
        else
                echo "No Upgrade"
fi
