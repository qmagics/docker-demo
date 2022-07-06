##### 基础版本
# FROM node:16-alpine

# WORKDIR /docker-demo
# ADD . /docker-demo

# RUN npm install
# RUN npm run build
# CMD npm start

# EXPOSE 8080


##### 优化版本
FROM node:16-alpine as builder

WORKDIR /docker-demo

ADD package.json /docker-demo/
RUN npm install

ADD . /docker-demo

RUN npm run build

FROM nginx:alpine

COPY --from=builder docker-demo/dist/ /usr/share/nginx/html/

EXPOSE 3333