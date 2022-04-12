#!/bin/bash
cd /home/jarservice/project/sausage-store
set +e
touch .env.report
cat > .env.report <<EOF
SPRING_VAULT_HOST=${SPRING_VAULT_HOST}
SPRING_VAULT_TOKEN=${SPRING_VAULT_TOKEN}
VERSION=1.0.0
EOF
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
set -e
sudo docker-compose --env-file .env.report up -d --no-deps --build backend-report