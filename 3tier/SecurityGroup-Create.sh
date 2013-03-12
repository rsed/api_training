#!/bin/bash -e 
CLOUD="1"       #May need to change this

# This File is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d security_group[name]="myname Security Group2" \
-d security_group[description]="myname API Training Security Group" \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups
