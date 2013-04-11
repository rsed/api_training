#!/bin/bash

access_token=`./MyAccessToken.sh`
 
curl --include \
     -H "X-API-Version:1.5" \
     -H "Authorization: Bearer $access_token" \
     --request GET "https://us-3.rightscale.com/api/deployments.xml"


