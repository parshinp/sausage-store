#!/bin/bash
cd /home/jarservice/project/sausage-store
set +e
touch .env.back
cat > .env.back <<EOF
SPRING_VAULT_HOST=${SPRING_VAULT_HOST}
SPRING_VAULT_TOKEN=${SPRING_VAULT_TOKEN}
VERSION=${VERSION}
EOF
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-backend:$VERSION
#sudo docker stop backend2 && sudo docker rm backend2
set -e
sudo docker-compose --env-file .env.back up -d green
sudo docker-compose --env-file .env.back up -d blue
