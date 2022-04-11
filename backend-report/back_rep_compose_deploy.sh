#!/bin/bash
set +e
touch .env.report
cat > .env.report <<EOF
SPRING_VAULT_HOST=${SPRING_VAULT_HOST}
SPRING_VAULT_TOKEN=${SPRING_VAULT_TOKEN}
EOF
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
#sudo docker-compose build || true
#sudo docker-compose stop backend2 || true
#sudo docker-compose rm backend2 || true
set -e
sudo docker-compose --env-file .env.report up -d --no-deps --build backend-report