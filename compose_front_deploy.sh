#!/bin/bash
cd /home/jarservice/project/sausage-store
set +e
touch .env.front
cat > .env.front <<EOF
VERSION=${VERSION}
EOF
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/frontend:$VERSION
sudo docker stop loadbalancer && sudo docker rm loadbalancer
set -e
sudo docker-compose --env-file .env.front up -d loadbalancer --no-build