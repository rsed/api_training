#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#CURRDBINSTANCE="969GBPOIMG8QI"                          # Current DB Instance ID
CURRDBINSTANCE=`grep Location output/12_ServerDB-Launch.sh.out |cut -c 35-|tr -d '\r'`  # Current DB Instance ID

#CLOUD="1"                                              # Specify the Cloud to add the Server Array to
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`       # Or, get cloud id form LabInfo file

cd /opt/api/3tier

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d recipe_name="db::do_init_and_become_master" \
https://us-3.rightscale.com/api/clouds/$CLOUD/instances/$CURRDBINSTANCE/run_executable \
| tee output/${0##*/}.out
