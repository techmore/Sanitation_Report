#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo ""
mkdir -p /home/user/Desktop/TM_Nuke /home/user/Desktop/TM_Nuke/Logos /home/user/Desktop/TM_Nuke/Sanitation_Logs

# cd /tmp
# UPDATE HERE WHEN INSTALL FILES CHANGE
# wget https://www.dropbox.com/s/9kpqp52k36wjsyg/Nuke_Install_v3.zip
# unzip Nuke_Install_v3.zip
# sleep .2
# cd Nuke_Install_v3

sudo chmod 775 TM_Nuke.sh Single_Pass.sh Triple_Pass.sh

dpkg -i pv_1.6.0-1_amd64.deb
dpkg -i python-pisa_3.032-3_all.deb
dpkg -i python-html5lib_0.999-4_all.deb
dpkg -i python-reportlab-accel_3.3.0-1_amd64.deb
dpkg -i python-reportlab_3.3.0-1_all.deb
dpkg -i python-pil_3.1.2-0ubuntu1_amd64.deb
dpkg -i python-imaging_3.1.2-0ubuntu1_all.deb
dpkg -i python-pypdf_1%3a1.13-3_all.deb
dpkg -i python-pkg-resources_20.7.0-1_all.deb
dpkg -i python-pisa_3.0.32-3_all.deb

# sudo dpkg -i python-support_1.0.15_all.deb

mv TM_Nuke.sh /home/user/Desktop/TM_Nuke
mv Single_Pass.sh /home/user/Desktop/TM_Nuke
mv Triple_Pass.sh /home/user/Desktop/TM_Nuke
mv nuke.png /home/user/Desktop/TM_Nuke/Logos
# sudo mv pisa_util.py /usr/lib/pymodules/python2.7/sx/pisa3/pisa_util.py

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
