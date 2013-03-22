#!/bin/bash -e

USERID="67508"

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=admin \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee output/Permissions-AdminDesigner-Add.out

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=designer \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee -a output/Permissions-AdminDesigner-Add.out
