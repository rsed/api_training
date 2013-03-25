#!/bin/bash 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#CLOUD="1"            # Specify the Cloud to add the Server Array to
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`
#SG="50K6AE2MB3LDL"    #You can add the Sec Group ID Manually
SG=`grep Location output/SecurityGroup-Create.sh.out |cut -c 41-|tr -d '\r'`    #Or you can retrieve it automatically

#Open port 22 for SSH Access
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="SSH" \
-d security_group_rule[protocol]=tcp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][start_port]=22 \
-d security_group_rule[protocol_details][end_port]=22 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules \
| tee output/${0##*/}.out

#Open port 80 for web access to Load Balancers
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="Web Access" \
-d security_group_rule[protocol]=tcp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][start_port]=80 \
-d security_group_rule[protocol_details][end_port]=80 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules \
| tee -a output/${0##*/}.out

#Open port 8000 for LB to APP Server communications
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="LB APP Server Comms" \
-d security_group_rule[protocol]=tcp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][start_port]=8000 \
-d security_group_rule[protocol_details][end_port]=8000 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules \
| tee -a output/${0##*/}.out

#Allow ICMP so you can ping the servers
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="LB APP Server Comms" \
-d security_group_rule[protocol]=icmp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][icmp_code]=-1 \
-d security_group_rule[protocol_details][icmp_type]=-1 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules \
| tee -a output/${0##*/}.out

