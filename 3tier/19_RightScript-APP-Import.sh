#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

RIGHTSCRIPTID="48616"

cd /opt/api/3tier

echo "***Importing RightScript '3tier-End-to-End Demo [RSED]'***"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$RIGHTSCRIPTID/import \
| tee output/${0##*/}.out
