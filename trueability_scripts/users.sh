#!/bin/bash -e

USERNAME=`grep username config | awk -F  "=" '{print $2}'`
ACCESS_TOKEN=`grep access_token config | awk -F  "=" '{print $2}'`


curl -s -X GET -H "content-type: application/json" \
-H "X-API-KEY: $ACCESS_TOKEN" \
https://app.trueability.com/api/v1/users

  # | python -m json.tool \
  # | tee -a output/${0##*/}.out
