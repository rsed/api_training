#!/bin/bash -e

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

LBSERVER1="670392003"  #Server ID for 'myname Load Balancer 1'
LBSERVER2="670395003"  #Server ID for 'myname Load Balancer 2'

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$LBSERVER1/launch.xml \
| tee output/ServerLB-Launch.out

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$LBSERVER2/launch.xml \
| tee -a output/ServerLB-Launch.out

