FROM maven:3.6-jdk-8-slim as build-container
WORKDIR /workdir
COPY pom.xml /workdir/
RUN ["mvn", "verify", "clean", "--fail-never"]
COPY . /workdir/
RUN mvn clean install -DskipTests=true

from openjdk:8-slim
MAINTAINER Mihalcea Mihai
COPY entrypoint.sh /usr/local/bin/
RUN apt update -y \
    && apt install -y net-tools \
    && apt auto-remove -y \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && mkdir /app \


COPY --from=build-container /workdir/target/*.jar /app/
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["springboot-postgres-docker-aws-0.0.1-SNAPSHOT.jar"]
