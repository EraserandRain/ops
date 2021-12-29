#!/bin/bash
export LC_ALL=C
systemctl stop NetworkManager
systemctl disable NetworkManager
## set input
netconf=""
txt=""
read -p "Please input network config path(such as 'ifcfg-enp1s0'): " netconf
read -p "Please input ip list path(txt file): " txt
oldip=$(cat "$netconf" |grep IPADDR|awk -F '=' '{print $2}')
sum=$(cat "$txt"|wc -l)
## script loop
for (( i=0;i<"$sum";i++ ))
do
    iparr[$i]=$(awk 'NR=="'$[$i+1]'"' "$txt")
    newip=${iparr[$i]}
    echo $newip
    sed -i "s/IPADDR=${oldip}/IPADDR=${newip}/" "$netconf"
    oldip=$newip
    service network restart && sh OS_Linux_check.sh "$newip"
done
systemctl enable NetworkManager
systemctl start NetworkManager
mv ./*.dat ./dat/
echo success!
exit 0