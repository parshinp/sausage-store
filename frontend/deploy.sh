#! /bin/bash
set -xe

sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service

curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store.tar.gz ${NEXUS_REPO_URL}/sausage-store-parshin_pavel-frontend/$VERSION/sausage-store-$VERSION.tar.gz >> /${DEV_USER}/tar_version.log

tar xvf sausage-store.tar.gz

cd sausage-store-$VERSION/public_html/

sudo cp -rf * /var/www-data/dist/frontend 

#Обновляем конфиг systemd с помощью рестарта
sudo systemctl daemon-reload

#Перезапускаем сервис frontend сосисочной
sudo systemctl restart sausage-store-frontend.service

