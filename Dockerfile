FROM maven:3.8-openjdk-11 AS build

COPY src /app/src
COPY pom.xml /app

RUN mvn -f /app/pom.xml package -DskipTests=true

FROM tomcat:9.0
\
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat 실행
CMD ["catalina.sh", "run"]
