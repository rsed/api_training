#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#MYNAME="myname"                                        # Replace with your name
MYNAME=`grep MYNAME LabInfo | cut -c 8-|tr -d '\r'`     # Or, get your name form LabInfo file
#CLOUD="1"                                              # Specify the Cloud to add the Server Array to
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`       # Or, get cloud id form LabInfo file

cd /opt/api/3tier

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d security_group[name]="$MYNAME Security Group" \
-d security_group[description]="$MYNAME API Training Security Group" \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups \
| tee output/${0##*/}.out
