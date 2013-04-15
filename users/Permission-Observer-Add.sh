#!/bin/bash -e

USERID="67466"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=observer \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee output/${0##*/}.out
