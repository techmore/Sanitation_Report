#!/bin/bash

cd /tmp;echo ""; echo "TechMore.co/src Sanitation v7.9
Covered code is provided under this license on an \"as is\" basis, without warranty of any kind, either expressed 
or implied, including, without limitation, warranties that the covered code is free of defects, merchantable, fit 
for a particular purpose or non-infringing. The entire risk as to the quality and performance of the covered code 
is with you. Should any covered code prove defective in any respect, you (not the initial developer or any  other
contributor) assume the cost of any necessary servicing, repair or correction. This disclaimer of warranty constitutes
 an essential part of this license. No use of any covered code is authorized hereunder except under this disclaimer.
NISTSP800-88 Compliant http://csrc.nist.gov/publications/nistpubs/800-88/NISTSP800-88_with-errata.pdf

WARNING!!! This program will attempt to destroy any data available on the first sata drive mounted!!!"; echo ""
echo "$customer"
# Set hard drive size variable, display hard drive size.
size=$(fdisk -l | grep "Disk /dev/sda:" | cut -d ":" -f 2 | cut -d "." -f 1 | cut -d "," -f 1 | cut -d " " -f 2)
echo "Hard Disk size : $size mb" 

# echo "Customer List : "
# grep -a Customer ~/Desktop/TM_Nuke/Sanitation_Logs/*.html | cut -d ":" -f 5 | cut -d "<" -f 1 | uniq -c
# echo "New Customer "
# echo "If you wish to add a logo please put it in ~/Desktop/TM_Nuke/Logos "
# echo ""
# echo "Which logo do you wish to use?"
# ls ~/Desktop/TM_Nuke/Logos
# echo "Please type in the full name. ( formatting error will result otherwise )"
# read logo_name

#echo '<br><br><p><center><table><tr><td><img src="'`echo ~`/Desktop/TM_Nuke/Logos/$logo_name'" width="300" height="140"></td>
#<td><center><p><u><h1>TM Sanitation Report</u><h3>Customer : '$customer'<p>'$(date)'</td></center></tr></h2></table></center><pre><B><br><br><br>' > Nuked-preformatted.html

echo '<br><br><p><center><table><tr><td><img src="'`echo ~`/Desktop/TM_Nuke/Logos/nuke.png'" width="300" height="140"></td>
<td><center><p><u><h1>TM Sanitation Report</u><h3>Customer : '$customer'<p>'$(date)'</td></center></tr></h2></table></center><pre><B><br><br><br>' > Nuked-preformatted.html

echo "<font size=\"13\">" >> Nuked-preformatted.html
echo "Collecting system information ..."
lshw > hwreport.txt | zenity --progress --pulsate --auto-close
cat hwreport.txt | grep -m 1 'vendor' | cut -d ":" -f 2 | sed s/" "/""/g | tr \\n \\0 | tr '[:upper:]' '[:lower:]' >> Nuked-preformatted.html
cat hwreport.txt | grep -m 1 'version' | cut -d ":" -f 2 | tr \\n \\0 >> Nuked-preformatted.html
cat hwreport.txt | grep -m 1 'serial' | sed s/"Serial:"/"<\b>Serial:<b>"/g |sed s/" "/""/g >> Nuked-preformatted.html
cat hwreport.txt | grep -i product | grep -i intel  | cut -d ":" -f 2 | sed s/" "/""/g | sed s/"s"/"S"/g >> Nuked-preformatted.html
grep MemTotal /proc/meminfo >> Nuked-preformatted.html
fdisk -l | grep "Disk /dev/sda" >> Nuked-preformatted.html
hdparm -I /dev/sda | grep 'Number\|Revision' >> Nuked-preformatted.html
echo -n "</B>" >> TM_Sanitation_Report_.html >> Nuked-preformatted.html
hdparm -I /dev/sda | grep -m 1 -A 12 'Configuration' >> Nuked-preformatted.html
echo "<b>" >> Nuked-preformatted.html
rm hwreport.txt

echo "To interrupt process use Ctrl+c in the terminal, data will still be lost."
# THIS IS THE TEST VERSION. CHECK COUNT! SMALL WIPE FOR REPORTING ...
# nice -n -19 dd if=/dev/zero | pv -s "1000m" | dd of=/dev/sda bs=4096 count=1 conv=notrunc >> Nuked-preformatted.html  2>&1

