#!/bin/bash
echo getting token...

uri=https://config-dbdc31e5-0eeb-41ed-8d1a-6244d0e4a4df.cfapps.io
access_token_uri=https://p-spring-cloud-services.uaa.run.pivotal.io/oauth/token
client_id=p-config-server-60f69297-1fcf-4191-b84a-90db843ef379
client_secret=5Y8mL0ZkIHnT

token=$(curl $access_token_uri -u $client_id:$client_secret -d grant_type=client_credentials | jq -r .access_token);

#echo $token
echo curling the config server with said token
curl -H "Authorization: bearer $token" -H "Accept: application/json" $uri/app-name/profile | jq

echo Doing company specific request
curl -H "Authorization: bearer $token" -H "Accept: application/json" $uri/company/cloud | jq

echo Doing company specific MADE-UP profile
curl -H "Authorization: bearer $token" -H "Accept: application/json" $uri/company/donkey | jq
