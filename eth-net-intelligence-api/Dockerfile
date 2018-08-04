FROM keymetrics/pm2:8-alpine

RUN apk update && apk add git

RUN git clone https://github.com/mpitid/eth-net-intelligence-api /app

WORKDIR /app

RUN npm install --production
