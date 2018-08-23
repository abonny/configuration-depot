#!/bin/bash
#PRECONDITION
if [ $# -lt 1 ] || [ $# -gt 1 ]
then 
  echo "Need to pass a SINGLE param"
  exit 0
fi
#echo passed:$1

source variablesForBash
echo getting encrypted value...

curl -X POST -H "Authorization: $(cf oauth-token)" $uri/encrypt -d "$1"
