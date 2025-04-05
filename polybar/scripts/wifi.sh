#!/bin/bash

networks=$(nmcli -t -f SSID,SECURITY dev wifi | awk -F: '{print $1}')
chosen_network=$(echo "$networks" | rofi -dmenu -p "Select Wi-Fi:")
if [[ -n "$chosen_network" ]]; then
    nmcli dev wifi connect "$chosen_network"
fi

