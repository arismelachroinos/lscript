#! /bin/bash
WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
printf '\033]2;CAPTURING IVs\a'
echo -e "Leave me opened."
sleep 1
airodump-ng --bssid $WEPB -c $WEPC -w /root/handshakes/WEP/$WEPF $WLANNM
