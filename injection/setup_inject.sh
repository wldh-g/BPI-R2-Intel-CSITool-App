#!/usr/bin/sudo /bin/bash
modprobe -r mac80211 cfg80211
modprobe iwlwifi debug=0x40000
ifconfig wlp1s0 2>/dev/null 1>/dev/null
while [ $? -ne 0 ]
do
	        ifconfig wlp1s0 2>/dev/null 1>/dev/null
done
iw dev wlp1s0 interface add mon0 type monitor
ifconfig mon0 up
iw mon0 set channel $1 $2
#ifconfig mon0 up
