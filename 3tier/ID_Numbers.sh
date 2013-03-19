#!/bin/bash

# This script lists the IDs of created objects by parsing the .out files in the output directory
# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

# Deployment-Create.out
if [ -f output/Deployment-Create.out ]
        then
        echo "***Deployment ID***" 
        grep Location output/Deployment-Create.out 
        echo ""
        fi

#Deployment-Create__WithConfirmation.sh
if [ -f output/Deployment-Create__WithConfirmation.out ]
        then
        echo "***Deployment ID***" 
        grep Location output/Deployment-Create__WithConfirmation.out 
        echo ""
        fi


#SecurityGroup-Create.out 
if [ -f output/SecurityGroup-Create.out ]
        then
        echo "***Security Group ID***" 
        grep Location output/SecurityGroup-Create.out 
        echo ""
        fi

#SecurityGroupRules-Create.out
if [ -f output/SecurityGroupRules-Create.out ]
        then
        echo "***Security Group Rules***" 
        grep Location output/SecurityGroupRules-Create.out 
        echo ""
        fi

#SSHKey-Create.out
if [ -f output/SSHKey-Create.out ]
        then
        echo "***SSH Key***" 
        grep Location output/SSHKey-Create.out 
        echo ""
        fi

#ElasticIPs-Create.out
if [ -f output/ElasticIPs-Create.out ]
        then
        echo "***Elastic IP 1 & Elastic IP2 ***" 
        grep Location output/ElasticIPs-Create.out 
        echo ""
        fi

# Server-ElasticIP-Attach.out
if [ -f output/Server-ElasticIP-Attach.out ]
        then
        echo "***Server-Elastic IP Bindings – LB1/EIP1, LB2/EIP2***" 
        grep Location output/Server-ElasticIP-Attach.out 
        echo ""
        fi


#if [ -f output/SecurityGroupRules-DBAccess-Add.out

#ServerTemplates_Import.sh
if [ -f output/ServerTemplates_Import.out ]
        then
        echo "***ServerTemplates***" 
        egrep 'ServerTemplate|Location' output/ServerTemplates_Import.out
        echo ""
        fi

#Servers
if [ -f output/Servers-Create.out ] || [ -f Servers-Clone.out ]
        then
        echo "***Servers***" 
        egrep 'Server|Location' output/Servers-Create.out |grep -v HTTP|grep -v 201 | grep -v nginx 
        egrep 'Server|Location' output/Servers-Clone.out |grep -v HTTP|grep -v 201| grep -v nginx 
        echo ""
        fi



#ServerDB-Launch.out
if [ -f output/ServerDB-Launch.out ]
        then
        echo "***Current DB Instance***" 
        grep Location output/ServerDB-Launch.out 
        echo ""
        fi


#ServerDB-RunRecipe-LoadDB.out
if [ -f output/ServerDB-RunRecipe-LoadDB.out ]
        then
        echo "***db::do_dump_import Audit Entries***" 
        grep Location output/ServerDB-RunRecipe-LoadDB.out 
        echo ""
        fi


#ServerDB-RunRecipe-MakeMaster.out
if [ -f output/ServerDB-RunRecipe-MakeMaster.out ]
        then
        echo "***db::do_init_and_become_master Audit Entries***" 
        grep Location output/ServerDB-RunRecipe-MakeMaster.out 
        echo ""
        fi


#ServerLB-Launch.out
if [ -f output/ServerLB-Launch.out ]
        then
        echo "***LB1 and LB2 Current Instance IDs***" 
        grep Location output/ServerLB-Launch.out 
        echo ""
        fi



#ServerAPP-Launch.out
if [ -f output/ServerAPP-Launch.out ]
        then
        echo "***APP1 and APP2 Current Instance IDs***" 
        grep Location output/ServerAPP-Launch.out 
        echo ""
        fi


#RightScript-APP-Import.out
if [ -f output/RightScript-APP-Import.out ]
        then
        echo "***End2End Script ID***" 
        grep Location output/RightScript-APP-Import.out 
        echo ""
        fi


#ServerAPPs-RunScript-E2EDemo.out
if [ -f output/RunScript-E2EDemo.out ]
        then
        echo "***End2End Script Audit Entries***" 
        grep Location output/RunScript-E2EDemo.out 
        echo ""
        fi



