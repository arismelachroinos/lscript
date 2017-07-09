#! /bin/bash
clear
printf '\033]2;INSTALLER\a'
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
	gnome-terminal -e "bash /root/lscript/install.sh"
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
cp /root/lscript/l /bin/lscript
cp /root/lscript/lh1 /bin/lscript
cp /root/lscript/lh2 /bin/lscript
#cp /root/lscript/lh21 /bin/lscript
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
#------------------
#~ sleep 2
#~ echo -e "Lscript requires many tools to be installed"
#~ sleep 2
#~ echo -e "This usually takes about 20-30 minutes, but you will be fully loaded with many awesome tools that you can launch from Lscript."
#~ sleep 3
#~ echo -e "Install all tools now or later in lscript menu?(\e[1;33mn\e[0m/\e[1;33ml\e[0m)"
#~ read NORL
#~ if [ "$NORL" = "n" ]
#~ then
#~ clear
#~ echo -e "Did you run 'apt-get update' recently?(\e[1;33my\e[0m/\e[1;33mn\e[0m)(\e[1;33mEnter\e[0m=yes): "
#~ read -e APTG
#~ if [ "$APTG" = "n" ]
#~ then
	#~ clear 
	#~ apt-get update
	#~ apt-get upgrade
#~ else
	#~ echo -e "Awesome! Let's start..."
	#~ sleep 2
