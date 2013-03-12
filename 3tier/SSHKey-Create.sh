#!/bin/bash -e 

# This File is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

CLOUD="1"       #May need to change this

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ssh_key[name]="myname SSH Key" \
https://us-3.rightscale.com/api/clouds/$CLOUD/ssh_keys.xml
