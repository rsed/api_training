#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#MYNAME="myname"                                        # Replace with your name
MYNAME="grep MYNAME LabInfo | cut -c 8-|tr -d '\r'"     # Or, get your name form LabInfo file
#CLOUD="1"                                              # Specify the Cloud to add the Server Array to
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`       # Or, get cloud id form LabInfo file

E2ESCRIPTID="426335003"                                 # ID for RightScript
MYNAMESCHEMA="mynameSchema"                             # Replace "myname".  
DBFQDN="myname-masterdb.rightscaletraining.com"         # FQDN of DB Server

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -d filter[]="name==APP" -X POST \
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
-d inputs[][value]="text:$MYNAMESCHEMA" \
https://us-3.rightscale.com/api/clouds/$CLOUD/instances/multi_run_executable \
| tee output/${0##*/}.out

