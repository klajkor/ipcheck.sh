# GitHub maintained shell script
mount /box
# Local IP section
now=`date '+%F %T'`
tstamp=`date '+%Y%m%d_%H%M%S'`
LOC_IP_FILE=/box/ip/local-ip_$tstamp.txt
echo "$now " > $LOC_IP_FILE
ifconfig eth0|grep inet|cut -d: -f2|cut -f1 -d" " >> $LOC_IP_FILE
echo "# Full ifconfig output:" >> $LOC_IP_FILE
ifconfig eth0 >> $LOC_IP_FILE
# Public IP section
now=`date '+%F %T'`
tstamp=`date '+%Y%m%d_%H%M%S'`
PUB_IP_FILE=/box/ip/public-ip_$tstamp.txt
echo "$now " > $PUB_IP_FILE
PUBLIC_IP=` wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`
#wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//' >> $PUB_IP_FILE
echo $PUBLIC_IP >> $PUB_IP_FILE
