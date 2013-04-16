#!/bin/bash -ex

SERVER_HREF="/api/servers/747403003"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com$SERVER_HREF

