# release
FROM openjdk:16-jdk-alpine
ARG VERSION=${VERSION}
WORKDIR /app

# копируем CA-сертификат Яндекса в образ
RUN apk add curl \
#    && mvn package -Dversion.application=sausage-store-${VERSION}
    && rm -rf /var/cache/apk/* \
    && curl https://storage.yandexcloud.net/cloud-certs/CA.pem -o YandexInternalRootCA.crt \
    && keytool -importcert -file YandexInternalRootCA.crt \
    -alias yandex -cacerts -storepass changeit -noprompt \
    && rm -rf YandexInternalRootCA.crt \
    && addgroup --system jaruser \
    && adduser -S -s /bin/false -G jaruser jaruser -D -H \
    && apk add --no-cache dumb-init==1.2.5-r0
COPY --chown=jaruser:jaruser \
     ./sausage-store.jar ./sausage-store.jar
EXPOSE 8080
# приложение будет запускаться под пользователем jaruser
USER jaruser
ENTRYPOINT ["dumb-init", "java", "-jar", "-Dmyserver.bindPort=8080", "./sausage-store.jar"]
