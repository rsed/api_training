#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

#Either Hard code the values
#NEXTLB1="25OE4ROCCCVKS"
#NEXTLB2="25OE4ROCCCVKS"
#EIP1="1SFPJ9HH48PF9"
#EIP2="B50R3SRMABS0D"
#CLOUD="1"

#Or read them in programatically 
#These next 2 lines re a messs. They work, but could be tidied up!
LB1=`egrep Location output/07_Servers-Create.sh.out|cut -c 11-|tr -d '\r' |sed -n 1p`
NEXTLB1INSTANCE=`curl -s -H X-API-Version:1.5 -b ~/mycookie -X GET https://us-3.rightscale.com$LB1 |python -mjson.tool | grep instances | awk '{split($2,a,"\""); print a[2]}' | tr -d '\r'`

LB2=`egrep Location output/08_Servers-Clone.sh.out |cut -c 11-|tr -d '\r' |sed -n 1p`
NEXTLB2INSTANCE=`curl -s -H X-API-Version:1.5 -b ~/mycookie -X GET https://us-3.rightscale.com$LB2 |python -mjson.tool | grep instances | awk '{split($2,a,"\""); print a[2]}' | tr -d '\r'`

EIP1=`grep Location output/04_ElasticIPs-Create.sh.out|cut -c 38-|tr -d '\r' | sed -n 1p`
EIP2=`grep Location output/04_ElasticIPs-Create.sh.out|cut -c 38-|tr -d '\r' | sed -n 2p`
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`

cd /opt/api/3tier

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d ip_address_binding[instance_href]=$NEXTLB1INSTANCE \
-d ip_address_binding[public_ip_address_href]=/api/clouds/$CLOUD/ip_addresses/$EIP1 \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_address_bindings \
| tee output/${0##*/}.out

curl -s -i -H X-API-Version:1.5 -b ~/mycookie -X POST \
-d ip_address_binding[instance_href]=$NEXTLB2INSTANCE \
-d ip_address_binding[public_ip_address_href]=/api/clouds/$CLOUD/ip_addresses/$EIP2 \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_address_bindings \
| tee -a output/${0##*/}.out
