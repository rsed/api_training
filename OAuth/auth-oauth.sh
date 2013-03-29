#!/bin/bash

my_token_endpoint="https://us-3.rightscale.com/api/oauth2"
my_refresh_token="81b33983c832b8283c9d008d472139dba2280c43"

curl --include \
  -H "X-API-Version:1.5" \
  --request POST "$my_token_endpoint" \
  -d "grant_type=refresh_token" \
  -d "refresh_token=$my_refresh_token"
