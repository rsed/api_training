#!/bin/bash -e 

CLOUD="1" 
SG="50K6AE2MB3LDL" 

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST -d security_group_rule[protocol]=tcp -d security_group_rule[cidr_ips]='0.0.0.0/0' -d security_group_rule[protocol_details][start_port]=22 -d security_group_rule[protocol_details][end_port]=22 -d security_group_rule[protocol_details][start_port]=80 -d security_group_rule[protocol_details][end_port]=80 -d security_group_rule[source_type]=cidr_ips https://us-3.rightscale.com/api/clouds/$CLOUD/security_groups/$SG/security_group_rules
