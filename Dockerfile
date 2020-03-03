FROM openjdk:11-jdk-slim

ARG version=1.0-SNAPSHOT
ARG SERVICE_VER=1.0-SNAPSHOT
ARG CLIENT_VER=1.0-SNAPSHOT

ENV ZAFIRA_VERSION=${SERVICE_VER} \
    ZAFIRA_CLIENT_VERSION=${CLIENT_VER}

RUN mkdir /opt/assets

COPY startup.sh /

RUN chmod +x /startup.sh

COPY ./sources/zafira-web/build/libs/zafira-web-${version}.jar /app/zafira-service.jar

EXPOSE 8080
EXPOSE 5005