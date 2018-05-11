#!/bin/bash

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#MYNAME="myname"       #Replace with your name
MYNAME=`grep MYNAME LabInfo | cut -c 8-|tr -d '\r'`     # Or, get your name form LabInfo file

#LB_CLONE="670395003"  #Load Balancer ID, ie 'Location: /api/servers/670395003'
LB_CLONE=`grep Location output/08_Servers-Clone.sh.out|cut -c 24-|tr -d '\r' | sed -n 1p`

#APP_CLONE="670396003" #App Server ID, ie 'Location: /api/servers/670396003'
APP_CLONE=`grep Location output/08_Servers-Clone.sh.out|cut -c 24-|tr -d '\r' | sed -n 2p`

cd /opt/api/3tier

echo "Renaming cloned Load Balancer Server" | tee output/${0##*/}.out
curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X PUT \
-d server[name]="$MYNAME Load Balancer 2" \
https://us-3.rightscale.com/api/servers/$LB_CLONE \
| tee -a output/${0##*/}.out

echo "Renaming cloned Application Server" | tee -a output/${0##*/}.out
curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X PUT \
-d server[name]="$MYNAME App Server 2" \
https://us-3.rightscale.com/api/servers/$APP_CLONE \
| tee -a output/${0##*/}.out

