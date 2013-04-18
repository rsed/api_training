#!/bin/bash -ex

SECGROUP_HREF="/api/clouds/1/security_groups/7IHT5MDOJU1DJ"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com$SECGROUP_HREF

