#!/bin/bash -ex

# Delete Deployment
# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

DEPLOYMENT=`grep Location output/06_Deployment-Create.sh.out |cut -c 28-|tr -d '\r'`

cd /opt/api/3tier

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/deployments/$DEPLOYMENT \
| tee -a output/${0##*/}.out

