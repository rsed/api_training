#!/bin/bash -e

rm -f output/temp*
rm -f output/${0##*/}.out
# rm output/*

USERNAME=`grep username config | awk -F  "=" '{print $2}'`
ACCESS_TOKEN=`grep access_token config | awk -F  "=" '{print $2}'`
# curl  -s -H "X-API-Version:1.5" \
#      -H "Authorization: Bearer $access_token" \
#      --request GET "https://us-3.rightscale.com/api/session.xml"

> output/${0##*/}.out

curl -s -X GET -H "content-type: application/json" \
 -H "X-API-KEY: $ACCESS_TOKEN" \
 https://app.trueability.com/api/v1/ability_screens  \
    | python -m json.tool \
    | grep -A 1 'external_description' \
    | tr -d ',' | tr -d '"' \
    | tee -a output/${0##*/}.out


# grep external_description output/${0##*/}.out | awk -F  ": " '{print $2}' > temp
# grep id output/${0##*/}.out | awk -F  ": " '{print $2}'

STR1="external_description"
STR2="id"

sed  's/'"$STR1"'//g' -i output/${0##*/}.out > output/temp1
sed  's/'"$STR2"'//g' -i output/temp1 > output/temp2

echo $STR2
# sed -i  "s/$STR1//" output/${0##*/}.out > output/temp1
# sed -i  "s/$STR2/QQQ/" output/temp1 > output/temp2
# sed -e 's/,//g' output/temp2 > output/temp3

# cat output/temp2

# |cut -c 28-|tr -d '\r' | sed -n 1p
