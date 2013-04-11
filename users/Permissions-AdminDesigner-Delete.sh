#!/bin/bash -e

PERMISSION1="837760"
PERMISSION2="837761"

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/permissions/$PERMISSION1 \
| tee output/${0##*/}.out

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com/api/permissions/$PERMISSION2 \
| tee -a output/${0##*/}.out
