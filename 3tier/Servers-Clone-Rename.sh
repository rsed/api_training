#!/bin/bash

LB_CLONE="670352003"  #Cloned Load Balancer ID, ie "Location: /api/servers/670352003"
APP_CLONE="670353003" #Cloned App Server ID, ie "Location: /api/servers/670353003"

echo "Renaming cloned Load Balancer Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X PUT \
-d server[name]="myname Load Balancer 2" \
https://us-3.rightscale.com/api/servers/$LB_CLONE

echo "Renaming cloned Application Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X PUT \
-d server[name]="myname App Server 2" \
https://us-3.rightscale.com/api/servers/$APP_CLONE

