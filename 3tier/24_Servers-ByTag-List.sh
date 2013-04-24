#!/bin/bash -ex

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

SEARCHTAG="loadbalancer:default=lb"
#SEARCHTAG="appserver:active=true"
#SEARCHTAG="rs_monitoring:state=active"

cd /opt/api/3tier

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d resource_type=instances \
-d tags[]=$SEARCHTAG \
https://us-3.rightscale.com/api/tags/by_tag.xml \
| tee output/${0##*/}.out

