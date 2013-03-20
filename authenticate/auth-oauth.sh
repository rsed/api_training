#!/bin/bash

my_token_endpoint="https://us-3.rightscale.com/api/oauth2"
my_refresh_token="aad92f9d39e8ae03af59b75c0dd70b6d708f56b2"

curl --include \
  -H "X-API-Version:1.5" \
  --request POST "$my_token_endpoint" \
  -d "grant_type=refresh_token" \
  -d "refresh_token=$my_refresh_token"
