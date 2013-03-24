#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#CLOUD="1"            # Specify the Cloud to add the Server Array to
CLOUD=`grep CLOUD CloudID | cut -c 7-|tr -d '\r'`

MYNAME="myname" #Replace with your name

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d security_group[name]="$MYNAME Security Group2" \
-d security_group[description]="$MYNAME API Training Security Group" \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups \
| tee output/SecurityGroup-Create.out
