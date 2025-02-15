#!/bin/bash

if [ $# -lt 1 ]; then
        read -p "Which interface do you want to put in managed mode? (ex. wlan0): " INT
else
        INT=$1
fi

# verify interface exists
if [ ! -d "/sys/class/net/$INT" ]
then
        echo
        echo "[!] Interface $INT doesn't exist" 
        echo
        exit 0
fi


# ifconfig $INT down
# iwconfig $INT mode managed
# ifconfig $INT up
ip link set dev $INT down
iw dev $INT set type managed
ip link set dev $INT up
echo [-] --------------------------------------------------------------------
echo [+] $INT
echo [+] $(iwconfig $INT | grep -o --color=always "Mode.\{1,10\}" )
echo [-] --------------------------------------------------------------------
