#!/bin/bash
cd /home/jarservice/project/sausage-store
set +e
touch .env.report
cat > .env.report <<EOF
SPRING_VAULT_HOST=${SPRING_VAULT_HOST}
SPRING_VAULT_TOKEN=${SPRING_VAULT_TOKEN}
VERSION=${VERSION}
EOF
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-backend-report:$VERSION
sudo docker stop report && sudo docker rm report
set -e
sudo docker-compose --env-file .env.report up -d backend-report