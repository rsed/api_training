#!/bin/bash -e 
CLOUD="1"       #May need to change this
MYNAME="JDoe"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d ssh_key[name]="$MYNAME SSH Key" \
https://us-3.rightscale.com/api/clouds/$CLOUD/ssh_keys

