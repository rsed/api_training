#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

# The following to get populated from a RightScript
EMAIL="myemail@example.com"  # The email address for your RightScale User in the Dashboard.
ACCOUNT="12345"                # Account ID, obtained from navigation in the Dashboard (Student 02)

unset password

prompt="Please enter the password associated with email '$EMAIL': "

while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    password+="$char"
done


echo ""
curl -i -H X_API_VERSION:1.5 -c ~/mycookie -X POST \
-d email=$EMAIL \
-d password=$password \
-d account_href=/api/accounts/$ACCOUNT \
https://us-3.rightscale.com/api/session