#This is the real nuke
 nice -n -19 dd if=/dev/zero | pv -s $size"m" | dd of=/dev/sda bs=4096 conv=notrunc >> Nuked-preformatted.html  2>&1 |zenity --progress --pulsate --auto-close

# aplay /home/user/Downloads/extras/smb_mariodie.wav 
echo ""; echo "nuke complete."
# notify-send "Nuke Complete"

cat Nuked-preformatted.html | sed s/"vendor"/"<B>Vendor<\/B>"/g | sed s/"version"/"  Version"/g | sed s/"product"/"<B>Product<\/B>"/g | sed s/"description"/"  Description"/g | sed s/"serial"/"  Serial"/g > TM_Sanitation_Report_.html

echo "<br><br><br><br><br><br><br><br><br>" >> TM_Sanitation_Report_.html
echo "<font size=\"3\"><footer><h5>" >> TM_Sanitation_Report_.html
echo "<p>TechMore.co/src Sanitation v7.1" >> TM_Sanitation_Report_.html
echo "<p>Covered code is provided under this license on an \"as is\" basis, without warranty of any kind, either expressed" >> TM_Sanitation_Report_.html
echo " or implied, including, without limitation, warranties that the covered code is free of defects, merchantable," >> TM_Sanitation_Report_.html
echo "fit for a particular purpose or non-infringing. The entire risk as to the quality and performance of the " >> TM_Sanitation_Report_.html
echo "covered code is with you. Should any covered code prove defective in any respect, you (not the initial " >> TM_Sanitation_Report_.html
echo "developer or any  other contributor) assume the cost of any necessary servicing, repair or correction. This " >> TM_Sanitation_Report_.html
echo "disclaimer of warranty constitutes an essential part of this license. No use of any covered code is authorized" >> TM_Sanitation_Report_.html
echo "here under except under this disclaimer." >> TM_Sanitation_Report_.html
echo "<p>NISTSP800-88 Compliant http://csrc.nist.gov/publications/nistpubs/800-88/NISTSP800-88_with-errata.pdf" >> TM_Sanitation_Report_.html
echo "pg14. 5th paragraph, \"Advancing technology has created a situation that has altered previously held best " >> TM_Sanitation_Report_.html
echo "practices regarding magnetic disk type storage media. Basically the change in track density and the related " >> TM_Sanitation_Report_.html
echo "changes in the storage medium have created a situation where the acts of clearing and purging the media have " >> TM_Sanitation_Report_.html
echo "converged. That is, for ATA disk drives manufactured after 2001 (over 15 GB) clearing by overwriting the media" >> TM_Sanitation_Report_.html
echo "from both keyboard and laboratory attack.\"" >> TM_Sanitation_Report_.html

now=$(date | sed s/" "/"_"/g)
mv TM_Sanitation_Report_.html ~/Desktop/TM_Nuke/Sanitation_Logs/TM_Sanitation_Report_"$customer"_"$now".html
xhtml2pdf ~/Desktop/TM_Nuke/Sanitation_Logs/TM_Sanitation_Report_"$customer"_"$now".html ~/Desktop/TM_Nuke/Sanitation_Logs/TM_Sanitation_Report_"$customer"_"$now".pdf

evince ~/Desktop/TM_Nuke/Sanitation_Logs/TM_Sanitation_Report_"$customer"_"$now".pdf &
# firefox ~/Desktop/TM_Nuke/Sanitation_Logs/TM_Sanitation_Report_"$customer"_"$now".html &

echo "message:Nuke Me complete!" | zenity --notification --listen --timeout 1
echo "done"
exit 0

# Send file to TechMore server
# echo "Send file to Server [ y/n ]? : "
# Netcat port scanning
# for i in $(seq 1 255); do nc -v -n -z -w 1 10.0.1.$i 50666; done
 
# echo "Your IP Address : "; ifconfig | grep addr | cut -d ":" -f 2 | grep Bcast | cut -d " " -f 1
# cat /home/user/Downloads/Logs/TM_Sanitation_Report_"$customer"_"$now".pdf | pv | nc 10.0.1.18 50666

# echo "done, report filed."
# notify-send "Done, report filed"
# sleep 10; init 0
