#!/bin/bash

cd /opt/api/3tier_numbered

echo "Creating Security Groups"
./01_SecurityGroup-Create.sh
./02_SecurityGroupRules-Create.sh

echo "Creating SSH Keys"
./03_SSHKey-Create.sh

echo "Creating Deployment"
./06_Deployment-Create.sh

echo "Importing ServerTemplates"
./05_ServerTemplates_Import.sh

echo "Creating Servers"
./07_Servers-Create.sh
./08_Servers-Clone.sh
./09_Servers-Clone-Rename.sh

echo "Creating Elastic IPs"
./04_ElasticIPs-Create.sh

echo "Attaching Elastic IPs"
#./10_Server-ElasticIP-Attach.sh

echo "Setting Inputs"
./17_DeployLevelInputs-APP-Set.sh
./15_DeployLevelInputs-LB-Set.sh
./11_DeployLevelInputs-MySQL-Set.sh

echo "Lauching Servers..."
echo "...Launching Database"
./12_ServerDB-Launch.sh
echo "...Launching Load Balancers"
./16_ServerLB-Launch.sh
echo "...Launching Application Servers"
./18_ServerAPP-Launch.sh


