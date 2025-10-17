#!/bin/sh
echo 1 > /sys/class/rfkill/rfkill0/state
#stop btadapterd INDEX=0
sleep 0.3
start brcm_bt_patchrom
#start btadapterd INDEX=0 HCI=0
