FROM maven:3.8.4-openjdk-17 as builder
WORKDIR /opt/services
COPY . .
RUN mvn -f /opt/services/pom.xml clean package -Dmaven.test.skip=true

# FROM eclipse-temurin:17-jre
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /opt/services/target/*.jar /app/kindergarten.jar
COPY /app/service-account-key.json /app/service-account-key.json
ENTRYPOINT ["java", "-jar", "/app/kindergarten.jar"]

