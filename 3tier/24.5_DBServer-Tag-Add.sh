#!/bin/bash -e

DBSERVERHREF=`grep Location output/07_Servers-Create.sh.out |cut -c 11-|tr -d '\r' | sed -n 3p`
CURRDBINSTANCE=`curl -s -H X-API-Version:1.5 -b ~/mycookie -X GET https://us-3.rightscale.com$DBSERVERHREF |python -mjson.tool | grep instances |sed -n 1p | awk '{split($2,a,"\""); print a[2]}' | tr -d '\r'`

NEWTAG="testtag:dbserver=yes"

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d resource_hrefs[]=$CURRDBINSTANCE \
-d tags[]=$NEWTAG \
https://us-3.rightscale.com/api/tags/multi_add \
| tee output/${0##*/}.out

