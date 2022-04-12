#!/bin/bash
cd /home/jarservice/project/sausage-store
set +e
touch .env.front
cat > .env.front <<EOF
VERSION=${VERSION}
EOF
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
#sudo docker-compose build || true
#sudo docker-compose stop backend2 || true
#sudo docker-compose rm backend2 || true
set -e
sudo docker-compose --env-file .env.front up -d --no-deps --build frontend