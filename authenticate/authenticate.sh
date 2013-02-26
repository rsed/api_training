#!/bin/bash -e

unset password

#read -p "Please enter the password associated with email '$EMAIL': " password 

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

EMAIL="john.fitzpatrick@rightscale.com"  # The email address for your RightScale User in the Dashboard
#PSWD="$password"      # Your User's password
ACCOUNT="62988"                # Account ID, obtained from navigation in the Dashboard (Student 02)

curl -i -H X_API_VERSION:1.5 -c mycookie -X POST -d email=$EMAIL -d password=$password -d account_href=/api/accounts/$ACCOUNT https://us-3.rightscale.com/api/session
#curl -i -H X_API_VERSION:1.5 -c mycookie -X POST -d email=$EMAIL -d password=$PSWD -d account_href=/api/accounts/$ACCOUNT https://us-3.rightscale.com/api/session
