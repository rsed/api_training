#!/bin/sh -e
EMAIL="john.fitzpatrick@rightscale.com"  # The email address for your RightScale User in the Dashboard
PSWD="mypassword"      # Your User's password
ACCOUNT="33085"                # Account ID, obtained from navigation in the Dashboard (Student 02)

curl -i -H X_API_VERSION:1.5 -c mycookie -X POST -d email=$EMAIL -d password=$PSWD -d account_href=/api/accounts/$ACCOUNT https://us-3.rightscale.com/api/session
