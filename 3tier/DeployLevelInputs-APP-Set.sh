#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

DEPLOYMENT="350944003"                             #Enter the Deployment ID to change inputs for
MYNAMESCHEMA="mynameSchema"                        #Replace "Myname"

# Please note the following inputs could all be populated with one API Request.  
# They've been split here by category for clarification purposes only

# Update Inputs in APP Category
curl -i -H X_API_VERSION:1.5 -b ~/mycookie \
-d inputs[][name]="app/database_name" \
-d inputs[][value]="text:$MYNAMESCHEMA" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee output/${0##*/}.out


# Update Inputs in APP_PHP Category
curl -i -H X_API_VERSION:1.5 -b ~/mycookie \
-d inputs[][name]="app_php/modules_list" \
-d inputs[][value]="array:php53u-mysql,php53u-pecl-memcache" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee -a output/${0##*/}.out


# Update Inputs in DB Category
curl -i -H X_API_VERSION:1.5 -b ~/mycookie \
-d inputs[][name]="db/provider_type" \
-d inputs[][value]="text:db_mysql_5.5" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee -a output/${0##*/}.out


# Update Inputs in REPO Category
curl -i -H X_API_VERSION:1.5 -b ~/mycookie \
-d inputs[][name]="repo/default/repository" \
-d inputs[][value]="text:git://github.com/rightscale/examples.git" \
-d inputs[][name]="repo/default/revision" \
-d inputs[][value]="text:unified_php" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee -a output/${0##*/}.out
