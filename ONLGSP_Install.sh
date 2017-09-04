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
adduser www-data ONLGSP
#adduser www-data sudo


echo "============================================"
echo "Installing Linux Dependency for Game Server"
echo "============================================"
echo " "
#Voici les dependance dont ONLGSP a besoin pour les serveur de jeux : 



sudo dpkg --add-architecture i386; sudo apt-get update;sudo apt-get install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 libncurses5:i386 lib32tinfo5 lib32tinfo5 libcurl4-gnutls-dev:i386 zlib1g:i386 libldap-2.4-2:i386 lib32tinfo5 lib32tinfo5 speex:i386 libtbb2 default-jre telnet expect libxrandr2:i386 libglu1-mesa:i386 libxtst6:i386 libusb-1.0-0:i386 libopenal1:i386 libpulse0:i386 libdbus-glib-1-2:i386 libnm-glib4:i386 libssl1.0.0:i386 libcurl4-gnutls-dev:i386 libsdl1.2debian libstdc++5:i386 python-software-properties python3-software-properties software-properties-common

export LANG=C.UTF-8

sudo add-apt-repository ppa:ondrej/php

apt-get update -y
apt-get upgrade -y
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mirror.jmu.edu/pub/mariadb/repo/10.1/ubuntu xenial main'
apt update -y && apt-get upgrade -y
apt-get install mariadb-server mariadb-client
echo "CREATE DATABASE ONLGSP" | mysql -u root
mysql_secure_installation
mysql -u root -p


systemctl restart mariadb.service

echo "============================================"
echo "Installing Linux Apache MariaDB PHP"
echo "============================================"
echo " "

systemctl restart mariadb.service
apt-get install apache2 
a2enmod rewrite
systemctl restart apache2
apt-get update -y && apt-get upgrade -y
sudo apt install php7.1  libapache2-mod-php php-mysql
apt-get install php7.1-mbstring php7.1-zip php7.1-mysql php7.1-xmlwriter php7.1-tokenizer php7.1-interbase php7.1-pdo-mysql php7.1 php7.1-xmlreader php7.1-opcache php7.1-json php7.1-phar php7.1-xmlrpc php7.1-mysqlnd php7.1-curl php7.1-simplexml php7.1-bz2 php7.1-imap php7.1-intl php7.1-ftp php7.1-gmagick php7.1-common php7.1-gettext php7.1-yaml php7.1-soap php7.1-calendar php7.1-fileinfo php7.1-xdebug php7.1-ssh2 php7.1-mcrypt php7.1-geoip php7.1-gd php7.1-exif php7.1-mysqli php7.1-mysql php7.1-xml php7.1-apcu
systemctl restart apache2
apt-get install phpmyadmin



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

/bin/cp /root/ONLGSP-Installation-master/ONLGSP/onlgsp.sql /root/ONLGSP-Installation-master





mysql ONLGSP < onlgsp.sql



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
