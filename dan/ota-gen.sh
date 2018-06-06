#!/bin/bash
device=$1
cd ~/dev/candy8.1/OTA/config/dan
oldzip=$(grep "<Filename>Candy-8.1" $device.xml  | sed -e 's|</\?Filename>||g')
newzip=$2
sed -i "s/$oldzip/$newzip/g" $device.xml
cd -
cd ~/dev/candy8.1/OTA/config/dan
echo "OTA Update for Candy $device $(date +%Y%m%d) Build" > /tmp/candyota
git commit -as -F /tmp/candyota
git pull --no-edit candy c8.1;
git push candy c8.1
cd -
rm -fv /tmp/candyota
