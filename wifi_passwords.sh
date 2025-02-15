#!/bin/bash

# Loop through all saved Wi-Fi connections
for conn in $(nmcli -g NAME connection show); do
    # Get the password for each connection
    password=$(nmcli -s -g 802-11-wireless-security.psk connection show "$conn")

    # Print only if a password is found
    if [ ! -z "$password" ]; then
        echo "Wi-Fi Network: $conn"
        echo "Password: $password"
        echo "------------------------"
    fi
done
