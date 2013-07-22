mount /box
now=`date '+%F %T'`
tstamp=`date '+%Y%m%d_%H%M%S'`
echo "$now " > /box/ip/local-ip_$tstamp.txt
#ifconfig eth0|grep inet|cut -d: -f2|cut -f1 -d" " >> /box/local-ip.txt
ifconfig eth0 >> /box/ip/local-ip_$tstamp.txt
now=`date '+%F %T'`
tstamp=`date '+%Y%m%d_%H%M%S'`
echo "$now " > /box/ip/public-ip_$tstamp.txt
wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//' >> /box/ip/public-ip_$tstamp.txt
