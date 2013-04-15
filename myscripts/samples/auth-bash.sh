#!/bin/bash -e

EMAIL="myemail@example.com"  # The email address for your RightScale User
ACCOUNT="12345"              # Account ID

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
EMAIL="myemail@example.com"  # The email address for your RightScale User
ACCOUNT="12345"              # Account ID

echo ""
curl -i -H X-API-Version:1.5 -c ~/mycookie -X POST -d email=$EMAIL -d password=$password -d account_href=/api/accounts/$ACCOUNT https://us-3.rightscale.com/api/session

