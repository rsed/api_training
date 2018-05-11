#!/bin/bash -ex

INSTANCE_HREF="/api/clouds/1/instances/C7NJTL9TSF7L2"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com$INSTANCE_HREF/terminate

