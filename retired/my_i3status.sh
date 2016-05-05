i3status | while :
do
usedmem=`free -m | grep "cache:" | awk '{print $3}'`
cached=`free -m | grep ^Mem | awk '{print $7}'`
   read line
   echo "U ${usedmem}M | C ${cached}M | $line" || exit 1
done
