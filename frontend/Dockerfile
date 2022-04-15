#build front
FROM node:14.17.3 as builder
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
#RUN addgroup --system jaruser \
#    && adduser -S -s /bin/false -G jaruser jaruser -D -H
COPY --from=builder /usr/src/app/dist/* /usr/share/nginx/html/
RUN cp /usr/src/app/nginx.tmpl .
#EXPOSE 80
#ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://backend2:8080"]
