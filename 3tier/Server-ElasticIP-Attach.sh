#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

NEXTLB1="AEMOJCAPQTR1O"
NEXTLB2="25OE4ROCCCVKS"

#Either Hard code the values
#EIP1="1SFPJ9HH48PF9"
#EIP2="B50R3SRMABS0D"
#CLOUD="1"            # Specify the Cloud to add the Server Array to


#Or read them in programatically
EIP1=`grep Location output/ElasticIPs-Create.sh.out|cut -c 38-|tr -d '\r' | sed -n 1p`
EIP2=`grep Location output/ElasticIPs-Create.sh.out|cut -c 38-|tr -d '\r' | sed -n 2p`
CLOUD=`grep CLOUD LabInfo | cut -c 7-|tr -d '\r'`

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ip_address_binding[instance_href]=/api/clouds/$CLOUD/instances/$NEXTLB1 \
-d ip_address_binding[public_ip_address_href]=/api/clouds/$CLOUD/ip_addresses/$EIP1 \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_address_bindings \
| tee output/${0##*/}.out

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ip_address_binding[instance_href]=/api/clouds/$CLOUD/instances/$NEXTLB2 \
-d ip_address_binding[public_ip_address_href]=/api/clouds/$CLOUD/ip_addresses/$EIP2 \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_address_bindings \
| tee -a output/${0##*/}.out
