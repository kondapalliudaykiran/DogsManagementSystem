FROM maven:3.2-jdk-8 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM openjdk:8-jre-alpine
COPY --from=build /target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
CMD ["java", "-jar", "DogsManagementSystem.jar"]