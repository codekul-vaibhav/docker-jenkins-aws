FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} jenkins-docker-aws-0.0.1-SNAPSHOT.jar.jar
ENTRYPOINT ["java","-jar","/jenkins-docker-aws-0.0.1-SNAPSHOT.jar.jar"]
