#!/bin/bash -e

#MYNAME="myname"                                        # Replace with your name
MYNAME=`grep MYNAME LabInfo | cut -c 8-|tr -d '\r'`     # Or, get your name form LabInfo file

read -p \
"Are you sure you want to create the Deployment '$MYNAME 3 Tier Deployment'? (y/n): "  -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
 
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d deployment[name]="$MYNAME 3 Tier Deployment" \
-d deployment[description]="3 Tier Deployment created by API" \
https://us-3.rightscale.com/api/deployments.xml \
| tee output/${0##*/}.out

fi

