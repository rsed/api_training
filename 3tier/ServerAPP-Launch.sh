#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

APPSERVER1="670393003"  #Server ID for 'myname Application Server 1'
APPSERVER2="670396003"  #Server ID for 'myname Application Server 2'

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$APPSERVER1/launch.xml

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$APPSERVER2/launch.xml

