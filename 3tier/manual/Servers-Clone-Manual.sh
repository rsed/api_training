#!/bin/bash

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

LB_SVR="670392003"  #Load Balancer ID, ie 'Location: /api/servers/670346003'
APP_SVR="670393003" #App Server ID, ie 'Location: /api/servers/670347003'

echo " Load Balancer Server 2"
curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$LB_SVR/clone \
| tee ../output/Servers-Clone-Manual.out

echo " Application Server 2"
curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$APP_SVR/clone \
| tee -a ../output/Servers-Clone-Manual.out

