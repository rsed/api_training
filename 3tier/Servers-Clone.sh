#!/bin/bash

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

LB_SVR="670346003"  #Load Balancer ID, ie 'Location: /api/servers/670346003'
APP_SVR="670347003" #App Server ID, ie 'Location: /api/servers/670347003'

echo "Cloning Load Balancer Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$LB_SVR/clone

echo "Cloning Application Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$APP_SVR/clone

