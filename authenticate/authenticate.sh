#!/bin/bash -e

# This file is for use in the API Training Course
# Written by John FItzpatrick, March 2013

# The following to get populated from a RightScript
EMAIL="john.fitzpatrick@rightscale.com"  # The email address for your RightScale User in the Dashboard.
ACCOUNT="62988"                # Account ID, obtained from navigation in the Dashboard (Student 02)

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

# The following to get populated from a RightScript
#EMAIL="john.fitzpatrick@rightscale.com"  # The email address for your RightScale User in the Dashboard.
#ACCOUNT="62988"                # Account ID, obtained from navigation in the Dashboard (Student 02)

echo ""
curl -i -H X_API_VERSION:1.5 -c ~/mycookie -X POST \
-d email=$EMAIL \
-d password=$password \
-d account_href=/api/accounts/$ACCOUNT \
https://us-3.rightscale.com/api/session
