FROM openjdk:8

ADD target/jenkins-docker-aws-0.0.1-SNAPSHOT.jar  /var/snap/docker/common/var-lib-docker/tmp/docker-builder298794008/target/jenkins-docker-aws-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","jenkins-docker-aws.jar"]

