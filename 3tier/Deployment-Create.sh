#!/bin/bash -e

#!/bin/bash -e

MYNAME="myname"       #Replace with your name

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d deployment[name]="$MYNAME 3 Tier Deployment" \
-d deployment[description]="3 Tier Deployment created by API" \
https://us-3.rightscale.com/api/deployments.xml \
| tee output/Deployment-Create.out

