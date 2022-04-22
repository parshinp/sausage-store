#!/bin/bash
cd /home/jarservice/project/sausage-store
set +e
touch .env.back
cat > .env.back <<EOF
SPRING_VAULT_HOST=${SPRING_VAULT_HOST}
SPRING_VAULT_TOKEN=${SPRING_VAULT_TOKEN}
VERSION=$VERSION
EOF
#sudo docker login -u parshin gitlab.praktikum-services.ru:5050 -p
sudo docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
set -e


# BLUE and GREEN runs
if [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' green )" == "healthy" ] && [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' blue )" == "healthy" ];
then sudo docker-compose stop green && sudo docker rm green && sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-backend:$VERSION && sudo docker-compose --env-file=.env.back up -d green
while [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' green )" != "healthy" ]; do
        sleep 1;
done
sudo docker-compose stop blue; exit;
fi


# BLUE and GREEN stopped
if [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' green )" == "unhealthy" ] && [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' blue )" == "unhealthy" ];
then sudo docker rm green && sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-backend:$VERSION && sudo docker-compose --env-file=.env.back up -d green
while [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' green )" != "healthy" ]; do
        sleep 1;
done
exit;
fi


# BLUE runs GREEN stopped
if [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' green )" == "unhealthy" ] && [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' blue )" == "healthy" ];
then sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-backend:$VERSION && sudo docker-compose --env-file=.env.back up -d green
while [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' green )" != "healthy" ]; do
        sleep 1;
done
sudo docker-compose stop blue; exit;
fi


# BLUE stopped GREEN runs
if [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' green )" == "healthy" ] && [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' blue )" == "unhealthy" ];
then sudo docker pull gitlab.praktikum-services.ru:5050/parshin/sausage-store/sausage-backend:$VERSION && sudo docker-compose --env-file=.env.back up -d blue
while [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' blue )" != "healthy" ]; do
        sleep 1;
done
sudo docker-compose stop green; exit;
fi

