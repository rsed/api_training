#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#DEPLOYMENT="350944003"                 #Enter the Deployment ID to change inputs for
DEPLOYMENT=`grep Location output/Deployment-Create.sh.out |cut -c 28-|tr -d '\r' | sed -n 1p`

# Please note the following inputs could all be populated with one API Request.  
# They've been split here by category for clarification purposes only

# Update Inputs in LB Category
curl -i -H X_API_VERSION:1.5 -b ~/mycookie \
-d inputs[][name]="lb/session_stickiness" \
-d inputs[][value]="text:false" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update  \
| tee output/${0##*/}.out


# Update Inputs in Web Apache  Category
curl -i -H X_API_VERSION:1.5 -b ~/mycookie \
-d inputs[][name]="web_apache/mpm" \
-d inputs[][value]="text:prefork" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update  \
| tee -a output/${0##*/}.out
