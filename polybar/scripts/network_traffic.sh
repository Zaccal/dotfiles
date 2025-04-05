#!/bin/bash

# Get network interface (adjust if necessary)
INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n 1)

# Get current RX (Download) and TX (Upload) bytes
RX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
RX_NEXT=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_NEXT=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# Calculate speed (Bytes to Kilobytes per second)
RX_SPEED=$(( ($RX_NEXT - $RX_PREV) / 1024 ))
TX_SPEED=$(( ($TX_NEXT - $TX_PREV) / 1024 ))

# Output formatted string
echo " ${RX_SPEED}KB/s  ${TX_SPEED}KB/s"

