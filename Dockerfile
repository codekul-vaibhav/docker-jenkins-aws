FROM openjdk:8

ADD target/jenkins-docker-aws-0.0.1-SNAPSHOT.jar jenkins-docker-aws.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","jenkins-docker-aws.jar"]

