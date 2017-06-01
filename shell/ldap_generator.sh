#!/bin/sh

for((i=10000;i<18000;i++))
do
 cp $1.template qos.ldif
 sed -i.bak s/XXX/$i/g qos.ldif
 ldapadd -c -x -h 10.253.156.4 -p 16611 -D "cn=sdfrun" -w sdfrun1 -f qos.ldif
done
