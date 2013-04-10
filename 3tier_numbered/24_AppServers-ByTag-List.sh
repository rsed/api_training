#!/bin/bash -ex

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#THIS SCRIPT RETURNS NO SERVERS.  MUST TAGS BE SET AT 'ACCOUNT' LEVEL, AS NO DEPLOYMENT SPECIFIED??

#SEARCHTAG="appserver:active=true"
SEARCHTAG="rs_monitoring:state=active"

cd /opt/api/3tier_numbered

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d resource_type=servers \
-d tags[]=$SEARCHTAG \
https://us-3.rightscale.com/api/tags/by_tag.xml \
| tee output/${0##*/}.out

