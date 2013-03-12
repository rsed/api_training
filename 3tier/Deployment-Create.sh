#!/bin/bash -e

# This File is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d deployment[name]="myname 3 Tier Deployment" \
-d deployment[description]="3 Tier Deployment created by API" \
https://us-3.rightscale.com/api/deployments.xml
