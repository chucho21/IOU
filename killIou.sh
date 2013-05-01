#! /bin/sh
#killIOU.sh
PIDFILES=*.pid
for i in ${PIDFILES}; do
kill `cat $i`;
rm $i;
done
