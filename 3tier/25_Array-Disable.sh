#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

ARRAY=`grep Location output/22_Array-Create.sh.out |cut -c 30-|tr -d '\r'`

cd /opt/api/3tier

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X PUT \
-d server_array[state]=disabled \
https://us-3.rightscale.com/api/server_arrays/$ARRAY \
| tee output/${0##*/}.out
