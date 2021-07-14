FROM openjdk:8

ADD target/jenkins-docker-aws.jar jenkins-docker-aws.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","jenkins-docker-aws.jar"]

