#!/bin/bash
set +e
#
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
sudo docker network create -d bridge sausage_network || true
sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-frontend:$VERSION
sudo docker stop frontend || true
sudo docker rm frontend || true
set -e
sudo docker run -d --name frontend \
    --network=sausage_network \
    --publish 80:80 \
    --restart always \
    --pull always \
    gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-frontend:$VERSION