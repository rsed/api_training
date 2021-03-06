#!/bin/bash -ex

# Disables the Array
# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`
DEPLOYMENT=`grep Location output/06_Deployment-Create.sh.out |cut -c 11-|tr -d '\r'`

cd /opt/api/3tier

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d filter[]="deployment_href==$DEPLOYMENT" \
https://us-3.rightscale.com/api/clouds/$CLOUD/instances/multi_terminate \
| tee output/${0##*/}.out

