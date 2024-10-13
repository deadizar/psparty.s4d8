# Thx: https://betterstack.com/community/guides/scaling-nodejs/dockerize-nodejs/#step-2-creating-a-docker-image-for-your-node-js-app

FROM node:16-alpine
FROM ubuntu:latest
LABEL authors="deadizar"

WORKDIR -/server

# Copy the package.json and package-lock.json files to the /build directory
COPY package.json ./
COPY package-lock.json ./

# Install production dependencies and clean the cache
RUN npm ci --omit=dev && npm cache clean --force

COPY . .

EXPOSE 443
CMD ["node", "./psparty.xomox/server/resources/app/main.js", "--headless", "--dataPath=./../data" ]
