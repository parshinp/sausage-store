FROM node:14-alpine
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install -g http-server
EXPOSE 80
ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://backend2:8080"]
