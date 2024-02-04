#!/bin/sh
sleep 0.5
/bin/ifconfig wlan0 up
echo 1 > /sys/class/rfkill/rfkill0/state
sleep 0.5
start brcm_bt_patchrom
