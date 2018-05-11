#!/bin/bash -e 
CLOUD="1"
MYNAME="JDoe" 

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d security_group[name]="$MYNAME Security Group" \
-d security_group[description]="$MYNAME API Training Security Group" \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups
