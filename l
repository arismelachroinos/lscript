#! /bin/bash
function interface_selection
{
echo -e " 1) Wlan0"
echo -e " 2) Wlan0mon"
echo -e " 3) Eth0"
read -e MYINT
if [ "$MYINT" = "2" ]
then
	MYINT="wlan0mon"
elif [ "$MYINT" = "1" ]
then
	MYINT="wlan0"
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
if [ -f "/root/lscript/IAGREE.txt" ]
then
clear
echo -e "   ////////////////////////////////////////////////////////////////"
echo -e "  //                    The LAZY script v0.2                    //"
echo -e " //                   by ARIS MELACHROINOS                     //"
echo -e "////////////////////////////////////////////////////////////////"
echo -e "if) Ifconfig"
echo -e " 1) Enable wlan0                      d1) Disable wlan0"
echo -e " 2) Enable wlan0mon                   d2) Disable wlan0mon"
echo -e " 3) Change MAC                        d3) Restore original MAC "
echo -e " 4) Enable torghost(BROKEN TOOL)      d4) Disable torghost"
echo -e " 5) Enable anonym8                    d5) Disable anonym8"
echo -e " 6) Status of anonym8                 r6) Restart anonym8"
echo -e " 7) View your Public IP"
echo -e " 8) View your MAC"
echo -e " 9) TOOLS"
echo -e "10) Handshake       (WPA-WPA2)"
echo -e "11) Find WPS pin    (WPA-WPA2)"
echo -e "12) WEP hacking     (WEP)"
echo -e "start) 1 2 3"
echo -e "stop) d2 d3"
echo -e "update"
echo -e "0) EXIT"
echo "Choose: "
read -e YORNAA
clear
	if [ "$YORNAA" = "0" ]
	then
		exit
	elif [ "$YORNAA" = "9" ]
	then
		echo -e "------------------------------TOOLS------------------------------"
		echo -e " 1) Wifi tools"
		echo -e " 2) Keeloggers-Remote access"
		echo -e " 00) Main menu"
		echo -e " 0) EXIT"
		echo "Choose: "
		read -e CATEG
			if [ "$CATEG" = "1" ]
			then
				clear
				echo -e "---------------------------WIFI TOOLS----------------------------"
				echo -e " 1) Fluxion            Multitool-Fake AP with pass confirmation"
				echo -e " 2) Wifite             Multitool"
				echo -e " 3) Wifiphisher        Multitool-Fake AP etc.."
				echo -e " 4) Zatacker           MITM-NMAP-Mail Spammer..(Install it manually)"
				echo -e " 5) Morpheus           ------------ULTIMATE MITM SUIT------------"
				echo -e " 6) Osrfconsole        Checks usernames-phones to platforms etc.."
				echo -e " 7) Hakku              Multitool-mail bomb-sniffs-cracks etc.."
				echo -e " 8) Trity              Multitool-locate ip-email bombs-brutforse etc.."
				echo -e " 9) Cupp               Make specific worldlists"
				echo -e "10) Dracnmap           Many scan options"
				echo -e "11) Fern               Wifi cracker GUI"
				echo -e "12) Netdiscover        IPs and MACs on your net"
				echo -e "13) KickThemOut        Kick clients out of your network"
				echo -e "14) Ghost-Phisher      Fake AP,MITM,Session hijacking etc..."
				echo -e "15) The Eye            Detects ARP poisoning DNS spoofing etc..."
				echo -e "16) ShARP              Detects who is spoofing on your network"
				echo -e "17) Mdk3-master        Tries to lock / reboot AP and more..."
				echo -e "18) Mdk3-master        Tries to reboot the AP and unlock the WPS lock"
				echo -e "00) Main menu"
				echo -e " 0) EXIT"
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
					wifiphisher
				elif [ "$APPP" = "4" ]
				then
					clear	
					cd /root/Zatacker
					./ZT.sh
					cd
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
					echo -e "Enter the name of the interface you want to defend with: "
					read -e NAMEINT
					clear	
					cd /root/shARP
					./shARP.sh -d $NAMEINT
					cd
				elif [ "$APPP" = "17" ]
				then
					clear	
					echo -e "Press any key to start scanning."
					echo -e "Press CTRL C when you find your target AP"
					read
					airodump-ng wlan0mon
					echo -e "Enter your target's BSSID: "
					read -e MDBSSID
					echo -e "Enter your target's channel: "
					read -e MDCHANN
					echo -e "Enter frames per second(etc 50): "
					read -e FPS
					clear
					xterm -e 'mdk3 wlan0mon t $MDCHANN $MDBSSID $FPS'		
				elif [ "$APPP" = "18" ]
				then
					clear	
					echo -e "Press any key to start scanning with wash."
					read
					gnome-terminal -e 'wash -i wlan0mon'
					echo -e "Enter your target's BSSID: "
					read -e MDBSSID
					echo -e "Enter your target's ESSID: "
					read -e MDESSID
					#~ echo -e "Enter your target's channel: "
					#~ read -e MDCHANN
					echo -e "Enter frames per second(etc 50): "
					read -e FPS
					clear
					xterm -e 'mdk3 wlan0mon x 0 -t $MDBSSID -n $MDESSID -s $FPS'		
				elif [ "$APPP" = "6" ]
				then
					clear	
					echo -e " 1) usufy"
					echo -e " 2) mailfy"
					echo -e " 3) searchfy"
					echo -e " 4) domainfy"
					echo -e " 5) phonefy"
					echo -e " 6) entify"
					echo -e "00) Main menu"
					echo -e " 0) EXIT"
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
				echo -e "--------------------Keyloggers-Remote access---------------------"
				echo -e " 1) BeeLogger		Generate keylogger to send to email"
				echo -e "00) Main menu"
				echo -e " 0) EXIT"
				echo -e "Choose: "
				read -e KEYLOG
				if [ "$KEYLOG" = "1" ]
				then
					cd /root/BeeLogger
					python bee.py
					cd
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
		echo -e "Enabling wlan0..."
		rfkill unblock wifi; rfkill unblock all
		ifconfig wlan0 up
		echo -e "Done."
	elif [ "$YORNAA" = "d1" ]
	then
		echo -e "Disabling wlan0..."
		rfkill unblock wifi; rfkill unblock all
		ifconfig wlan0 down
		echo -e "Done."
	elif [ "$YORNAA" = "2" ]
	then
		echo -e "Enabling wlan0mon..."
		echo -e "Killing services..."
		airmon-ng check kill
		echo -e "Done."
		echo -e "Starting monitor mode..."
		airmon-ng start wlan0
		echo -e "Done."
	elif [ "$YORNAA" = "d2" ]
	then
		echo -e "Disabling wlan0mon..."
		echo -e "Stopping monitor mode..."
		airmon-ng stop wlan0mon
		echo -e "ok..."
		echo -e "Starting network-manager service..."
		service network-manager start
		echo -e "ok..."
		echo -e "Wlan0 is probably up.Bring it down? (y/n)(Enter=no): "
		read -e YORN
		if [ "$YORN" = "y" ] 
		then
			#rfkill unblock wifi
			#rfkill unblock all
			ifconfig wlan0 down
			echo -e "Wlan0 is now down."
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
		clear
		echo -e "Okay, listen..."
		sleep 1
		echo -e "First , make sure that there is an update.This is version 0.2 ...Go to https://github.com/arismelachroinos/lscript an see on the description if the version is newer."
		echo -e "Press any key to continue..."
		read
		clear
		echo -e "I dont know if this works.So if it doesn't, to update the script just delete the /root/lscript folder from your system and then go again to https://github.com/arismelachroinos/lscript and reinstall it to get the newest one."
		sleep 5		
		echo -e ""
		echo -e "Do you still want to try to update automatically?(y/n): "
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
			echo -e "Press any key to continue..."
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
	elif [ "$YORNAA" = "if" ]
	then
		ifconfig
	elif [ "$YORNAA" = "errors" ]
	then
		#---------------------------------------------------------------------------------------------------------------------------
		echo -e "-----------------------------ERRORS------------------------------"
		echo -e " 1) Fix no audio issue"
		echo -e " 2) No output in wash"
		#~ echo -e " 2) "
		echo -e " 00) Main menu"
		echo -e " 0) EXIT"
		echo -e " Choose: "
		read ERRS
		if [ "$ERRS" = "1" ]
		then
			clear
			echo -e "Trying to get you some audio..."
			sleep 2
			clear
			echo -e "Press y if/when prompted"
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
			echo -e "Press any key to test wash"
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
		echo -e "Enabling wlan0..."
		rfkill unblock wifi; rfkill unblock all
		ifconfig wlan0 up
		echo -e "wlan0 enabled"
		echo -e "Enabling wlan0mon..."
		echo -e "Killing services..."
		airmon-ng check kill
		echo -e "Done."
		echo -e "Starting monitor mode..."
		airmon-ng start wlan0
		echo -e "Done."
		echo -e "Changing mac address of wlan0mon to a random one..."
		ifconfig wlan0mon down
		macchanger -r wlan0mon
		ifconfig wlan0mon up
		echo -e "Done."
		echo -e "SUCCESS!"
#----------
		elif [ "$YORNAA" = "stop" ]
		then
		echo -e "Changing mac address of wlan0mon to the original one..."
		ifconfig wlan0mon down
		macchanger -p wlan0mon
		ifconfig wlan0mon up
		echo -e "Disabling wlan0mon..."
		echo -e "Stopping monitor mode..."
		airmon-ng stop wlan0mon
		echo -e "ok..."
		echo -e "Starting network-manager service..."
		service network-manager start
		echo -e "ok..."
		echo -e "Wlan0 is probably down.Bring it up? (y/n)(Enter=no): "
		read -e YORN
		if [ "$YORN" = "y" ]  
		then
			#rfkill unblock wifi
			#rfkill unblock all
			ifconfig wlan0 up
			echo -e "Wlan0 is now up."
		fi
		echo -e "Changing mac address of wlan0 to the original one..."
		ifconfig wlan0 down
		macchanger -p wlan0
		ifconfig wlan0 up
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
echo -e "Choose again? (y/n)(Enter=yes): "
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
echo -e "Press enter to continue..."
read
clear
echo -e "This tool is only for educational purposes only."
sleep 2
echo -e "Use this tool only on yourown network and never without permission."
sleep 2
echo -e "I am not responsible for anything you do with this tool."
sleep 2
echo -e "Will you use this tool only on yourown network and only with yourown responsibility?(YES/NO): "
read YESORNO
if [ "$YESORNO" = "YES" ]
then 
	echo "You have agreed the terms and you use this tool with yourown responsibility." > /root/lscript/IAGREE.txt
fi
fi
