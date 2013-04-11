#!/bin/bash -e

MYNAME="myname"

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d deployment[name]="$MYNAME Deployment for API Sandbox" \
https://us-3.rightscale.com/api/deployments.xml \
| tee output/${0##*/}.out

