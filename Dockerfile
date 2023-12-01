FROM openjdk:17
EXPOSE 8080
ADD target/devops-integration.jar devops-automation.jar
ENTRYPOINT ["java","-jar","/devops-automation.jar"]
