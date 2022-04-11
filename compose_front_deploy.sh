#!/bin/bash
/home/jarservice/project/sausage-store
set +e
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
#sudo docker-compose build || true
#sudo docker-compose stop backend2 || true
#sudo docker-compose rm backend2 || true
set -e
sudo docker-compose up -d --no-deps --build frontend