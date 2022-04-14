FROM nginxproxy/nginx-proxy
ARG VERSION=${VERSION}
# Create app directory
WORKDIR /usr/src/app
COPY ${CI_PROJECT_DIR}/frontend/sausage-store-${VERSION} .
RUN ls -la && cp -r public_html/* /usr/share/nginx/html/ && cp nginx.tmpl /usr/src/app
EXPOSE 80
#ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://backend2:8080"]
