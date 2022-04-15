#build front
FROM node:14.17.3
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install && npm run build && ls -la /usr/src/app
#RUN npm install -g http-server
#RUN npm run build

#release front
#FROM nginxproxy/nginx-proxy
#ARG VERSION
# Create app directory
#WORKDIR /usr/src/app
#COPY ${CI_PROJECT_DIR}/frontend/sausage-store-${VERSION} .
#RUN ls -la && cp -r public_html/* /usr/share/nginx/html/ && cp nginx.tmpl /usr/src/app
#EXPOSE 80
#ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://backend2:8080"]
