#!/bin/bash

access_token="eNotkFtvg..."
 
curl -H "X-API-Version:1.5" \
     -H "Authorization: Bearer $access_token" \
     --request GET "https://us-3.rightscale.com/api/session.xml"

