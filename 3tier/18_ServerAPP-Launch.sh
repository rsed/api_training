#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#Enter the vlaues manually
#APP1="670393003"  #Server ID for 'myname Application Server 1'
#APP2="670396003"  #Server ID for 'myname Application Server 2'

#Or enter the values programatically
APP1=`grep Location output/07_Servers-Create.sh.out|cut -c 24-|tr -d '\r' | sed -n 2p`
APP2=`grep Location output/08_Servers-Clone.sh.out|cut -c 24-|tr -d '\r' | sed -n 2p`

cd /opt/api/3tier

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$APP1/launch.xml \
| tee output/${0##*/}.out

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$APP2/launch.xml \
| tee -a output/${0##*/}.out

