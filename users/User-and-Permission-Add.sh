#!/bin/bash -e

# This script is for use in the API Training Course
# The script creates a user, then creates observer permissions for the user
# Written by John Fitzpatrick, March 2013

COMPANYNAME="MyCompanyName"
EMAIL="name13@example.com"
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

#Set the USERID to that of the user just created
USERID=`grep Location output/User-and-Permission-Add.out |cut -c 22-|tr -d '\r'`

#Set the permissions for user
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=observer \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee -a output/User-and-Permission-Add.out

