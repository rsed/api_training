#!/bin/bash -ex

# Disables the Array
# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`

cd /opt/api/3tier

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d terminate_all=true \
https://us-3.rightscale.com/api/clouds/$CLOUD/instances/multi_terminate \
| tee output/${0##*/}.out

