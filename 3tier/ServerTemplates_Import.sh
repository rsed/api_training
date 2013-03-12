#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

LB_ID="47475"
APP_ID="47476"
DB_ID="47477"

echo "***Importing Load Balancer ServerTemplate***"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$LB_ID/import

echo "***Importing Application Server ServerTemplate***"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$APP_ID/import

echo "***Importing Database ServerTemplate***"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$DB_ID/import

