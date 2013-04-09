#!/bin/bash


sed -i -r "s/output\/SecurityGroup-Create.sh/output\/01_SecurityGroup-Create.sh/i" *
sed -i -r "s/output\/SecurityGroupRules-Create.sh/output\/02_SecurityGroupRules-Create.sh/i" *
sed -i -r "s/output\/SSHKey-Create.sh/output\/03_SSHKey-Create.sh/i" *
sed -i -r "s/output\/ElasticIPs-Create.sh/output\/04_ElasticIPs-Create.sh/i" *
sed -i -r "s/output\/ServerTemplates_Import.sh/output\/05_ServerTemplates_Import.sh/i" *
sed -i -r "s/output\/Deployment-Create.sh/output\/06_Deployment-Create.sh/i" *
sed -i -r "s/output\/Deployment-Create__WithConfirmation.sh/output\/06_Deployment-Create__WithConfirmation.sh/i" *
sed -i -r "s/output\/Servers-Create.sh/output\/07_Servers-Create.sh/i" *
sed -i -r "s/output\/Servers-Clone.sh/output\/08_Servers-Clone.sh/i" *
sed -i -r "s/output\/Servers-Clone-Rename.sh/output\/09_Servers-Clone-Rename.sh/i" *
sed -i -r "s/output\/Server-ElasticIP-Attach.sh/output\/10_Server-ElasticIP-Attach.sh/i" *
sed -i -r "s/output\/DeployLevelInputs-MySQL-Set.sh/output\/11_DeployLevelInputs-MySQL-Set.sh/i" *
sed -i -r "s/output\/ServerDB-Launch.sh/output\/12_ServerDB-Launch.sh/i" *
sed -i -r "s/output\/ServerDB-RunRecipe-LoadDB.sh/output\/13_ServerDB-RunRecipe-LoadDB.sh/i" *
sed -i -r "s/output\/ServerDB-RunRecipe-MakeMaster.sh/output\/14_ServerDB-RunRecipe-MakeMaster.sh/i" *
sed -i -r "s/output\/DeployLevelInputs-LB-Set.sh/output\/15_DeployLevelInputs-LB-Set.sh/i" *
sed -i -r "s/output\/ServerLB-Launch.sh/output\/16_ServerLB-Launch.sh/i" *
sed -i -r "s/output\/DeployLevelInputs-APP-Set.sh/output\/17_DeployLevelInputs-APP-Set.sh/i" *
sed -i -r "s/output\/ServerAPP-Launch.sh/output\/18_ServerAPP-Launch.sh/i" *
sed -i -r "s/output\/RightScript-APP-Import.sh/output\/19_RightScript-APP-Import.sh/i" *
sed -i -r "s/output\/ServerAPPs-RunScript-E2EDemo.sh/output\/20_ServerAPPs-RunScript-E2EDemo.sh/i" *
sed -i -r "s/output\/SecurityGroupRules-DBAccess-Add.sh/output\/21_SecurityGroupRules-DBAccess-Add.sh/i" *
sed -i -r "s/output\/Array-Create.sh/output\/22_Array-Create.sh/i" *
sed -i -r "s/output\/Array-Enable.sh/output\/23_Array-Enable.sh/i" *
sed -i -r "s/output\/AppServers-ByTag-List.sh/output\/24_AppServers-ByTag-List.sh/i" *
sed -i -r "s/output\/Array-Disable.sh/output\/25_Array-Disable.sh/i" *
sed -i -r "s/output\/TerminateServers-All.sh/output\/26_TerminateServers-All.sh/i" *
sed -i -r "s/output\/Array-Destroy.sh/output\/27_Array-Destroy.sh/i" *
sed -i -r "s/output\/Servers-Destroy.sh/output\/28_Servers-Destroy.sh/i" *
sed -i -r "s/output\/Deployment-Destroy.sh/output\/29_Deployment-Destroy.sh/i" *



