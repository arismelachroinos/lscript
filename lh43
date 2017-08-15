#! /bin/bash
#############DEFAULTS###############
#setting yellow-start 
YS="\e[1;33m"
#setting color-end
CE="\e[0m"
#setting red-start
RS="\e[1;31m"
#setting frequent stings
YNYES="("$YS"y"$CE"/"$YS"n"$CE")("$YS"Enter"$CE"=yes)"
YNNO="("$YS"y"$CE"/"$YS"n"$CE")("$YS"Enter"$CE"=no)"
YNONLY="("$YS"y"$CE"/"$YS"n"$CE")"
PAKT="Press "$YS"any key$CE to"
PAKTC="Press "$YS"any key$CE to continue..."
PAKTGB="Press "$YS"any key$CE to go back..."

####################################
printf '\033]2;PACKET INJECTION\a'
WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
while true
do
	echo -e "----------------------"$RS"Packet injection"$CE"-----------------------"
	echo -e "You need to do the Fake-authentication first!(on the other terminal)"
	if [[ "$FIRSTT" = "1" ]]
	then
		aireplay-ng -3 -b $WEPB -h $MYMAC $WLANNM
	else
		echo -e "$PAKT start fake authentication..."
		read
		echo -e "Getting you MAC...."
		sleep 1
		MYMAC=$(ifconfig $WLANNM | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
		echo -e "Your MAC is $MYMAC"
		sleep 1
		echo -e "Starting packet injection..."
		sleep 1
		FIRSTT="1"
		aireplay-ng -3 -b $WEPB -h $MYMAC $WLANNM
	fi
	echo -e "Inject packets again?"$YNYES": "
	read REF
	if [[ "$REF" = "n" ]]
	then
		exit
	else
		clear
		continue
	fi
done
