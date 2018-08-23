#!/bin/bash
source variablesForBash
echo getting token...
#Dynamically created
token=$(curl -s $access_token_uri -u $client_id:$client_secret -d grant_type=client_credentials | jq -r .access_token);
echo TOKEN:$token

#SAMPLE curl -H "Authorization: bearer $token" -H "Accept: application/json" $uri/app-name/profile | jq

echo -e \\nDoing company specific request
curl -sH "Authorization: bearer $token" -H "Accept: application/json" $uri/company/cloud | jq

echo -e \\nDoing company specific MADE-UP profile
curl -sH "Authorization: bearer $token" -H "Accept: application/json" $uri/company/donkey | jq

echo -e \\nDoing roster specific profile
curl -sH "Authorization: bearer $token" -H "Accept: application/json" $uri/roster/cloud | jq
