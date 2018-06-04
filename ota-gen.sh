#!/bin/bash
device=$1
cd ~/OTA_config/bhi
oldzip=$(grep "<Filename>Candy" $device.xml  | sed -e 's|</\?Filename>||g')
newzip=$2
sed -i "s/$oldzip/$newzip/g" $device.xml
cd -
cd ~/OTA_config/bhi
echo "OTA Update for Candy $device $(date +%Y%m%d) Build" > /tmp/candyota
git commit -as -F /tmp/candyota
git pull --no-edit origin c8.1;
git push origin c8.1
cd -
rm -fv /tmp/candyota
