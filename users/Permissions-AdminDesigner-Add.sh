#!/bin/bash -e

USERID="67508"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=admin \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee output/${0##*/}.out

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=designer \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee -a output/${0##*/}.out
