#!/bin/bash

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#Set paramaters manually
#CLOUD="1"                                              # Specify the Cloud to add the Server Array to
#MYNAME="myname"                                        # Replace with your name

#Or set paramaters programatically
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`       # Get cloud id form LabInfo file
MYNAME=`grep MYNAME LabInfo | cut -c 8-|tr -d '\r'`     # Get your name form LabInfo file

cd /opt/api/3tier

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d ip_address[name]="$MYNAME EIP1" \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_addresses \
| tee output/${0##*/}.out

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d ip_address[name]="$MYNAME EIP2" \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_addresses \
| tee -a output/${0##*/}.out



