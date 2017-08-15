#! /bin/bash
clear
printf '\033]2;INSTALLER\a'
#~ echo -e "\e[1;33m 1\e[0m) KALI"
#~ echo -e "\e[1;33m 2\e[0m) UBUNTU"
#~ echo -e "Choose your OS: "
#~ read OS
echo -e "Press \e[1;33many key\e[0m to install the script..."
read -n 1
clear
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ $DIR != "/root/lscript" ]]
then
	echo -e "You didn't follow the github's simple install instructions.I will try to do it for you..."
	sleep 4
	if [ -d /root/lscript ]
	then
		rm -r /root/lscript
	fi
	mkdir /root/lscript
	cp -r "$DIR"/* /root/lscript
	chmod +x /root/lscript/install.sh
if [ "$OS" = 2 ]
then
	gnome-terminal -e "sudo bash /root/lscript/install.sh"
else
	gnome-terminal -e "bash /root/lscript/install.sh"
fi
	sleep 2
	kill -9 $PPID
	exit
fi
echo -e "Installing lscript..."
sleep 1
echo -e "Fixing permissions"
sleep 2
chmod +x /root/lscript/lh1
chmod +x /root/lscript/lh2
chmod +x /root/lscript/lh3
#chmod +x /root/lscript/lh21
chmod +x /root/lscript/lh31
chmod +x /root/lscript/l
chmod +x /root/lscript/lh4
chmod +x /root/lscript/lh41
chmod +x /root/lscript/lh42
chmod +x /root/lscript/lh43
chmod +x /root/lscript/ls/l131.sh
chmod +x /root/lscript/ls/l132.sh
chmod +x /root/lscript/ls/l133.sh
chmod +x /root/lscript/uninstall.sh
clear
echo -e "Copying script to /bin/lscript"
sleep 1
mkdir /bin/lscript
cd /root/lscript
if [ $OS = 2 ]
then
	cp /root/lscript/l /bin/lscript/u
	echo -e "I am an Ubuntu user" > /root/lscript/ubuntu.txt
else
	cp /root/lscript/l /bin/lscript
fi
cp /root/lscript/lh1 /bin/lscript
cp /root/lscript/lh2 /bin/lscript
cp /root/lscript/lh3 /bin/lscript
cp /root/lscript/lh31 /bin/lscript
cp /root/lscript/lh4 /bin/lscript
cp /root/lscript/lh41 /bin/lscript
cp /root/lscript/lh42 /bin/lscript
cp /root/lscript/lh43 /bin/lscript
clear
if [ ! -d /root/handshakes ]
then
	mkdir /root/handshakes
	echo -e "Made /root/handshake directory"
else
	echo -e "/root/handshakes directory detected.Good."
fi
if [ ! -d /root/wordlists ]
then
	mkdir /root/wordlists
	echo -e "Made /root/wordlists directory"
else
	echo -e "/root/wordlists directory detected.Good."
fi
while true
do
clear
echo -e "Are you \e[1;33mu\e[0mpdating or \e[1;33mi\e[0mnstalling the script?(\e[1;33mu\e[0m/\e[1;33mi\e[0m): "
echo -e "Only use 'i' for the first time."
read UORI
if [ "$UORI" = "u" ]
then 
	clear
	echo -e "Type 'changelog' to see what's new on this version"
	sleep 3
	break
elif [ "$UORI" = "i" ]
then
	clear
	BASHCHECK=$(cat ~/.bashrc | grep "bin/lscript")
	if [[ $BASHCHECK != "" ]]
	then
		echo -e "I SAID USE i ONLY ONE TIME..........."
		sleep 3
	fi
	echo -e "Adding lscript to PATH so you can access it from anywhere"
	sleep 1
	export PATH=/bin/lscript:$PATH
	sleep 1
	echo "export PATH=/bin/lscript:$PATH" >> ~/.bashrc
	sleep 1
	clear
	break
fi
done
clear
if [ $OS = 2 ]
then
	sudo apt-get install leafpad
	sudo apt-get install aircrack-ng
	sudo apt-get install git
	sudo apt-get install xterm
	sudo apt-get install gnome-terminal
	sudo apt-get install net-tools
fi
echo -e "DONE"
sleep 1
clear
if [ $OS = 2 ]
then

	echo -e "Open a NEW terminal and type 'u' to launch the script"
	sleep  4
	gnome-terminal -e u
else
	echo -e "Open a NEW terminal and type 'l' to launch the script"
	sleep  4
	gnome-terminal -e l
fi
sleep 2
kill -9 $PPID
