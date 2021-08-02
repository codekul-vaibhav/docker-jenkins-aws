FROM openjdk:8

ADD target/jenkins-docker-aws-0.0.1-SNAPSHOT.jar jenkins-docker-aws.jar

<<<<<<< HEAD
EXPOSE 8081 8082
=======
EXPOSE 8081
EXPOSE 8082
>>>>>>> production

ENTRYPOINT ["java","-jar","jenkins-docker-aws.jar"]

