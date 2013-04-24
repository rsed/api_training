#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

# Enter Manually
#MYNAME="myname"                                        # Replace with your name
#CLOUD="1"                                              # Specify the Cloud to add the Server Array to
#DBSCHEMA="mynameSchema"                                # Replace "myname".  
#DBFQDN="myname-masterdb.rightscaletraining.com"        # FQDN of DB Server

# Or Enter Programatically
MYNAME=`grep MYNAME LabInfo | cut -c 8-|tr -d '\r'`  
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`  
DBSCHEMA=`grep DBSCHEMA LabInfo | cut -c 10-|tr -d '\r'`
DBFQDN=`grep DBFQDN LabInfo | cut -c 8-|tr -d '\r'`
E2ESCRIPTID=`grep Location output/19_RightScript-APP-Import.sh.out|cut -c 30-|tr -d '\r'` # ID for RightScript

cd /opt/api/3tier

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -d filter[]="name==APP" -X POST \
-d right_script_href="/api/right_scripts/$E2ESCRIPTID" \
-d inputs[][name]="DBADMIN_PASSWORD" \
-d inputs[][value]="text:adminpassword" \
-d inputs[][name]="DBADMIN_USER" \
-d inputs[][value]="text:adminuser" \
-d inputs[][name]="APPLICATION" \
-d inputs[][value]="text:myapp" \
-d inputs[][name]="MASTER_DB_DNSNAME" \
-d inputs[][value]="text:$DBFQDN" \
-d inputs[][name]="INSTANCE" \
-d inputs[][value]="env:INSTANCE_ID" \
-d inputs[][name]="DB_SCHEMA_NAME" \
-d inputs[][value]="text:$DBSCHEMA" \
https://us-3.rightscale.com/api/clouds/$CLOUD/instances/multi_run_executable \
| tee output/${0##*/}.out

