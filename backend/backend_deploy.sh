#!/bin/bash
set +e
cat > .env <<EOF
SPRING_DATASOURCE_URL=${SPRING_DATASOURCE_URL}
SPRING_DATASOURCE_USERNAME=${SPRING_DATASOURCE_USERNAME}
SPRING_DATASOURCE_PASSWORD=${SPRING_DATASOURCE_PASSWORD}
SPRING_DATA_MONGODB_URI=mongodb://parshin:Testusr1234@rc1b-nczpq63snuc5a3z2.mdb.yandexcloud.net:27018/parshin?tls=true
EOF
pwd
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
sudo docker network create -d bridge sausage_network || true
sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-backend:latest
sudo docker stop backend || true
sudo docker rm backend || true
set -e
sudo docker run -d --name backend \
    --network=sausage_network \
    --restart=always \
    --pull=always \
    --env-file .env \
    gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-backend:latest