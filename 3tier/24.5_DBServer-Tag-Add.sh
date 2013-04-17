#!/bin/bash -e

DBSERVERHREF=`grep Location output/07_Servers-Create.sh.out |cut -c 11-|tr -d '\r' | sed -n 3p`
NEWTAG="testtag:dbserver=yes"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d resource_hrefs[]=$DBSERVERHREF \
-d tags[]=$NEWTAG \
https://us-3.rightscale.com/api/tags/multi_add \
| tee output/${0##*/}.out

