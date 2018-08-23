# configuration-depot
How I made the service
$ cf create-service p-config-server trial configuration-depot-service -c ./config-server.json

How to get the four variables
$ cf service-key configuration-depot-service configuration-depot-service-key
