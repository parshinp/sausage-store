# release report
FROM openjdk:16
#ARG VERSION
WORKDIR /usr/src/app

# копируем CA-сертификат Яндекса в образ
# RUN apk add curl \
#    && mvn package -Dversion.application=sausage-store-${VERSION}
#    && rm -rf /var/cache/apk/* \
RUN curl https://storage.yandexcloud.net/cloud-certs/CA.pem -o YandexInternalRootCA.crt \
    && keytool -importcert -file YandexInternalRootCA.crt \
    -alias yandex -cacerts -storepass changeit -noprompt \
    && rm -rf YandexInternalRootCA.crt \
#    && addgroup --system jaruser \
#    && adduser -S -s /bin/false -G jaruser jaruser -D -H \
#    && apk add --no-cache dumb-init==1.2.5-r0 \
#    && pwd \
#    && ls -la
#COPY --chown=jaruser:jaruser \
#     ./sausage-store-report-${VERSION}.jar ./sausage-store-report.jar
COPY ./sausage-store-report-${VERSION}.jar ./sausage-store-report.jar
EXPOSE 8081
# приложение будет запускаться под пользователем jaruser
USER jaruser
ENTRYPOINT ["java", "-jar", "--service.port=8081", "./sausage-store-report.jar"]