#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

DEPLOYMENT="350944003"                             #Enter the Deployment ID to change inputs for
DBFQDN="myhandle-masterdb.rightscaletraining.com"  #FQDN of DB Server
DDNSID="10079884"                                  #DDNS ID of DB Server
MYNAMELINAGE="mynameLinage"                        #Replace "Myname"
MYNAMESCHEMA="mynameSchema"                        #Replace "Myname"

# Please note the following inputs could all be populated with one API Request.  
# They've been split here by category for clarification purposes only

# Update Inputs in DB Category
curl -i -H X_API_VERSION:1.5 -b ~/mycookie \
-d inputs[][name]="db/admin/user" \
-d inputs[][value]="text:adminuser" \
-d inputs[][name]="db/admin/password" \
-d inputs[][value]="text:adminpassword" \
-d inputs[][name]="db/application/user" \
-d inputs[][value]="text:appuser123" \
-d inputs[][name]="db/application/password" \
-d inputs[][value]="text:apppasword123" \
-d inputs[][name]="db/backup/lineage" \
-d inputs[][value]="text:$MYNAMELINAGE" \
-d inputs[][name]="db/dns/master/fqdn" \
-d inputs[][value]="text:$DBFQDN" \
-d inputs[][name]="db/dns/master/id" \
-d inputs[][value]="text:$DDNSID" \
-d inputs[][name]="db/dump/container" \
-d inputs[][value]="cred:DUMP_CONTAINER" \
-d inputs[][name]="db/dump/database_name" \
-d inputs[][value]="text:$MYNAMESCHEMA" \
-d inputs[][name]="db/dump/prefix" \
-d inputs[][value]="text:sampledb" \
-d inputs[][name]="db/dump/storage_account_id" \
-d inputs[][value]="cred:AWS_ACCESS_KEY_ID" \
-d inputs[][name]="db/dump/storage_account_secret" \
-d inputs[][value]="cred:AWS_SECRET_ACCESS_KEY" \
-d inputs[][name]="db/replication/user" \
-d inputs[][value]="text:repluser" \
-d inputs[][name]="db/replication/password" \
-d inputs[][value]="text:replpassword" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update      


# Update Inputs in SYS_DNS Category
curl -i -H X_API_VERSION:1.5 -b ~/mycookie \
-d inputs[][name]="sys_dns/choice" \
-d inputs[][value]="text:DNSMadeEasy" \
-d inputs[][name]="sys_dns/password" \
-d inputs[][value]="cred:DNS_PASSWORD" \
-d inputs[][name]="sys_dns/user" \
-d inputs[][value]="cred:DNS_USER" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update
