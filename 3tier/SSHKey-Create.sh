#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

MYNAME="myname"  #Replace with your name
#CLOUD="1"            # Specify the Cloud to add the Server Array to
CLOUD=`grep CLOUD CloudID | cut -c 7-|tr -d '\r'`

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ssh_key[name]="$MYNAME SSH Key" \
https://us-3.rightscale.com/api/clouds/$CLOUD/ssh_keys.xml \
| tee output/SSHKey-Create.out
