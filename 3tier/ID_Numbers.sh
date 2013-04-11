#!/bin/bash

# This script lists the IDs of created objects by parsing the .sh.out files in the output directory
# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

# Deployment-Create.sh.out

cd /opt/api/3tier

if [ -f output/06_Deployment-Create.sh.out ]
        then
        echo "***Deployment ID (\$DEPLOYMENT) ***" 
        grep Location output/06_Deployment-Create.sh.out 
        echo ""
        fi

#Deployment-Create__WithConfirmation.sh
if [ -f output/06_Deployment-Create__WithConfirmation.sh.out ]
        then
        echo "***Deployment ID (\$DEPLOYMENT) ***" 
        grep Location output/06_Deployment-Create__WithConfirmation.sh.out 
        echo ""
        fi


#SecurityGroup-Create.sh.out 
if [ -f output/01_SecurityGroup-Create.sh.out ]
        then
        echo "***Security Group ID (\$SG)***" 
        grep Location output/01_SecurityGroup-Create.sh.out 
        echo ""
        fi

#SecurityGroupRules-Create.sh.out
if [ -f output/02_SecurityGroupRules-Create.sh.out ]
        then
        echo "***Security Group Rules***" 
        grep Location output/02_SecurityGroupRules-Create.sh.out 
        echo ""
        fi

#SSHKey-Create.sh.out
if [ -f output/03_SSHKey-Create.sh.out ]
        then
        echo "***SSH Key (\$SSH)***" 
        grep Location output/03_SSHKey-Create.sh.out 
        echo ""
        fi

#ElasticIPs-Create.sh.out
if [ -f output/04_ElasticIPs-Create.sh.out ]
        then
        echo "***Elastic IP 1 & Elastic IP2 (\$EIP1 & \$EIP2)***" 
        grep Location output/04_ElasticIPs-Create.sh.out 
        echo ""
        fi

# Server-ElasticIP-Attach.sh.out
if [ -f output/10_Server-ElasticIP-Attach-NextInstance.sh.out ]
        then
        echo "***Server-Elastic IP Bindings  (\$LB1EIP1, \$LB2EIP2) ***" 
        grep Location output/10_Server-ElasticIP-Attach.sh.out 
        echo ""
        fi


#if [ -f output/21_SecurityGroupRules-DBAccess-Add.sh.out

#ServerTemplates_Import.sh
if [ -f output/05_ServerTemplates_Import.sh.out ]
        then
        echo "***ServerTemplates (\$LB_ST, \$APP_ST & \$DB_ST)***" 
        egrep 'ServerTemplate|Location' output/05_ServerTemplates_Import.sh.out
        echo ""
        fi

#Servers
if [ -f output/07_Servers-Create.sh.out ] || [ -f 08_Servers-Clone.sh.out ]
        then
        echo "***Servers (\$LB1, \$APP1, \$DB, \$LB2, \$APP2)***" 
        egrep 'Server|Location' output/07_Servers-Create.sh.out |grep -v HTTP|grep -v 201 | grep -v nginx 
        egrep 'Server|Location' output/08_Servers-Clone.sh.out |grep -v HTTP|grep -v 201| grep -v nginx 
        echo ""
        fi



#ServerDB-Launch.sh.out
if [ -f output/12_ServerDB-Launch.sh.out ]
        then
        echo "***Current DB Instance (\$CURRDBINSTANCE) ***" 
        grep Location output/12_ServerDB-Launch.sh.out 
        echo ""
        fi


#ServerDB-RunRecipe-LoadDB.sh.out
if [ -f output/13_ServerDB-RunRecipe-LoadDB.sh.out ]
        then
        echo "***db::do_dump_import Audit Entries***" 
        grep Location output/13_ServerDB-RunRecipe-LoadDB.sh.out 
        echo ""
        fi


#ServerDB-RunRecipe-MakeMaster.sh.out
if [ -f output/14_ServerDB-RunRecipe-MakeMaster.sh.out ]
        then
        echo "***db::do_init_and_become_master Audit Entries***" 
        grep Location output/14_ServerDB-RunRecipe-MakeMaster.sh.out 
        echo ""
        fi


#ServerLB-Launch.sh.out
if [ -f output/16_ServerLB-Launch.sh.out ]
        then
        echo "***LB1 and LB2 Current Instance IDs***" 
        grep Location output/16_ServerLB-Launch.sh.out 
        echo ""
        fi



#ServerAPP-Launch.sh.out
if [ -f output/18_ServerAPP-Launch.sh.out ]
        then
        echo "***APP1 and APP2 Current Instance IDs***" 
        grep Location output/18_ServerAPP-Launch.sh.out 
        echo ""
        fi


#RightScript-APP-Import.sh.out
if [ -f output/19_RightScript-APP-Import.sh.out ]
        then
        echo "***End2End Script ID (\$E2ESCRIPTID) ***" 
        grep Location output/19_RightScript-APP-Import.sh.out 
        echo ""
        fi


#ServerAPPs-RunScript-E2EDemo.sh.out
if [ -f output/RunScript-E2EDemo.sh.out ]
        then
        echo "***End2End Script Audit Entries***" 
        grep Location output/RunScript-E2EDemo.sh.out 
        echo ""
        fi


