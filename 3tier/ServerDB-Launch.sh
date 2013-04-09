#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

DBSERVER=`grep Location output/Servers-Create.sh.out |cut -c 24-|tr -d '\r' | sed -n 3p`

cd /opt/api/3tier

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$DBSERVER/launch.xml \
| tee output/${0##*/}.out

