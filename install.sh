#! /bin/bash
echo -e "Installing all the tools needed for LAZY script..."
echo -e "(You should be a root user)"
sleep 2
echo -e "Did you run 'apt-get update' recently?(\e[1;33my\e[0m/\e[1;33mn\e[0m)(\e[1;33mEnter\e[0m=yes): "
read -e APTG
if [ "$APTG" = "n" ]
then
	echo -e "It's better to run it yourself.Come back when you do."
	sleep 3
	exit
else
	echo -e "Awesome! Let's start..."
	sleep 2
fi
clear
echo -e "All scripts will be installed on /root/ directory(needed for the script)"
echo -e "Press \e[1;33menter\e[0m to start..."
read ENT
if [ -z $ENT ]
then
	clear
	echo -e "Installing Airgeddon"
	echo -e "Tool by v1s1t0r1sh3r3"
	cd
	git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
	cd airgeddon
	chmod +x airgeddon.sh
	cd
	clear
	echo -e "Installing Katana framework"
	echo -e "Tool by PowerScript"
	cd
	git clone https://github.com/PowerScript/KatanaFramework.git
	cd KatanaFramework
	sh dependencies
	python install
	cd
	clear
	echo -e "Installing Ezsploit"
	echo -e "Tool by rand0m1ze"
	git clone https://github.com/rand0m1ze/ezsploit.git
	cd ezsploit/
	chmod +x ezsploit.sh
	clear
	echo -e "Installing mdk3-master"
	echo -e "Tool by Musket Developer"
	cd
	git clone https://github.com/wi-fi-analyzer/mdk3-master.git
	cd /root/mdk3-master
	make
	make install
	#~ echo -e "Installing shARP"
	#~ echo -e "Tool by europa502"
	#~ cd
	#~ git clone https://github.com/europa502/shARP.git
	#~ cd /root/shARP
	#~ chmod +x shARP.sh
	#~ clear
	echo -e "Installing Xerxes"
	echo -e "Tool by zanyarjamal"
	cd
	git clone https://github.com/zanyarjamal/xerxes
	cd xerxes
	gcc xerxes.c -o xerxes
	cd
	clear
	echo -e "Installing anonym8"
	echo -e "Tool by HiroshiManRise"
	git clone https://github.com/HiroshiManRise/anonym8.git
	cd anonym8
	chmod +x INSTALL.sh
	./INSTALL
	sleep 1
	clear
	cd
	echo -e "Installing Torghost"
	echo -e "Tool by SusmithHCK"
	git clone https://github.com/susmithHCK/torghost.git
	cd torghost
	chmod +x install.sh
	./install
	sleep 1
	clear
	# cd
	# echo -e "Installing Anonsurf"
	# echo -e "Tool by Und3rf10w"
	# git clone https://github.com/Und3rf10w/kali-anonsurf.git
	# cd kali-anonsurf
	# chmod +x install.sh
	# ./install
	# sleep 1
	# clear
	cd
	echo -e "Installing Fluxion"
	echo -e "Tool by Deltaxflux"
	sleep 1
	echo -e "Deltaxflux deleted the project.Do you want to download it from user disquette38 by yourown responsibility?(\e[1;33my\e[0m/\e[1;33mn\e[0m): "
	read -e FLUX
	if [ "$FLUX" = "y" ]
	then
		git clone https://github.com/disquette38/fluxion.git
		cd fluxion/install
		chmod +x install.sh
		./install.sh
		sleep 1
		clear
		cd
	else
		echo -e "Skipping Fluxion then..."
		sleep 1
		clear
	fi
	echo -e "Installing The Eye"
	echo -e "Tool by EgeBalci"
	sleep 1
	cd
	git clone https://github.com/EgeBalci/The-Eye.git
	cd The-Eye
	chmod +x TheEye
	clear
	cd
	echo -e "Installing Ghost-Phisher"
	echo -e "Tool by Savio-code"
	sleep 1
	cd
	git clone https://github.com/savio-code/ghost-phisher.git
	sleep 1
	chmod +x /root/ghost-phisher/Ghost-Phisher/ghost.py
	clear
	cd
	echo -e "Installing WifiTe"
	echo -e "Tool by derv82"
	sleep 1
	apt-get install wifite
	sleep 1
	clear
	cd
	echo -e "Installing Wifiphisher"
	echo -e "Tool idea by Dan McInerney"
	sleep 1
	git clone https://github.com/wifiphisher/wifiphisher.git
	cd wifiphisher
	sudo python setup.py install
	sleep 1
	clear
	cd
	echo -e "Installing Morpheus"
	echo -e "Tool by Pedro ubuntu  [ r00t-3xp10it ]"
	sleep 1
	cd
	git clone https://github.com/r00t-3xp10it/morpheus.git
	cd morpheus
	chmod +x morpheus.sh
	cd
	echo -e "Installing Osrframework"
	echo -e "Tool by i3visio"
	sleep 1
	pip install osrframework
	echo -e "Installing Hakku"
	echo -e "Tool by 4shadoww"
	sleep 1
	cd
	git clone https://github.com/4shadoww/hakkuframework.git
	cd hakkuframework
	chmod +x hakku
	chmod +x install
	cd
	echo -e "Installing Trity"
	echo -e "Tool by Toxic-ig"
	sleep 1
	git clone https://github.com/toxic-ig/Trity.git
	cd Trity
	sudo python install.py
	cd
	echo -e "Installing Cupp"
	echo -e "Tool by Muris Kurgas"
	sleep 1
	cd
	git clone https://github.com/Mebus/cupp.git
	cd cupp
	chmod +x cupp.py
	#~ python cupp.py
	cd
	echo -e "Installing Dracnmap"
	echo -e "Tool by Edo -maland-"
	cd
	git clone https://github.com/Screetsec/Dracnmap.git
	cd Dracnmap
	chmod +x Dracnmap.sh
	cd
	echo -e "Installing Fern"
	echo -e "Tool by Savio-code"
	sleep 1
	cd 
	svn checkout http://github.com/savio-code/fern-wifi-cracker/trunk/Fern-Wifi-Cracker/
	cd Fern-Wifi-Cracker
	chmod +x execute.py
	cd

	echo -e "Installing Kichthemout"
	echo -e "Tool by Nikolaos Kamarinakis & David Schütz"
	sleep 2
	apt-get install nmap
	git clone https://github.com/k4m4/kickthemout.git
	cd kickthemout/
	sudo python -m pip install -r requirements.txt
	cd
	echo -e "Installing BeeLogger"
	echo -e "Tool by Alisson Moretto - 4w4k3"
	cd
	git clone https://github.com/4w4k3/BeeLogger.git
	cd cd BeeLogger
	chmod +x install.sh
	./install.sh
	cd
	echo -e "Downloading is finished."
	sleep 2
