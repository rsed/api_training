#!/bin/bash -e

USERNAME=`grep username config | awk -F  "=" '{print $2}'`
ACCESS_TOKEN=`grep access_token config | awk -F  "=" '{print $2}'`


# curl -s -X GET -H "content-type: application/json" \
#     -H 'Authorization: Bearer GM04wLbBcFkBcvOI2w' \
#     -d "{'ability_screen': {'ability_screen_id': '2004', 'email': $USERNAME}" \
#     https://app.trueability.com/api/v1/ability_screens


curl -X POST -H "Content-Type: application/json" \
    -H "X-API-KEY: $ACCESS_TOKEN" \
    -d '{"ability_screen": {"ability_screen_id": "2004", "email": "fitzpatrick@chef.io"}' \
    https://app.trueability.com/api/v1





    curl --silent -X GET -H "content-type: application/json" \
     -H "X-API-KEY: GM04wLbBcFkBcvOI2w"                     \
     https://app.trueability.com/api/v1/ability_screens/0000



    # python -m json.tool
# -d '{"ability_screen": {"ability_screen_id": "2004", "email": "youruser@example.com"}'

# -d "{'ability_screen': {'ability_screen_id': '2004', 'email': $USERNAME}" \


# below works
# curl -s -X GET -H "content-type: application/json" \
#  -H "X-API-KEY: $ACCESS_TOKEN"                     \
#  https://app.trueability.com/api/v1/ability_screens  | python -m json.tool
