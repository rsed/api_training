#!/bin/bash -e

USERID="67465"

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=observer \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee output/Permission-Observer-Add.out

