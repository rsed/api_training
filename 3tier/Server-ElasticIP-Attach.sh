#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

LB1="CN714V9PPF66L"
LB2="3VD6OLAPL74EP"
IP1="1SFPJ9HH48PF9"
IP2="B50R3SRMABS0D"
CLOUD="1"

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ip_address_binding[instance_href]=/api/clouds/$CLOUD/instances/$LB1 \
-d ip_address_binding[public_ip_address_href]=/api/clouds/$CLOUD/ip_addresses/$IP1 \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_address_bindings

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d ip_address_binding[instance_href]=/api/clouds/$CLOUD/instances/$LB2 \
-d ip_address_binding[public_ip_address_href]=/api/clouds/$CLOUD/ip_addresses/$IP2 \
https://us-3.rightscale.com/api/clouds/$CLOUD/ip_address_bindings
