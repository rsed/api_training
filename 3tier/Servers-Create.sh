#!/bin/bash -e

DEPLOYMENT="350938003"  # Deployment to add Server to
CLOUD="1"               # Specify Cloud to add Server to
LB_ST="282921003"       # Set the Load Balancer Server ServerTemplate
APP_ST="282922003"      # Set the APP Server ServerTemplate
DB_ST="282920003"       # Set the Database Server ServerTemplate
SG="50K6AE2MB3LDL"      # Set the Security Group
SSH="2OSIPDJU7Q55G"     # Set the SSH Key

echo "Create Load Balancer Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d server[name]="myname Load Balancer 1" \
-d server[description]="Load Balancer server" \
-d server[deployment_href]=/api/deployments/$DEPLOYMENT \
-d server[instance][cloud_href]=/api/clouds/$CLOUD \
-d server[instance][server_template_href]=/api/server_templates/$LB_ST \
-d server[instance][security_group_hrefs][]=/api/clouds/$CLOUD/security_groups/$SG \
-d server[instance][ssh_key_href]=/api/clouds/$CLOUD/ssh_keys/$SSH \
https://us-3.rightscale.com/api/servers

echo "Create Application Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d server[name]="myname App Server 1" \
-d server[description]="PHP App Server" \
-d server[deployment_href]=/api/deployments/$DEPLOYMENT \
-d server[instance][cloud_href]=/api/clouds/$CLOUD \
-d server[instance][server_template_href]=/api/server_templates/$APP_ST \
-d server[instance][security_group_hrefs][]=/api/clouds/$CLOUD/security_groups/$SG \
-d server[instance][ssh_key_href]=/api/clouds/$CLOUD/ssh_keys/$SSH \
https://us-3.rightscale.com/api/servers

echo "Create Database Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d server[name]="myname Database" \
-d server[description]="Database Server" \
-d server[deployment_href]=/api/deployments/$DEPLOYMENT \
-d server[instance][cloud_href]=/api/clouds/$CLOUD \
-d server[instance][server_template_href]=/api/server_templates/$DB_ST \
-d server[instance][security_group_hrefs][]=/api/clouds/$CLOUD/security_groups/$SG \
-d server[instance][ssh_key_href]=/api/clouds/$CLOUD/ssh_keys/$SSH \
https://us-3.rightscale.com/api/servers

