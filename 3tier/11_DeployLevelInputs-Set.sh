#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#Enter Manually
#DBFQDN="myname-masterdb.rightscaletraining.com"   #FQDN of DB Server
#DDNSID="10079884"                                 #DDNS ID of DB Server
#DBLINAGE="mynamelinage"                           #Replace "Myname"
#DBSCHEMA="mynameschema"                           #Replace "Myname"

#Enter Programatically
DEPLOYMENT=`grep Location output/06_Deployment-Create.sh.out |cut -c 28-|tr -d '\r' | sed -n 1p`
DBFQDN=`grep DBFQDN LabInfo | cut -c 8-|tr -d '\r'`            #FQDN of DB Server
DDNSID=`grep DDNSID LabInfo | cut -c 8-|tr -d '\r'`            #DDNS ID of DB Server
DBLINAGE=`grep DBLINAGE LabInfo | cut -c 10-|tr -d '\r'`   #Replace "Myname"
DBSCHEMA=`grep DBSCHEMA LabInfo | cut -c 10-|tr -d '\r'`   #Replace "Myname"


# Please note the following inputs could all be populated with one API Request.  
# They've been split here by category for clarification purposes only

cd /opt/api/3tier

# Update Inputs in APP Category
curl -s -i -H X-API-Version:1.5 -b ~/mycookie \
-d inputs[][name]="app/database_name" \
-d inputs[][value]="text:$DBSCHEMA" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee output/${0##*/}.out

# Update Inputs in APP_PHP Category
curl -s -i -H X-API-Version:1.5 -b ~/mycookie \
-d inputs[][name]="app_php/modules_list" \
-d inputs[][value]="array:php53u-mysql,php53u-pecl-memcache" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee -a output/${0##*/}.out

# Update Inputs in LB Category
curl -s -i -H X-API-Version:1.5 -b ~/mycookie \
-d inputs[][name]="lb/session_stickiness" \
-d inputs[][value]="text:false" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update  \
| tee -a output/${0##*/}.out


# Update Inputs in Web Apache  Category
curl -s -i -H X-API-Version:1.5 -b ~/mycookie \
-d inputs[][name]="web_apache/mpm" \
-d inputs[][value]="text:prefork" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update  \
| tee -a output/${0##*/}.out

# Update Inputs in DB Category
curl -s -i -H X-API-Version:1.5 -b ~/mycookie \
-d inputs[][name]="db/admin/user" \
-d inputs[][value]="text:adminuser" \
-d inputs[][name]="db/admin/password" \
-d inputs[][value]="text:adminpassword" \
-d inputs[][name]="db/application/user" \
-d inputs[][value]="text:appuser123" \
-d inputs[][name]="db/application/password" \
-d inputs[][value]="text:apppasword123" \
-d inputs[][name]="db/backup/lineage" \
-d inputs[][value]="text:$DBLINAGE" \
-d inputs[][name]="db/dns/master/fqdn" \
-d inputs[][value]="text:$DBFQDN" \
-d inputs[][name]="db/dns/master/id" \
-d inputs[][value]="text:$DDNSID" \
-d inputs[][name]="db/dump/container" \
-d inputs[][value]="cred:DUMP_CONTAINER" \
-d inputs[][name]="db/dump/database_name" \
-d inputs[][value]="text:$DBSCHEMA" \
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
-d inputs[][name]="db/provider_type" \
-d inputs[][value]="text:db_mysql_5.5" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee -a output/${0##*/}.out

# Update Inputs in REPO Category
curl -s -i -H X-API-Version:1.5 -b ~/mycookie \
-d inputs[][name]="repo/default/repository" \
-d inputs[][value]="text:git://github.com/rightscale/examples.git" \
-d inputs[][name]="repo/default/revision" \
-d inputs[][value]="text:unified_php" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee -a output/${0##*/}.out

# Update Inputs in SYS_DNS Category
curl -s -i -H X-API-Version:1.5 -b ~/mycookie \
-d inputs[][name]="sys_dns/choice" \
-d inputs[][value]="text:DNSMadeEasy" \
-d inputs[][name]="sys_dns/password" \
-d inputs[][value]="cred:DNS_PASSWORD" \
-d inputs[][name]="sys_dns/user" \
-d inputs[][value]="cred:DNS_USER" \
-X PUT https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/inputs/multi_update \
| tee -a output/${0##*/}.out

