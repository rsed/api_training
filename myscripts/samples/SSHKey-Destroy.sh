#!/bin/bash -ex
SSHKEY_HREF="/api/clouds/1/ssh_keys/38OTC4OMVMCA5"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X DELETE \
https://us-3.rightscale.com$SSHKEY_HREF
