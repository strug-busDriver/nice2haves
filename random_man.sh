#!/bin/bash

if [ $# -lt 1 ]; then
        read -p "Which interface do you want to prepare? (ex. wlan0): " INT
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

ip link set dev $INT down
iw dev $INT set type managed
macchanger -r $INT
ip link set dev $INT up

echo [-] --------------------------------------------------------------------
echo [+] $INT
echo [+] $(iw dev $INT info | grep -o --color=always "type.\{1,10\}")
echo [-] --------------------------------------------------------------------
