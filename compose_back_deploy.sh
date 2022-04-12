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
set -e
sudo docker-compose --env-file .env.back up -d backend
