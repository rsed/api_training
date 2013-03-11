#!/bin/bash -e 
LB_ID="19506"
APP_ID="19507"
DB_ID="19508"

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$LB_ID/import

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$APP_ID/import

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/publications/$DB_ID/import

