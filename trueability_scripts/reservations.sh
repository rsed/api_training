#!/bin/bash -e

USERNAME=`grep username config | awk -F  "=" '{print $2}'`
ACCESS_TOKEN=`grep access_token config | awk -F  "=" '{print $2}'`

# To fix script to grep this from get_ability_screen_ids.sh.out
LOCAL_COOKBOOK_DEVELOPMENT=3679

rm -f output/${0##*/}.out

curl --silent -X GET -H "content-type: application/json" \
    -H "X-API-KEY: GM04wLbBcFkBcvOI2w"                     \
    https://app.trueability.com/api/v1/assessments?ability_screen_id="$LOCAL_COOKBOOK_DEVELOPMENT" \
    | python -m json.tool \
    | tee -a output/${0##*/}.out
