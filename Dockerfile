FROM maven:3.9.6-eclipse-temurin-11 AS builder

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN java -version && \
    mvn -version && \
    git --version

WORKDIR /app
