#!/bin/bash -e

# This script is for use in the API Training Course
# The script creates a user, then creates observer permissions for the user
# Written by John Fitzpatrick, March 2013

COMPANYNAME="MyCompanyName"
EMAIL="name12340@example.com"
FIRSTNAME="Myfirstname"
LASTNAME="Mylastname"
PHONE="0123456789"
PASSWORD="P@ssword123"

curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d user[company]=$COMPANYNAME \
-d user[email]=$EMAIL \
-d user[first_name]=$FIRSTNAME \
-d user[last_name]=$LASTNAME \
-d user[password]=$PASSWORD \
-d user[phone]=$PHONE \
https://us-3.rightscale.com/api/users \
| tee output/${0##*/}.out

#Set the USERID to that of the user just created
USERID=`grep Location output/${0##*/}.out |cut -c 22-|tr -d '\r'|sed -n 1p`
#USERID=`grep Location output/User-and-Permission-Add.sh.out |cut -c 22-|tr -d '\r'|sed -n 1p`

#Set the permissions for user
curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d permission[role_title]=observer \
-d permission[user_href]=/api/users/$USERID \
https://us-3.rightscale.com/api/permissions \
| tee -a output/${0##*/}.out
