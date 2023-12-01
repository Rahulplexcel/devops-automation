FROM FROM openjdk:22-slim
EXPOSE 8080
ADD target/devops-integration.jar devops-automation.jar
ENTRYPOINT ["java","-jar","/devops-automation.jar"]
