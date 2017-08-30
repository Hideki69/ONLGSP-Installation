#!/bin/bash -e
clear
echo "============================================"
echo "   ____  _   _ _      _____  _____ _____  "
echo "  / __ \| \ | | |    / ____|/ ____|  __ \ "
echo " | |  | |  \| | |   | |  __| (___ | |__) |"
echo " | |  | |     | |   | | |_ |\___ \|  ___/ "
echo " | |__| | |\  | |___| |__| |____) | |     "
echo "  \____/|_| \_|______\_____|_____/|_|     "
echo "============================================"  
echo " "
echo "============================================"
echo "Open Noob Linux Game Server Provider"
echo "ONLGSP Install Script"
echo "============================================"
echo " "
echo "============================================"
echo "Create new user ONLGSP"
echo "============================================"
echo " "
#echo "Username : "
#read -e username
#echo "Password : "
#read -e password

echo "============================================"
echo "run install? (y/n)"
echo "============================================"
read -e run
if [ "$run" == n ] ; then
exit
else

echo "============================================"
echo "Update the apt source liste"
echo "============================================"
echo " "

sudo apt-get update 

echo "============================================"
echo "Now installing ONLGSP for you."
echo "Let's Go !! "
echo "============================================"
echo " "

echo "============================================"
echo "Create new user ONLGSP on this server "
echo "============================================"
echo " "
adduser ONLGSP --force-badname
adduser ONLGSP sudo 
adduser ONLGSP www-data

echo "============================================"
echo "Installing Linux Dependency for Game Server"
echo "============================================"
echo " "
#Voici les dependance dont ONLGSP a besoin pour les serveur de jeux : 



sudo dpkg --add-architecture i386; sudo apt-get update;sudo apt-get install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 libncurses5:i386 lib32tinfo5 lib32tinfo5 libcurl4-gnutls-dev:i386 zlib1g:i386 libldap-2.4-2:i386 lib32tinfo5 lib32tinfo5 speex:i386 libtbb2 default-jre telnet expect libxrandr2:i386 libglu1-mesa:i386 libxtst6:i386 libusb-1.0-0:i386 libopenal1:i386 libpulse0:i386 libdbus-glib-1-2:i386 libnm-glib4:i386 libssl1.0.0:i386 libcurl4-gnutls-dev:i386 libsdl1.2debian libstdc++5:i386 python-software-properties python3-software-properties software-properties-common

export LANG=C.UTF-8

sudo add-apt-repository ppa:ondrej/php

sudo apt-get update 

echo "============================================"
echo "Installing Linux Apache MariaDB PHP"
echo "============================================"
echo " "

sudo apt install apache2 php7.1 mariadb-server libapache2-mod-php php-mysql
rm /var/www/html/index.html


echo "============================================"
echo "install GitHubs"
echo "============================================"
echo " "


sudo apt-get install git

echo "============================================"
echo "Download and install ONLGSP from GitHubs"
echo "============================================"
echo " "



git clone https://github.com/Hideki69/ONLGSP.git
/bin/cp -R /root/ONLGSP-Installation-master/ONLGSP/* /var/www/html




echo "==============================================="
echo "Import SQL for MariaDB"
echo "==============================================="
echo " "

/bin/cp /root/ONLGSP-Installation-master/ONLGSP/onlgsp.sql /root


echo "CREATE DATABASE onlgsp" | mysql -u root


mysql onlgsp < onlgsp.sql

echo "==============================================="
echo "Change password for Mariadb"
echo "==============================================="
echo " "

echo "============================================"
echo "Download and install Composer for ONLGSP"
echo "============================================"
echo " "

apt-get install composer

cd /var/www/html

composer install

echo "==============================================="
echo "Download Linux Game Server Manager  for ONLGSP"
echo "==============================================="
echo " "


cp /root/ONLGSP-Installation-master/linuxgsm.sh /home/ONLGSP

su ONLGSP

sudo chown ONLGSP /home/ONLGSP/linuxgsm.sh

sudo -u ONLGSP chmod a+x /home/ONLGSP/linuxgsm.sh

sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh arma3server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh sdtdserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh arkserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh boserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh bf1942server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh bmdmserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh bsserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh bb2server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh codserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh cod2server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh cod4server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh coduoserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh codwawserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ccserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh csserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh csczserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh csgoserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh cssserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh dodserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh dodsserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh doiserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh dmcserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh dstserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh dabserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh emserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh fctrserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh fofserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh gmodserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh gesserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh hl2dmserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh hldmsserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh hldmserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh hwserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh insserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh jc2server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh kfserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh l4dserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh l4d2server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh mcserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh mtaserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh mumbleserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ns2server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh nmrihserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ns2cserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh opforserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh pvkiiserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh pcserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh pzserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh q2server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh q3server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh qlserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh qwserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh roserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ricochetserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh rustserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ss3server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh sbserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh svenserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh tf2server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh fcserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ts3server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh twserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh terrariaserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh tuserver
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ut2k4server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ut3server
sudo -u ONLGSP bash /home/ONLGSP/linuxgsm.sh ut99server 





echo "============================================"
echo "Installation is complete !!! "
echo "Thanks you to use our Panel <3"
echo "============================================"
echo " "
echo "============================================"
echo "   ____  _   _ _      _____  _____ _____  "
echo "  / __ \| \ | | |    / ____|/ ____|  __ \ "
echo " | |  | |  \| | |   | |  __| (___ | |__) |"
echo " | |  | |     | |   | | |_ |\___ \|  ___/ "
echo " | |__| | |\  | |___| |__| |____) | |     "
echo "  \____/|_| \_|______\_____|_____/|_|     "
echo "============================================"  
echo " "
fi
exit
