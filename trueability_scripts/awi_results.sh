#!/bin/bash -e

USERNAME=`grep username config | awk -F  "=" '{print $2}'`
ACCESS_TOKEN=`grep access_token config | awk -F  "=" '{print $2}'`

# To fix script to grep this from get_ability_screen_ids.sh.out
AUDITING_WITH_INSPEC=3694

curl -s -g -H "X-API-KEY: $ACCESS_TOKEN" \
"https://app.trueability.com/api/v1/results?ability_screen_id[]=$AUDITING_WITH_INSPEC" \
|python -m json.tool

# curl -s -X GET -H "content-type: application/json" \
#  -H "X-API-KEY: $ACCESS_TOKEN" \
#  # -d '{"assessment": {"ability_screen_id": 000, "email": “example@example.com”, \
#  https://app.trueability.com/api/v1/results  \
#  # https://app.trueability.com/api/v1/results?company_id[]='chef'  \
#  # | python -m json.tool \
#  | tee -a output/${0##*/}.out

 # curl -s -X GET -H "content-type: application/json" \
 #  -H "X-API-KEY: $ACCESS_TOKEN" \
 #  https://app.trueability.com/api/v1/results?starts_after=2018-2-14T11:19:00   \
 #  | tee -a output/${0##*/}.out


  # curl -s -X GET -H "content-type: application/json" \
  #  -H "X-API-KEY: $ACCESS_TOKEN" \
  #  https://app.trueability.com/api/v1/results/assessment_uuid/59693
