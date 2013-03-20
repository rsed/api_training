#!/bin/bash

access_token="eNotkF1vgjAYRv9Lr21i-5ZSSHaBHxiiEmFuyu5qW4QEWLDFsRj_-zDZ5ZM851ycB5IoRIPFgGZIWxQ-pmFuKKSMMXjOkFMoJMDB9_k88Geo1tP_YkCyslQ4IExiQgzFIggEJhQIBFR42ujJ58w_K4C-2EmPek8LM57StP3Ijn10LX4bm0e3z0pTzyXkZqUDLFglsjIr9M_83Cm1Lt_TouLLLc5zxjVIP70quDSsXpuvvI2qJDqs5NC1m1XSciyX6-idL2wUn2tHN9be6y5rxo0fHwzZ3_P4uEqF3PG9O1Z9XDbtQPvtONRJsdA7V-XuNNbOePO3V5LxlUQq9T10DoUAxKfP5x99_l1e"
 
curl --include \
     -H "X-API-Version:1.5" \
     -H "Authorization: Bearer $access_token" \
     --request GET "https://us-3.rightscale.com/api/deployments.xml"


