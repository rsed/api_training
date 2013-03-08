#!/bin/bash -e 
CLOUD="1" 

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST -d security_group[name]="jaf Security Group" -d security_group[description]="jaf API Training Security Group" https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups
