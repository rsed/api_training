#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

DEPLOYMENT="373176003"  # Deployment to add Server Array to
APP_ST="290032003"          # Set the ServerTemplate the Server Array will be based on
CLOUD="1"            # Specify the Cloud to add the Server Array to
SG="50K6AE2MB3LDL"      # Set the Security Group
SSH="2OSIPDJU7Q55G"     # Set the SSH Key


curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d server_array[name]=my_array_server \
-d server_array[description]=my_app_server_description \
-d server_array[array_type]=alert \
-d server_array[state]=disabled \
-d server_array[instance][server_template_href]=/api/server_templates/$APP_ST \
-d server_array[instance][cloud_href]=/api/clouds/$CLOUD \
-d server_array[instance][security_group_hrefs]=/api/clouds/$CLOUD/security_groups/$SG \
-d server_array[instance][ssh_key_href]=/api/clouds/$CLOUD/ssh_keys/$SSH \
-d server_array[elasticity_params][alert_specific_params][decision_threshold]=51 \
-d server_array[elasticity_params][bounds][min_count]=2 \
-d server_array[elasticity_params][bounds][max_count]=3 \
-d server_array[elasticity_params][pacing][resize_calm_time]=5 \
-d server_array[elasticity_params][pacing][resize_down_by]=1 \
-d server_array[elasticity_params][pacing][resize_up_by]=1 \
https://us-3.rightscale.com/api/deployments/$DEPLOYMENT/server_arrays \
| tee output/Array-Create.out
