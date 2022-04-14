FROM nginxproxy/nginx-proxy
ARG VERSION=${VERSION}
ARG CI_PROJECT_DIR=${CI_PROJECT_DIR}
# Create app directory
WORKDIR /usr/src/app
COPY ./tmp/public/* /usr/share/nginx/html/
#RUN ls -la ${CI_PROJECT_DIR}
# && cp -r public_html/* /usr/share/nginx/html/ && cp nginx.tmpl /usr/src/app
EXPOSE 80
#ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://backend2:8080"]
