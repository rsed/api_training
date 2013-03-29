#!/bin/bash

echo "Creating Security Groups"
./SecurityGroup-Create.sh
./SecurityGroupRules-Create.sh

echo "Creating SSH Keys"
./SSHKey-Create.sh

echo "Creating Deployment"
./Deployment-Create.sh

echo "Importing ServerTemplates"
./ServerTemplates_Import.sh

echo "Creating Servers"
./Servers-Create.sh
./Servers-Clone.sh
./Servers-Clone-Rename.sh

echo "Creating Elastic IPs"
./ElasticIPs-Create.sh

echo "Attaching Elastic IPs"
#./Server-ElasticIP-Attach.sh

echo "Setting Inputs"
./DeployLevelInputs-APP-Set.sh
./DeployLevelInputs-LB-Set.sh
./DeployLevelInputs-MySQL-Set.sh

echo "Lauching Servers..."
echo "...Launching Database"
./ServerDB-Launch.sh
echo "...Launching Load Balancers"
./ServerLB-Launch.sh
echo "...Launching Application Servers"
./ServerAPP-Launch.sh


