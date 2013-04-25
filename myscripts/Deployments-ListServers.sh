#!/bin/bash -e 
DEPLOYMENT="339866003"    # Set the Deployment to "12346789"  

curl -s -i -H X-API-Version:1.5 -b /opt/development/authenticate/mycookie -X \
GET https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/servers.xml \
| tee output/${0##*/}.out


