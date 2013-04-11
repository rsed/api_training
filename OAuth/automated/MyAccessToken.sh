#!/bin/bash

#The follwoing items are taken from the Dashboard 'Settings > Account Setting > API Credentials'
my_token_endpoint="https://us-3.rightscale.com/api/oauth2"
#my_refresh_token="68f17f......"
my_refresh_token=`grep my_refresh_token RefreshToken|cut -c 18-|tr -d '\r'`

curl -H "X-API-Version:1.5" \
  --request POST "$my_token_endpoint" \
  -d "grant_type=refresh_token" \
  -d "refresh_token=$my_refresh_token" \
|python -mjson.tool|grep access_token|cut -c22-381|tr -d '\r'
