#!/bin/bash
device=$1
cd ~/bhi/OTA_config/bhi
oldzip=$(grep "<Filename>Candy-8.1" $mido.xml  | sed -e 's|</\?Filename>||g')
newzip=$2
sed -i "s/$oldzip/$newzip/g" $mido.xml
cd -
cd ~/bhi/OTA_config/bhi
echo "OTA Update for Candy $device $(date +%Y%m%d) Build" > /tmp/candyota
git commit -as -F /tmp/candyota
git pull --no-edit origin c8.1;
git push origin c8.1
cd -
rm -fv /tmp/candyota
