#!/bin/bash
dir_del=''
headimg_del=''

for (( i=11; i<31; i++))
do
    dir_del+=172\.16\.\0.$i\|
    headimg_del+=172\.16\.\0.$i\.jpg
    if (($i<30))
    then 
        headimg_del+='|'
    fi
done
dir_del+=headimg

cd /home/ubuntu/sheepwall_prj/static/assets/images/wifiuserimgs/headimg
rm -f `ls /home/ubuntu/sheepwall_prj/static/assets/images/wifiuserimgs/headimg | grep -Ev $headimg_del`

cd /home/ubuntu/sheepwall_prj/static/assets/images/wifiuserimgs
rm -rf `ls /home/ubuntu/sheepwall_prj/static/assets/images/wifiuserimgs | grep -Ev $dir_del`

echo '[Init Environment]Init WifiUser Images Done.'
