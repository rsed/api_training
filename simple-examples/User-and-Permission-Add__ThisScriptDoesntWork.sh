#!/bin/bash -e

COMPANYNAME="MyCompanyName"
EMAIL="name9@example.com"
FIRSTNAME="Myfirstname"
LASTNAME="Mylastname"
PHONE="0123456789"
PASSWORD="P@ssword123"

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d user[company]=$COMPANYNAME \
-d user[email]=$EMAIL \
-d user[first_name]=$FIRSTNAME \
-d user[last_name]=$LASTNAME \
-d user[password]=$PASSWORD \
-d user[phone]=$PHONE \
https://us-3.rightscale.com/api/users \
| tee output/User-Add.out



USERID=`grep Location output/User-Add.out |cut -c 22-`
#USERID=`grep Location output/User-Add.out |tail -c 7`

echo $USERID
#give the previous user add time to update
sleep 30


curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=observer \
-d permission[user_href]=/api/users/USERID \
https://us-3.rightscale.com/api/permissions \
| tee output/Permission-Observer-Add.out

