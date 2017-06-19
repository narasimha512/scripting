#!/bin/sh

echo `date` >> $1
echo "eth links info" >> $1
ip a >> $1

echo `date` >> $1
echo "ifconfig all info" >> $1
ifconfig -a >> $1

echo `date` >> $1
echo "ifconfig info" >> $1
ifconfig >> $1

echo `date` >> $1
netstat -s >> $1


echo `date` >> $1
netstat -i >> $1


echo `date` >> $1
nstat  -a >> $1

echo `date` >> $1
sar -n EDEV 1 60 >> $1

echo `date` >> $1
echo "nstats output"
nstat >> $1

i=0
while [ $i -lt 8 ]
do
echo `date` >> $1
echo "eth${i} information" >> $1
ethtool eth${i} >> $1
i=`expr $i + 1`
done


i=0
while [ $i -lt 8 ]
do
echo `date` >> $1
echo "eth${i} stats" >> $1
root@hss8fe> cat netstats.sh
#!/bin/sh

echo `date` >> $1
echo "eth links info" >> $1
ip a >> $1

echo `date` >> $1
echo "ifconfig all info" >> $1
ifconfig -a >> $1

echo `date` >> $1
echo "ifconfig info" >> $1
ifconfig >> $1

echo `date` >> $1
netstat -s >> $1


echo `date` >> $1
netstat -i >> $1


echo `date` >> $1
nstat  -a >> $1

echo `date` >> $1
sar -n EDEV 1 60 >> $1

echo `date` >> $1
echo "nstats output"
nstat >> $1

i=0
while [ $i -lt 8 ]
do
echo `date` >> $1
echo "eth${i} information" >> $1
ethtool eth${i} >> $1
i=`expr $i + 1`
done


i=0
while [ $i -lt 8 ]
do
echo `date` >> $1
echo "eth${i} stats" >> $1
ethtool -S eth${i} >> $1
i=`expr $i + 1`
done

i=0
while [ $i -lt 8 ]
do
echo `date` >> $1
echo "eth${i} flow control stats" >> $1
ethtool -a eth${i} >> $1
i=`expr $i + 1`
done

i=0
while [ $i -lt 8 ]
do
echo `date` >> $1
echo "eth${i} coalescence stats" >> $1
ethtool -c eth${i} >> $1
i=`expr $i + 1`
done

i=0
while [ $i -lt 8 ]
do
echo `date` >> $1
echo "eth${i} buffer stats" >> $1
ethtool -g eth${i} >> $1
i=`expr $i + 1`
done