#~ fi
#~ clear
#~ echo -e "Press \e[1;33many key\e[0m to start..."
#~ read -e -n 1 -r
	#~ clear
	#~ if [ ! -d "/root/TheFatRat" ]
	#~ then
		#~ echo -e "Installing TheFatRat"
		#~ echo -e "Tool by Screetsec"
		#~ cd
		#~ git clone https://github.com/Screetsec/TheFatRat.git
		#~ cd TheFatRat
		#~ chmod +x setup.sh && ./setup.sh	
	#~ else 
		#~ echo -e "TheFatRat is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ if [ ! -d "/usr/share/sslstrip" ]
	#~ then
		#~ echo -e "Installing sslstrip2"
		#~ echo -e "Tool by LeonardoNve"
		#~ cd
		#~ git clone https://github.com/byt3bl33d3r/sslstrip2
		#~ cd sslstrip2
		#~ python setup.py install
	#~ else 
		#~ echo -e "Sslstrip2 is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ if [ ! -d "/root/dns2proxy" ]
	#~ then
		#~ cd
		#~ echo -e "Installing dns2proxy"
		#~ git clone https://github.com/LeonardoNve/dns2proxy
	#~ else 
		#~ echo -e "Dns2proxy is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ echo -e "Installing pip"
	#~ cd
	#~ apt-get install python-pip
	#~ pip install --upgrade pip
	#~ sleep 1
	#~ clear
	#~ if [ ! -d "/root/airgeddon" ]
	#~ then
		#~ echo -e "Installing Airgeddon"
		#~ echo -e "Tool by v1s1t0r1sh3r3"
		#~ cd
		#~ git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
		#~ cd airgeddon
		#~ chmod +x airgeddon.sh
	#~ else 
		#~ echo -e "airgeddon is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/usr/share/KatanaFramework" ]
	#~ then
		#~ echo -e "Installing Katana framework"
		#~ echo -e "Tool by PowerScript"
		#~ cd
		#~ git clone https://github.com/PowerScript/KatanaFramework.git
		#~ cd KatanaFramework
		#~ sh dependencies
		#~ python install
	#~ else 
		#~ echo -e "Katana Framework is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/root/ezsploit" ]
	#~ then
		#~ echo -e "Installing Ezsploit"
		#~ echo -e "Tool by rand0m1ze"
		#~ git clone https://github.com/rand0m1ze/ezsploit.git
		#~ cd ezsploit/
		#~ chmod +x ezsploit.sh
	#~ else 
		#~ echo -e "Ezsploit is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ if [ ! -d "/usr/share/doc/mdk3" ]
	#~ then
		#~ echo -e "Installing Mdk3-master"
		#~ echo -e "Tool by Musket Developer"
		#~ cd
		#~ git clone https://github.com/wi-fi-analyzer/mdk3-master.git
		#~ cd /root/mdk3-master
		#~ make
		#~ make install
	#~ else 
		#~ echo -e "Mdk3-master is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ if [ ! -d "/root/xerxes" ]
	#~ then
		#~ echo -e "Installing Xerxes"
		#~ echo -e "Tool by zanyarjamal"
		#~ cd
		#~ git clone https://github.com/zanyarjamal/xerxes
		#~ cd xerxes
		#~ gcc xerxes.c -o xerxes
	#~ else 
		#~ echo -e "Xerxes is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/etc/init.d/anonym8" ]
	#~ then
		#~ echo -e "Installing Anonym8"
		#~ echo -e "Tool by HiroshiManRise"
		#~ git clone https://github.com/HiroshiManRise/anonym8.git
		#~ cd anonym8
		#~ chmod +x INSTALL.sh
		#~ ./INSTALL
		#~ sleep 1
	#~ else 
		#~ echo -e "Anonym8 is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ cd
	#~ echo -e "Installing Angry IP Scanner"
	#~ echo -e "Tool by Anton Keks"
	#~ if [ -d "/usr/lib/ipscan" ]
	#~ then
		#~ echo -e "Removing old file"
		#~ sleep 2
		#~ rm /root/ipscan_*
	#~ fi
	#~ echo -e "Downloading angryipscanner"
	#~ sleep 2
	#~ wget https://github.com/angryip/ipscan/releases/download/3.5.1/ipscan_3.5.1_amd64.deb
	#~ echo -e "Installing..."
	#~ dpkg -i ipscan_*
	#~ echo -e "Done"
	#~ sleep 1
	#~ if [ ! -f "/usr/bin/anonsurf" ]
	#~ then
		#~ cd
		#~ echo -e "Installing Anonsurf"
		#~ echo -e "Tool by Und3rf10w"
		#~ git clone https://github.com/Und3rf10w/kali-anonsurf.git
		#~ cd kali-anonsurf
		#~ chmod +x installer.sh
		#~ ./installer.sh
		#~ sleep 1
	#~ else 
		#~ echo -e "Anonsurf is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ cd
	#~ if [ ! -d "/root/fluxion" ]
	#~ then
		#~ echo -e "Installing fluxion"
		#~ echo -e "Tool by Deltaxflux"
		#~ sleep 1
		#~ cd
		#~ wget https://fluxion.tk/fluxion-unstable.zip
		#~ apt-get install unzip
		#~ clear
		#~ unzip /root/fluxion*.zip -d /root
		#~ cd /root/fluxion/install
		#~ chmod +x install.sh
		#~ ./install.sh
	#~ else
		#~ echo -e "Fluxion is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ echo -e "Installing websploit"
	#~ echo -e "Tool by 0x0ptim0us (Fardin Allahverdinazhand)"
	#~ if [ ! -d "/usr/share/websploit" ]
	#~ then
		#~ apt-get install websploit
	#~ else
		#~ echo -e "Websploit is already installed..."
		#~ sleep 1
		#~ echo -e "Skipping..."
	#~ fi
		#~ clear
	#~ if [ ! -d "/root/The-Eye" ]
	#~ then
		#~ echo -e "Installing The Eye"
		#~ echo -e "Tool by EgeBalci"
		#~ sleep 1
		#~ cd
		#~ git clone https://github.com/EgeBalci/The-Eye.git
		#~ cd The-Eye
		#~ chmod +x TheEye
	#~ else 
		#~ echo -e "The Eye is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ cd
	#~ if [ ! -d "/usr/share/ghost-phisher" ]
	#~ then
		#~ echo -e "Installing Ghost-Phisher"
		#~ echo -e "Tool by Savio-code"
		#~ sleep 1
		#~ cd
		#~ git clone https://github.com/savio-code/ghost-phisher.git
		#~ sleep 1
		#~ chmod +x /root/ghost-phisher/Ghost-Phisher/ghost.py
	#~ else 
		#~ echo -e "Ghost Phisher is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ cd
	#~ echo -e "Installing WifiTe"
	#~ echo -e "Tool by derv82"
	#~ sleep 1
	#~ apt-get install wifite
	#~ sleep 1
	#~ clear
	#~ cd
	#~ if [ ! -d "/root/wifiphisher" ]
	#~ then
		#~ echo -e "Installing Wifiphisher"
		#~ echo -e "Tool idea by Dan McInerney"
		#~ sleep 1
		#~ git clone https://github.com/wifiphisher/wifiphisher.git
		#~ cd wifiphisher
		#~ sudo python setup.py install
		#~ sleep 1
	#~ else 
		#~ echo -e "Wifiphisher is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ cd
	#~ if [ ! -d "/root/morpheus" ]
	#~ then
		#~ echo -e "Installing Morpheus"
		#~ echo -e "Tool by Pedro ubuntu  [ r00t-3xp10it ]"
		#~ sleep 1
		#~ cd
		#~ git clone https://github.com/r00t-3xp10it/morpheus.git
		#~ cd morpheus
		#~ chmod +x morpheus.sh
	#~ else 
		#~ echo -e "Morpheus is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ echo -e "Installing Osrframework"
	#~ echo -e "Tool by i3visio"
	#~ sleep 1
	#~ pip install osrframework
	#~ clear
	#~ if [ ! -d "/root/hakkuframework" ]
	#~ then
		#~ echo -e "Installing Hakku"
		#~ echo -e "Tool by 4shadoww"
		#~ sleep 1
		#~ cd
		#~ git clone https://github.com/4shadoww/hakkuframework.git
		#~ cd hakkuframework
		#~ chmod +x hakku
		#~ chmod +x install
	#~ else 
		#~ echo -e "Hakku Framework is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/root/Trity" ]
	#~ then
		#~ echo -e "Installing Trity"
		#~ echo -e "Tool by Toxic-ig"
		#~ sleep 1
		#~ git clone https://github.com/toxic-ig/Trity.git
		#~ cd Trity
		#~ sudo python install.py
	#~ else 
		#~ echo -e "Trity is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/root/cupp" ]
	#~ then
		#~ echo -e "Installing Cupp"
		#~ echo -e "Tool by Muris Kurgas"
		#~ sleep 1
		#~ cd
		#~ git clone https://github.com/Mebus/cupp.git
		#~ cd cupp
		#~ chmod +x cupp.py
	#~ else 
		#~ echo -e "Cupp is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/root/Dracnmap" ]
	#~ then
		#~ echo -e "Installing Dracnmap"
		#~ echo -e "Tool by Edo -maland-"
		#~ cd
		#~ git clone https://github.com/Screetsec/Dracnmap.git
		#~ cd Dracnmap
		#~ chmod +x Dracnmap.sh
	#~ else 
		#~ echo -e "Dracnmap is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/usr/share/fern-wifi-cracker" ]
	#~ then
		#~ echo -e "Installing Fern"
		#~ echo -e "Tool by Savio-code"
		#~ sleep 1
		#~ cd 
		#~ svn checkout http://github.com/savio-code/fern-wifi-cracker/trunk/Fern-Wifi-Cracker/
		#~ cd Fern-Wifi-Cracker
		#~ chmod +x execute.py
	#~ else 
		#~ echo -e "Fern is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/root/kickthemout" ]
	#~ then
		#~ echo -e "Installing Kichthemout"
		#~ echo -e "Tool by Nikolaos Kamarinakis & David Schütz"
		#~ sleep 2
		#~ apt-get install nmap
		#~ git clone https://github.com/k4m4/kickthemout.git
		#~ cd kickthemout/
		#~ sudo python -m pip install -r requirements.txt
	#~ else 
		#~ echo -e "Kickthemout is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/root/BeeLogger" ]
	#~ then
		#~ echo -e "Installing BeeLogger"
		#~ echo -e "Tool by Alisson Moretto - 4w4k3"
		#~ cd
		#~ git clone https://github.com/4w4k3/BeeLogger.git
		#~ cd BeeLogger
		#~ chmod +x install.sh
		#~ ./install.sh
	#~ else 
		#~ echo -e "BeeLogger is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ apt-get install python-pip
	#~ apt-get install php-curl
	#~ gem install pcaprub
	#~ gem install packetfu
	#~ clear
	#~ if [ ! -d "/root/pupy" ]
	#~ then
		#~ echo -e "Installing Pupy"
		#~ echo -e "Tool by n1nj4sec"
		#~ cd
		#~ git clone https://github.com/n1nj4sec/pupy.git
		#~ cd pupy
		#~ git submodule init
		#~ git submodule update
		#~ pip install -r pupy/requirements.txt
	#~ else 
		#~ echo -e "Pupy is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ if [ ! -d "/root/WiFi-autopwner" ]
	#~ then
		#~ echo -e "Installing WiFi-autopwner"
		#~ echo -e "Tool by Mi-Al"
		#~ cd
		#~ git clone https://github.com/Mi-Al/WiFi-autopwner
	#~ else 
		#~ echo -e "WiFi-autopwner is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ clear
	#~ if [ ! -d "/root/bully" ]
	#~ then
		#~ echo -e "Installing Bully"
		#~ echo -e "Tool by Aanarchyy"
		#~ cd
		#~ git clone https://github.com/aanarchyy/bully
		#~ cd bully
		#~ cd src
		#~ make
		#~ sudo make install
	#~ else 
		#~ echo -e "Bully is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ apt-get install	mono-complete
	#~ if [ ! -d "/root/zirikatu" ]
	#~ then
		#~ echo -e "Installing Zirikatu"
		#~ echo -e "Tool by pasahitz"
		#~ cd
		#~ git clone https://github.com/pasahitz/zirikatu
		#~ cd zirikatu
		#~ chmod +x zirikatu.sh
	#~ else 
		#~ echo -e "Zirikatu is already installed..."
		#~ sleep 1 
		#~ echo -e ""
		#~ echo -e "Skipping..."
	#~ fi
	#~ cd
	#~ clear
	#~ echo -e "Downloading is finished."
	#~ sleep 2
#~ fi
clear
echo -e "DONEEEE"
sleep 1
clear
echo -e "Just open a NEW terminal and type 'l'"
echo -e ""
sleep 2
echo -e "Ok, ok..."
sleep 1
echo -e "I know you are lazy. I will do it for you..."
sleep 3
gnome-terminal -e l
sleep 2
kill -9 $PPID
