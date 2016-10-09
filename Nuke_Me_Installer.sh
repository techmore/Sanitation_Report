#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt -y install pv python-pisa python-html5lib
echo ""
mkdir -p ~/Desktop/TM_Nuke ~/Desktop/TM_Nuke/Logos ~/Desktop/TM_Nuke/Sanitation_Logs

cd /tmp
# UPDATE HERE WHEN INSTALL FILES CHANGE
# wget https://www.dropbox.com/s/9kpqp52k36wjsyg/Nuke_Install_v3.zip
# unzip Nuke_Install_v3.zip
# sleep .2
# cd Nuke_Install_v3

sudo chmod 775 TM_Nuke.sh Single_Pass.sh Triple_Pass.sh

# sudo dpkg -i pv_1.2.0-1_amd64.deb
# sudo dpkg -i python-html5lib_0.999-2_all.deb
# sudo dpkg -i python-support_1.0.15_all.deb
# sudo dpkg -i python-pypdf_1.13-1_all.deb
# sudo dpkg -i python-reportlab_3.0-1build1_all.deb
# sudo dpkg -i python-pisa_3.0.32-1build1_all.deb

mv TM_Nuke.sh ~/Desktop/TM_Nuke
mv Single_Pass.sh ~/Desktop/TM_Nuke
mv Triple_Pass.sh ~/Desktop/TM_Nuke
mv nuke.png ~/Desktop/TM_Nuke/Logos
sudo mv pisa_util.py /usr/lib/pymodules/python2.7/sx/pisa3/pisa_util.py

echo "[Desktop Entry]" >> tm-nuke.desktop
echo "Name=TM Nuke" >> tm-nuke.desktop
echo "Comment=Primary Hard Drive Sanitizer with reporting" >> tm-nuke.desktop
echo "Exec=sudo $HOME/Desktop/TM_Nuke/TM_Nuke.sh" >> tm-nuke.desktop
echo "Icon=$HOME/Desktop/TM_Nuke/Logos/nuke.png" >> tm-nuke.desktop
echo "Terminal=true" >> tm-nuke.desktop
echo "Type=Application" >> tm-nuke.desktop
echo "StartupNotify=true" >> tm-nuke.desktop

mv tm-nuke.desktop /usr/share/applications/
chown root /usr/share/applications/tm-nuke.desktop
chgrp root /usr/share/applications/tm-nuke.desktop 
