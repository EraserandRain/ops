#!/bin/bash
export LC_ALL=C
netconf=""
iptxt=""
read -p "input network config path(such as 'ifcfg-enp1s0'): " netconf
read -p "input ip list path(txt file): " iptxt
oldip=$(cat $netconf |grep IPADDR|awk -F '=' '{print $2}')
sum=$(cat $iptxt|wc -l)
for (( i=0;i<"$sum";i++ ))
do
    iparr[$i]=$(awk 'NR=="'$[$i+1]'"' $iptxt)
    newip=${iparr[$i]}
    echo $newip
    sed -i "s/IPADDR=${oldip}/IPADDR=${newip}/" "$netconf"
    oldip=$newip
done
echo success!
exit 0