else
	echo -e "Ok, bye..."
	sleep 1
	exit
fi
clear
echo -e "Fixing permissions"
sleep 2
chmod +x /root/lscript/lh1
chmod +x /root/lscript/lh2
chmod +x /root/lscript/lh3
chmod +x /root/lscript/lh31
chmod +x /root/lscript/l
chmod +x /root/lscript/lh4
chmod +x /root/lscript/lh41
chmod +x /root/lscript/lh42
chmod +x /root/lscript/lh43
chmod +x /root/lscript/uninstall.sh
clear
echo -e "Copying script to /bin/lscript"
sleep 1
mkdir /bin/lscript
cd /root/lscript
cp l /bin/lscript
cp lh1 /bin/lscript
cp lh2 /bin/lscript
cp lh3 /bin/lscript
cp lh31 /bin/lscript
cp lh4 /bin/lscript
cp lh41 /bin/lscript
cp lh42 /bin/lscript
cp lh43 /bin/lscript
clear
echo -e "Are you updating or installing the script?(\e[1;33mu\e[0m/\e[1;33mi\e[0m): "
read UORI
if [ "$UORI" = "u" ]
then 
	clear
elif [ "$UORI" = "i" ]
then
	clear
	echo -e "Adding lscript to PATH so you can access it from anywhere"
	sleep 3
	export PATH=/bin/lscript:$PATH
	echo "export PATH=/bin/lscript:$PATH" >> ~/.bashrc
	sleep 2
	clear
fi
echo -e "DONEEEE"
sleep 1
echo -e "Just open a terminal and type "l""
sleep 3
l
