#!/bin/bash -ex

# Delete All Servers
# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013


LB1=`grep Location output/Servers-Create.sh.out|cut -c 24-|tr -d '\r' | sed -n 1p`
LB2=`grep Location output/Servers-Clone.sh.out|cut -c 24-|tr -d '\r' | sed -n 1p`
APP1=`grep Location output/Servers-Create.sh.out|cut -c 24-|tr -d '\r' | sed -n 2p`
APP2=`grep Location output/Servers-Clone.sh.out|cut -c 24-|tr -d '\r' | sed -n 2p`
DBSERVER=`grep Location output/Servers-Create.sh.out |cut -c 24-|tr -d '\r' | sed -n 3p`


curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$LB1 \
| tee output/${0##*/}.out

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$LB2 \
| tee -a output/${0##*/}.out

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$APP1 \
| tee -a output/${0##*/}.out

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$APP2 \
| tee -a output/${0##*/}.out

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/servers/$DBSERVER \
| tee -a output/${0##*/}.out
