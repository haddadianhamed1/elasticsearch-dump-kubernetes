FROM node:8.16.0-alpine
LABEL maintainer="hamed@intertrust.com"
WORKDIR /
RUN npm install elasticdump -g

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
