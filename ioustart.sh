#!/bin/bash
##/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/GNS3/GNS3-0.8.4-RC2-src/  export PATH
# export NETIO_NETMAP=~/NETMAP
E="-e 1"
S="-s 1"
for VAR in "$@"
do
	CMP=${VAR:0:1}
	if [ $CMP != "@" ]
	then
		if [ $VAR -eq $VAR 2> /dev/null ]
		then
			echo $VAR "is a number"
			wrapper-linux -m i86bi_linux-adventerprisek9-ms-152-2-2-3T.bin -p $((7000 + $VAR)) -- $E $S $((1 * $VAR)) > /dev/null 2>&1 & echo $! > IOL$VAR.pid
			sleep 3s
		else
			echo $VAR "is not a number"
		fi
	else
		NUM=${VAR:1}
		iou2net.pl -u $((30000 + $NUM)):$((30001 + $NUM)) - p $NUM > /dev/null 2>&1 & echo $! > IOL$NUM.pid
		echo "arroba" $NUM		
	fi
done
