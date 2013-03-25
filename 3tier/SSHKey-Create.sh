#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#MYNAME="myname"                                        # Replace with your name
MYNAME="grep MYNAME LabInfo | cut -c 8-|tr -d '\r'"     # Or, get your name form LabInfo file
#CLOUD="1"                                              # Specify the Cloud to add the Server Array to
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`       # Or, get cloud id form LabInfo file

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ssh_key[name]="$MYNAME SSH Key" \
https://us-3.rightscale.com/api/clouds/$CLOUD/ssh_keys.xml \
| tee output/SSHKey-Create.out
