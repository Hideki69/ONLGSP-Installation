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
echo "Create new user for ONLGSP"
echo "============================================"
echo " "
echo "Username : "
read -e username

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
echo "Create new user on this server "
echo "============================================"
echo " "
adduser $username --force-badname
adduser $username sudo 
adduser $username www-data

echo "============================================"
echo "Installing Linux Dependency for Game Server"
echo "============================================"
echo " "
#Voici les dependance dont ONLGSP a besoin pour les serveur de jeux : 

sudo dpkg --add-architecture i386; sudo apt-get update;sudo apt-get install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 libncurses5:i386 lib32tinfo5 lib32tinfo5 libcurl4-gnutls-dev:i386 zlib1g:i386 libldap-2.4-2:i386 lib32tinfo5 lib32tinfo5 speex:i386 libtbb2 default-jre telnet expect libxrandr2:i386 libglu1-mesa:i386 libxtst6:i386 libusb-1.0-0:i386 libopenal1:i386 libpulse0:i386 libdbus-glib-1-2:i386 libnm-glib4:i386 libssl1.0.0:i386 libcurl4-gnutls-dev:i386 libsdl1.2debian libstdc++5:i386 

echo "============================================"
echo "Installing Linux Apache MariaDB PHP"
echo "============================================"
echo " "

sudo apt install apache2 php mariadb-server libapache2-mod-php php-mysql
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
/bin/cp -R /root/ONLGSP/* /var/www/html



echo "============================================"
echo "Download and install Composer for ONLGSP"
echo "============================================"
echo " "

apt-get install composer

cd /var/www/html

composer install



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
