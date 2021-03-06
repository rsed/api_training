#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#Enter the vlaues manually
#LB1="670392003"  #Server ID for 'myname Load Balancer 1'
#LB2="670395003"  #Server ID for 'myname Load Balancer 2'

#Or enter the values programatically
LB1=`grep Location output/07_Servers-Create.sh.out|cut -c 24-|tr -d '\r' | sed -n 1p`
LB2=`grep Location output/08_Servers-Clone.sh.out|cut -c 24-|tr -d '\r' | sed -n 1p`

cd /opt/api/3tier

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$LB1/launch.xml \
| tee output/${0##*/}.out

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$LB2/launch.xml \
| tee -a output/${0##*/}.out

