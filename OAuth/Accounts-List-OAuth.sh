#!/bin/bash

access_token="eNotkFtvgjAARv9Ln21CLwIl2QO3QYgVZWqcLwZLq5UxptAoM_73YbLHL_nOeTgPUAIPmA4SMAFVB7zHOOQVeJhSSp4T0AvgIWITx6XURROgq_FPCaFCUgsyNJUQIYmhSxwFlWQOQ6WDlBSjr5f_LEP2ix31YMPdZt7LDct4kc-tRW-ZmcptC12-ppal2ipRea6StQ8vmuPVb7ibd7Osdd4PbPkBI3yuu85PzkjnwXEXut26vcW3n9h3Rbo0h12gVzU3n1VUXFHRGJ1pHOG4P4ZheiKLLS8zyi9p2p5mq7oawiA-b9mVMzYU9ULfg2YPE9bQoTb7Qby9ktxfSUohWvPdA48Q5ODn8w_VWFx4"
 
curl --include \
     -H "X-API-Version:1.5" \
     -H "Authorization: Bearer $access_token" \
     --request GET "https://us-3.rightscale.com/api/session.xml"

