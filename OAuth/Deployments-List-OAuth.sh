#!/bin/bash

access_token="eNotkF1..."
 
curl --include \
     -H "X-API-Version:1.5" \
     -H "Authorization: Bearer $access_token" \
     --request GET "https://us-3.rightscale.com/api/deployments.xml"


