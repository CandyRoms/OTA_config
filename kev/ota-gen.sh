#!/bin/bash
device=$1
cd ~/dev/candy8.1/OTA/config/kev
oldzip=$(grep "<Filename>Candy-" $device.xml  | sed -e 's|</\?Filename>||g')
newzip=$2
sed -i "s/$oldzip/$newzip/g" $device.xml
cd -
cd ~/dev/candy8.1/OTA/config/kev
echo "OTA Update for Candy $device $(date +%Y%m%d) Build" > /tmp/candyota
git commit -as -F /tmp/candyota
git pull --no-edit candy c8.1;
git push candy c8.1
cd -
rm -fv /tmp/candyota
