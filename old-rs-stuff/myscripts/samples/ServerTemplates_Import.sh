#!/bin/bash -e 
ST="48499"

echo "Importing ServerTemplate"
curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$ST/import

