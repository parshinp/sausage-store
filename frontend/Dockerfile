#build front
FROM node:14.17.3 as builder
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install && npm run build && ls -la /usr/src/app

#release front
FROM nginxproxy/nginx-proxy:1.0-alpine
WORKDIR /app
COPY --from=builder /usr/src/app/dist/* /usr/share/nginx/html/
COPY --from=builder /usr/src/app/nginx.tmpl /app/nginx.tmpl

