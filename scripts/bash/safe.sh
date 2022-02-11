#!/bin/sh
export LC_ALL=C

OS_VERSION=`if [[ ! -f /etc/sysconfig/i18n ]]; then echo 7.6;else echo 6.6;fi`

# yum -y install iptables java-1.6.0-openjdk-devel iptables-services
# yum -y update openssl bash openssh glibc 

/sbin/iptables -F; iptables -X; iptables -Z
/sbin/iptables -P INPUT DROP; iptables -P OUTPUT ACCEPT; iptables -P FORWARD DROP
/sbin/iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
/sbin/iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#trunkey manage
/sbin/iptables -A INPUT -s 114.80.193.1/24 -j ACCEPT
/sbin/iptables -A INPUT -s 103.25.22.1/24 -j ACCEPT
/sbin/iptables -A INPUT -s svn.bak.cn -j ACCEPT
/sbin/iptables -A INPUT -s 61.129.52.151 -j ACCEPT
/sbin/iptables -A INPUT -s 192.168.8.1/24 -j ACCEPT

#Can be closed
#/sbin/iptables -t filter -A INPUT  -p tcp -m multiport --dport 80:88,47761:47763,3306 -j ACCEPT
#comon
/sbin/iptables -t filter -A INPUT  -p tcp -m multiport --dport 443,8088,58080:58200,9000:9050,39996 -j ACCEPT
/sbin/iptables -t filter -A INPUT  -p tcp -m multiport --sport 20,21 -j ACCEPT
/sbin/iptables -t filter -A INPUT  -p udp -m multiport --dport 53,6000,500,4500,161 -j ACCEPT
#eu sync config
/sbin/iptables -A INPUT -s 127.0.0.1/8 -p tcp -m multiport --dport 22,58822,3306,9379,9200,9300 -j ACCEPT
#du config
/sbin/iptables -t filter -A INPUT  -p tcp -m multiport --dport 20:22,59200 -j ACCEPT

#TEST IP Range
/sbin/iptables -A INPUT -m iprange --src-range 192.168.0.2-192.168.0.30 -j ACCEPT

/sbin/iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
/sbin/iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
/sbin/iptables-save > /etc/sysconfig/iptables
/sbin/chkconfig iptables on

if ! /bin/sed -n '/trunkey/=' /etc/sudoers |grep -E '[0-9]*' >/dev/null;then
	/usr/sbin/useradd trunkey -d /server/ -g root
	/bin/sed '/## Allow root to run any commands anywhere/a trunkey  ALL=(ALL)  NOPASSWD: ALL' -i /etc/sudoers
fi

/bin/sed -i '27,35s:database\:/bin/bash:database\:/sbin/nologin:g' /etc/passwd

# web safe
/bin/sed -i 's/cgi.fix_pathinfo=.*/cgi.fix_pathinfo=0/' /server/abchosting/php/etc/php.ini
/bin/sed -i 's/expose_php =.*/expose_php = Off/' /server/abchosting/php/etc/php.ini
/bin/sed -i 's/session.cookie_httponly =.*/session.cookie_httponly =1/' /server/abchosting/php/etc/php.ini
/bin/sed -i 's/server_tokens.*;/server_tokens off;/' /server/abchosting/nginx/conf/nginx.conf
/etc/init.d/nginx reload

# ssh safe
/bin/sed -i 's/.*Port .*22/Port 58822/' /etc/ssh/sshd_config
/bin/sed -i 's/.*PermitRootLogin [y|n].*/#PermitRootLogin no/g' /etc/ssh/sshd_config
/bin/sed -i 's/.*Port .*22/Port 58822/' /etc/ssh/ssh_config
/bin/sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/' /etc/ssh/sshd_config
/bin/sed -i 's/.*UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
/etc/init.d/sshd reload
rm -f /root/.ssh/* 
mv /usr/bin/ssh-keygen.bak /usr/bin/ssh-keygen
mv /usr/libexec/openssh/sftp-server /usr/libexec/openssh/sftp-server.bak
mv /usr/bin/sftp /usr/bin/sftp.bak
export TMOUT=180
chmod 644 /etc/passwd 
chmod 400 /etc/shadow 
chmod 644 /etc/group
chmod 644 /etc/services
chmod 600 /etc/xinetd.conf
chmod 600 /etc/security

# other service stop
/etc/init.d/rpcbind stop
/etc/init.d/nfslock stop
/etc/init.d/ntpd stop
/etc/init.d/sendmail stop
/etc/init.d/cups stop
/etc/init.d/postfix stop

chkconfig rpcbind off
chkconfig nfslock off
chkconfig ntpd off
chkconfig sendmail off
chkconfig cups off
chkconfig postfix off

# centos7.x
if [[ $OS_VERSION > 6.9 ]]; then
	echo $OS_VERSION
	systemctl stop firewalld.service
	systemctl disable firewalld.service
fi

mkdir -p /server/abchosting/www/isms/bin/
if ! sed -n '/safe.sh/=' /etc/crontab |grep -E '[0-9]*' >/dev/null;then
	echo "#Safe set" >>/etc/crontab
	echo "01 1 1 * * root sh /server/abchosting/www/isms/bin/safe.sh > /dev/null 2>&1" >>/etc/crontab
	echo "01 20 * * * root service iptables stop" >>/etc/crontab
	echo "05 20 * * * root service iptables start" >>/etc/crontab
fi

# 20210117 safe
echo "" >/etc/ld.so.preload
chattr -ia /etc/ld.so.preload
chattr -ia /usr/local/lib/process.so
chattr -ia /usr/local/lib/process.so.1
chattr -ia /bin/netstat
chattr -ia /bin/ps
chattr -ia /usr/bin/dpkgd/ss
chattr -ia /usr/sbin/ss
chattr -ia /usr/sbin/lsof
rm -fR /usr/sbin/lsof
rm -fR /usr/sbin/ss

rm -fR /etc/init.d/selinux
rm -fR /etc/init.d/DbSecuritySpt
rm -fR /etc/init.d/rc.local
rm -fR /etc/init.d/fake_net.ko

rm -fR /usr/bin/spoolsv
rm -fR /usr/bin/systemds.*
rm -fR /usr/bin/systemds
rm -fR /usr/bin/.sshd
rm -fR /usr/bin/service
rm -fR /usr/bin/bsd-port
rm -fR /usr/bin/conf.n
rm -fR /usr/bin/cmd.n
rm -fR /usr/bin/pstree\;*
rm -fR /usr/bin/dpkgd
rm -fR /usr/bin/1561*

rm -fR /root/natop
rm -f /etc/ld.so.preload
chattr -ia /usr/local/lib/process.so
rm -f /usr/local/lib/process.so
rm -f /usr/local/lib/process.so.1

rm -fR  /tmp/gates.lod
rm -fR /tmp/moni.lod
rm -fR /usr/bin/spoolsv

killall -9 systemds
killall -9 getty
killall -9 service
killall -9 .sshd
killall -9 spoolsv

## 20211209 safe
chattr -ia /bin/.sshd
chattr -ia /bin/apache
chattr -ia /usr/bin/.sshd
chattr -ia /usr/bin/apache
rm -fR /bin/.sshd
rm -fR /bin/apache
rm -fR /usr/bin/.sshd
rm -fR /usr/bin/apache

echo "Set safe successfully!"
echo ""
exit 0