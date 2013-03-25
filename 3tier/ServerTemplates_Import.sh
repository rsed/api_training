#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

LB_ID="47477"
APP_ID="47476"
DB_ID="47475"

echo " Load Balancer ServerTemplate"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$LB_ID/import \
| tee output/${0##*/}.out

echo " Application Server ServerTemplate"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$APP_ID/import \
| tee -a output/${0##*/}.out

echo " Database ServerTemplate"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$DB_ID/import \
| tee -a output/${0##*/}.out

