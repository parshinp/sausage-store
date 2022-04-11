#!/bin/sh
set +e


sudo docker stop vault && sudo docker rm vault
sudo docker run -d --cap-add=IPC_LOCK --name vault -p 8200:8200 -e 'VAULT_DEV_ROOT_TOKEN_ID=myroot' -e 'VAULT_SERVER=http://127.0.0.1:8200' -e 'VAULT_ADDR=http://127.0.0.1:8200' vault

cat <<EOF | sudo docker exec -i vault ash
sleep 10;
vault login myroot

vault secrets enable -path=secret kv

vault kv put secret/sausage-store spring.datasource.username=sa \
spring.datasource.password=password \
spring.data.mongodb.uri=mongodb://parshin:Testusr1234@rc1b-nczpq63snuc5a3z2.mdb.yandexcloud.net:27018/parshin?tls=true \
spring.datasource.url=jdbc:postgresql://c-c9qslvj961omn1nevnjl.rw.mdb.yandexcloud.net:6432/testdb
EOF
