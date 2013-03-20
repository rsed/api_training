#!/bin/bash -e

COMPANYNAME="MyCompanyName"
EMAIL="name@example.com"
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

