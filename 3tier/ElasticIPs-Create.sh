#!/bin/bash
CLOUD="1"

# This File is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ip_address[name]="myname EIP1" \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_addresses

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ip_address[name]="myname EIP2" \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_addresses



