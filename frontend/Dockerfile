FROM nginxproxy/nginx-proxy
ARG VERSION
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN ls -la && cp -r public_html/* /usr/share/nginx/html/ && cp nginx.tmpl /usr/src/app
EXPOSE 80
#ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://backend2:8080"]
