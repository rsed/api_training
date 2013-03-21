#!/bin/bash -e

# This first part of script works fine
# But the second curl does not - 422 Unprocessable Entity
# Issue passing the USERID variable

COMPANYNAME="MyCompanyName"
EMAIL="name10@example.com"
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
| tee output/User-and-Permission-Add.out


USERID=`grep Location output/User-and-Permission-Add.out |cut -c 22-`
#USERID=`grep Location output/User-and-Permission-Add.out |tail -c 7`
echo $USERID

#give the previous user add time to update
sleep 20

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=observer \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee -a output/User-and-Permission-Add.out

