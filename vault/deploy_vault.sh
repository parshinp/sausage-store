#!/bin/sh
set +e

SPRING_VAULT_HOST=${SPRING_VAULT_HOST}
SPRING_VAULT_TOKEN=${SPRING_VAULT_TOKEN}

cat <<EOF | docker exec -i vault ash
  sleep 10;
  vault login ${SPRING_VAULT_TOKEN}

  vault secrets enable -path=secret kv

  vault kv put secret/sausage-store spring.datasource.username=sa \
  spring.datasource.password=password \
  spring.data.mongodb.uri=mongodb://parshin:Testusr1234@rc1b-nczpq63snuc5a3z2.mdb.yandexcloud.net:27018/parshin?tls=true \
  spring.datasource.url=jdbc:postgresql://c-c9qslvj961omn1nevnjl.rw.mdb.yandexcloud.net:6432/testdb
EOF