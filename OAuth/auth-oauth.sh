#!/bin/bash

#The following items are taken from the Dashboard 'Settings > Account Setting > API Credentials'
my_token_endpoint="https://us-3.rightscale.com/api/oauth2"
my_refresh_token="81b123213hb34..."

curl -H "X-API-Version:1.5" \
  --request POST "$my_token_endpoint" \
  -d "grant_type=refresh_token" \
  -d "refresh_token=$my_refresh_token"
