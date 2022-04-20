#!/bin/sh
cd /home/jarservice/project/sausage-store
set -e

sudo docker-compose up -d vault

cat <<EOF | sudo docker exec -i vault ash
sleep 10;
vault login ${SPRING_VAULT_TOKEN}

vault kv put secret/sausage-store spring.datasource.username=${PSQL_USER} \
spring.datasource.password=${PSQL_PASSWORD} \
spring.data.mongodb.uri=${MONGO_DATA} \
spring.datasource.url=${PSQL_HOST}
EOF
