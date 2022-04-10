#!/bin/sh
set +e

SPRING_VAULT_HOST=${SPRING_VAULT_HOST}
SPRING_VAULT_TOKEN=${SPRING_VAULT_TOKEN}

cat <<EOF | docker exec -i vault ash
  sleep 10;
  vault login ${VAULT_DEV_ROOT_TOKEN_ID}

  vault secrets enable -path=secret kv

  vault kv put secret/sausage-store spring.datasource.password="${SPRING_DATASOURCE_PASSWORD}" spring.data.mongodb.uri="mongodb://${SPRING_DATA_MONGODB_USERNAME}:${SPRING_DATA_MONGODB_PASSWORD}@${SPRING_DATA_MONGODB_HOST}:${SPRING_DATA_MONGODB_PORT}/${SPRING_DATA_MONGODB_DATABASE}?tls=true"
EOF