find /mnt/$1 -maxdepth 3 -name xsos.log > $1.txt 
cat -n $1.txt
read -p "Select: " line
DIR=$(sed -n "${line}p" $1.txt)
~/myscripts/csr2/csr2 ${DIR%/xsos.log}
rm $1.txt
