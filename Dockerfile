FROM openjdk:11
# LABEL maintainer="himanshubector"
EXPOSE 8080
# COPY target/*.jar customer-service.jar
ADD target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]



