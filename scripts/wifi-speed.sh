#!/bin/bash

iface=$(ip route | awk '/default/ {print $5; exit}')

rx1=$(<"/sys/class/net/$iface/statistics/rx_bytes")
tx1=$(<"/sys/class/net/$iface/statistics/tx_bytes")

sleep 1

rx2=$(<"/sys/class/net/$iface/statistics/rx_bytes")
tx2=$(<"/sys/class/net/$iface/statistics/tx_bytes")

rx=$((rx2-rx1))
tx=$((tx2-tx1))

format_speed() {
    local bytes=$1

    if (( bytes >= 1048576 )); then
        printf "%.1fm" "$(awk "begin {print $bytes/1048576}")"
    elif (( bytes >= 1024 )); then
        printf "%.0fk" "$(awk "begin {print $bytes/1024}")"
    else
        printf "%db" "$bytes"
    fi
}

echo "⮟$(format_speed "$rx") ⮝$(format_speed "$tx")"
