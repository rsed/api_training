#!/bin/bash -ex

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#Entered Manually
#CLOUD="1"            # Specify the Cloud to add the Server Array to
#SG="50K6AE2MB3LDL"    #Replace with the Security Group ID

#Entered Programatically
SG=`grep Location output/01_SecurityGroup-Create.sh.out |cut -c 41-|tr -d '\r'`
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`

cd /opt/api/3tier_numbered

#Open port 3306 so App servers can access the Database
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="MySQL" \
-d security_group_rule[protocol]=tcp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][start_port]=3306 \
-d security_group_rule[protocol_details][end_port]=3306 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules \
| tee output/${0##*/}.out

