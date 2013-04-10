#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#MYNAME="myname"                                        # Replace with your name
MYNAME=`grep MYNAME LabInfo | cut -c 8-|tr -d '\r'`     # Or, get your name form LabInfo file
#CLOUD="1"                                              # Specify the Cloud to add the Server Array to
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`       # Or, get cloud id form LabInfo file

#DEPLOYMENT="350944003"  # Deployment to add Server to
DEPLOYMENT=`grep Location output/06_Deployment-Create.sh.out |cut -c 28-|tr -d '\r'`

#LB_ST="282920003"       # Set the Load Balancer Server ServerTemplate
LB_ST=`grep Location output/o5_ServerTemplates_Import.sh.out|cut -c 33-|tr -d '\r'|sed -n 1p`

#APP_ST="282922003"      # Set the APP Server ServerTemplate
APP_ST=`grep Location output/05_ServerTemplates_Import.sh.out|cut -c 33-|tr -d '\r'|sed -n 2p`

#DB_ST="282921003"       # Set the Database Server ServerTemplate
DB_ST=`grep Location output/05_ServerTemplates_Import.sh.out|cut -c 33-|tr -d '\r'|sed -n 3p`

#SG="50K6AE2MB3LDL"      # Set the Security Group
SG=`grep Location output/01_SecurityGroup-Create.sh.out |cut -c 41-|tr -d '\r'`

#SSH="2OSIPDJU7Q55G"     # Set the SSH Key
SSH=`grep Location output/03_SSHKey-Create.sh.out |cut -c 34-|tr -d '\r'`

cd /opt/api/3tier_numbered

echo " Load Balancer Server 1" | tee output/${0##*/}.out
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d server[name]="$MYNAME Load Balancer 1" \
-d server[description]="Load Balancer server" \
-d server[deployment_href]=/api/deployments/$DEPLOYMENT \
-d server[instance][cloud_href]=/api/clouds/$CLOUD \
-d server[instance][server_template_href]=/api/server_templates/$LB_ST \
-d server[instance][security_group_hrefs][]=/api/clouds/$CLOUD/security_groups/$SG \
-d server[instance][ssh_key_href]=/api/clouds/$CLOUD/ssh_keys/$SSH \
https://us-3.rightscale.com/api/servers \
| tee -a output/${0##*/}.out

echo " Application Server 1" | tee -a output/${0##*/}.out
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d server[name]="$MYNAME App Server 1" \
-d server[description]="PHP App Server" \
-d server[deployment_href]=/api/deployments/$DEPLOYMENT \
-d server[instance][cloud_href]=/api/clouds/$CLOUD \
-d server[instance][server_template_href]=/api/server_templates/$APP_ST \
-d server[instance][security_group_hrefs][]=/api/clouds/$CLOUD/security_groups/$SG \
-d server[instance][ssh_key_href]=/api/clouds/$CLOUD/ssh_keys/$SSH \
https://us-3.rightscale.com/api/servers \
| tee -a output/${0##*/}.out

echo " Database Server" | tee -a output/${0##*/}.out
curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d server[name]="$MYNAME Database" \
-d server[description]="Database Server" \
-d server[deployment_href]=/api/deployments/$DEPLOYMENT \
-d server[instance][cloud_href]=/api/clouds/$CLOUD \
-d server[instance][server_template_href]=/api/server_templates/$DB_ST \
-d server[instance][security_group_hrefs][]=/api/clouds/$CLOUD/security_groups/$SG \
-d server[instance][ssh_key_href]=/api/clouds/$CLOUD/ssh_keys/$SSH \
https://us-3.rightscale.com/api/servers \
| tee -a output/${0##*/}.out

