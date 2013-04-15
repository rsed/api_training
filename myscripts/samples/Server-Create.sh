#!/bin/bash -e

DEPLOYMENT="377873003"  # Deployment to add Server to
CLOUD="1"               # Specify Cloud to add Server to
ST="290025003"          # Set the Server ServerTemplate ID
SG="7IHT5MDOJU1DJ"      # Set the Security Group
SSH="38OTC4OMVMCA5"     # Set the SSH Key
MYNAME="JDoe"           # Enter your name

echo "Creating Server"
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d server[name]="$MYNAME Sample Server" \
-d server[description]="$MYNAME Sample API Server" \
-d server[deployment_href]=/api/deployments/$DEPLOYMENT \
-d server[instance][cloud_href]=/api/clouds/$CLOUD \
-d server[instance][server_template_href]=/api/server_templates/$ST \
-d server[instance][security_group_hrefs][]=/api/clouds/$CLOUD/security_groups/$SG \
-d server[instance][ssh_key_href]=/api/clouds/$CLOUD/ssh_keys/$SSH \
https://us-3.rightscale.com/api/servers

