#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

DBSERVER=`grep Location output/07_Servers-Create.sh.out |cut -c 24-|tr -d '\r' | sed -n 3p`

cd /opt/api/3tier

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$DBSERVER/launch.xml \
| tee output/${0##*/}.out

