#!/bin/bash -ex

CLOUD="1"            #May need to change this
SG="7IHT5MDOJU1DJ"   #Will need to change this

#Open port 22 for SSH Access
curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="SSH" \
-d security_group_rule[protocol]=tcp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][start_port]=22 \
-d security_group_rule[protocol_details][end_port]=22 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules

#Open port 80 for web access to Load Balancers
curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="Web Access" \
-d security_group_rule[protocol]=tcp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][start_port]=80 \
-d security_group_rule[protocol_details][end_port]=80 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules

#Open port 8000 for LB to APP Server communications
curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="LB APP Server Comms" \
-d security_group_rule[protocol]=tcp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][start_port]=8000 \
-d security_group_rule[protocol_details][end_port]=8000 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules

#Allow ICMP so we can ping the servers
curl -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d security_group_rule[group_name]="LB APP Server Comms" \
-d security_group_rule[protocol]=icmp \
-d security_group_rule[cidr_ips]='0.0.0.0/0' \
-d security_group_rule[protocol_details][icmp_code]=-1 \
-d security_group_rule[protocol_details][icmp_type]=-1 \
-d security_group_rule[source_type]=cidr_ips \
https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules

