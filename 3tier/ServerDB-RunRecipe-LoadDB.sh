#!/bin/bash -e 

# This script is for use in the API Training Course
# Written by John Fitzpatrick, March 2013

CURRDBINSTANCE="969GBPOIMG8QI" #Current DB Instance ID
CLOUD="1"                      #Target Cloud ID number

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
-d recipe_name="db::do_dump_import" \
https://us-3.rightscale.com/api/clouds/$CLOUD/instances/$CURRDBINSTANCE/run_executable \
| tee output/ServerDB-RunRecipe-LoadDB.out
