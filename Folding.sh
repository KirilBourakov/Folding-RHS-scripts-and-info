#!/usr/bin/bash

SESSION=$SUDO_USER
printf -v FILEPATH "/home/$SESSION/"
printf -v SFILEPATH "/home/$SESSION"
printf -v PathToClient "$SFILEPATH/fahclient_7.6.21_amd64.deb"

apt-get install -y python3-stdeb python3-gi python3-all python3-six debhelper dh-python gir1.2-gtk-3.0 unzip
wget -P $FILEPATH https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.6/fahclient_7.6.21_amd64.deb
wget -P $FILEPATH https://github.com/cdberkstresser/fah-control/archive/refs/heads/master.zip

echo $PathToClient

dpkg -i --force-depends $PathToClient

unzip "$SFILEPATH/master.zip"
touch "/etc/systemd/system/FAHcontrol.service"
printf "[Unit]\nDescription=FAHcontrol\n\n[Service]\nExecStart=python3 /home/$SUDO_USER/fah-control-master/FAHControl\n\n[Install]\nWantedBy=multi-user.target" > "/etc/systemd/system/FAHcontrol.service"
sudo systemctl enable FAHcontrol.service








