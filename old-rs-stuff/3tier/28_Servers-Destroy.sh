#!/bin/bash -ex

# Delete All Servers
# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013


LB1=`grep Location output/07_Servers-Create.sh.out|cut -c 24-|tr -d '\r' | sed -n 1p`
LB2=`grep Location output/08_Servers-Clone.sh.out|cut -c 24-|tr -d '\r' | sed -n 1p`
APP1=`grep Location output/07_Servers-Create.sh.out|cut -c 24-|tr -d '\r' | sed -n 2p`
APP2=`grep Location output/08_Servers-Clone.sh.out|cut -c 24-|tr -d '\r' | sed -n 2p`
DBSERVER=`grep Location output/07_Servers-Create.sh.out |cut -c 24-|tr -d '\r' | sed -n 3p`

cd /opt/api/3tier

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$LB1 \
| tee output/${0##*/}.out

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$LB2 \
| tee -a output/${0##*/}.out

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$APP1 \
| tee -a output/${0##*/}.out

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$APP2 \
| tee -a output/${0##*/}.out

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$DBSERVER \
| tee -a output/${0##*/}.out

