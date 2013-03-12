#!/bin/bash

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

MYNAME="myname"       #Replace with your name
LB_CLONE="670352003"  #Cloned Load Balancer ID, ie "Location: /api/servers/670352003"
APP_CLONE="670353003" #Cloned App Server ID, ie "Location: /api/servers/670353003"

echo "Renaming cloned Load Balancer Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X PUT \
-d server[name]="$MYNAME Load Balancer 2" \
https://us-3.rightscale.com/api/servers/$LB_CLONE

echo "Renaming cloned Application Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X PUT \
-d server[name]="$MYNAME App Server 2" \
https://us-3.rightscale.com/api/servers/$APP_CLONE

