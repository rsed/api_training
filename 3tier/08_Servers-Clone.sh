#!/bin/bash

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#LB_SVR="670392003"  #Load Balancer ID, ie 'Location: /api/servers/670346003'
LB_SVR=`grep Location output/07_Servers-Create.sh.out|cut -c 24-|tr -d '\r' | sed -n 1p`

#APP_SVR="670393003" #App Server ID, ie 'Location: /api/servers/670347003'
APP_SVR=`grep Location output/07_Servers-Create.sh.out|cut -c 24-|tr -d '\r' | sed -n 2p`

cd /opt/api/3tier

echo " Load Balancer Server 2" | tee output/${0##*/}.out
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$LB_SVR/clone \
| tee -a output/${0##*/}.out

echo " Application Server 2" | tee -a output/${0##*/}.out
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$APP_SVR/clone \
| tee -a output/${0##*/}.out

