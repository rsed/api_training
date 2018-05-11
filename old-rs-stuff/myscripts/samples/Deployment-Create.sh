#!/bin/bash -e
MYNAME="JDoe"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d deployment[name]="$MYNAME Deployment" \
-d deployment[description]="$MYNAME Deployment created by API" \
https://us-3.rightscale.com/api/deployments

