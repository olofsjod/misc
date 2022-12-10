# Recover all files from freespace from each partition as detected by testdisk
PARENT=`pwd`
DEVICE=/dev/sda
testdisk -l $DEVICE | tee testdisk.log | egrep "[[:digit:]][[:space:]][P,E,L,D,*][[:space:]].+([[:space:]]+[[:digit:]]+){3}" | cut -f 2 -d\
    |while read PARTITION
do
  mkdir $PARTITION && cd $PARTITION &&
  xterm -e photorec /log /debug /d ./ /cmd $DEVICE freespace,$PARTITION,search
  cd $PARENT
done
