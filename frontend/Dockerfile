#build front
FROM node:14.17.3
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install && npm run build && ls -la /usr/src/app
#RUN npm install -g http-server
#RUN npm run build

#release front
FROM nginxproxy/nginx-proxy
#ARG VERSION
# Create app directory
WORKDIR /app
COPY --from=builder /usr/src/app/dist/* /usr/share/nginx/html/
RUN cp nginx.tmpl .
#EXPOSE 80
#ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://backend2:8080"]
