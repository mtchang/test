#!/bin/bash
# usage: ./test_appserv.sh 111.10.1.1
# by mtchang.tw@gmail.com 
IP=$1
echo "$IP checking...."
echo $IP > test_appserv.log

echo "wget --tries=1 --connect-timeout=3 http://${IP}/phpMyAdmin/scripts/  -O ${IP}.txt 2> ${IP}.txt" | bash 
if [ "$?" == "0" ]; then
        echo "$IP phpMyAdmin/scripts/ found"
fi

grep --color 'setup.php' ${IP}.txt >> test_appserv.log
if [ "$?" == "0" ]; then
	echo "$IP setup.php found"
fi

grep --color '(Win32)' ${IP}.txt  >> test_appserv.log
if [ "$?" == "0" ]; then
        echo "$IP (Win32) found"
fi
