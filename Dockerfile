# --- 1단계: Maven으로 빌드 ---
# Maven 3.8 버전과 Java 11을 기반으로 하는 이미지를 "build"라는 별명으로 사용
# (만약 Java 17 등을 쓰신다면 3.8-openjdk-17 등으로 변경)
FROM maven:3.8-openjdk-11 AS build

# 소스코드를 Docker 이미지 내부의 /app 디렉토리로 복사
COPY src /app/src
COPY pom.xml /app

# /app 디렉토리에서 mvn package 명령어를 실행하여 target 폴더와 .war 파일을 생성
# -DskipTests=true 옵션으로 테스트를 건너뛰어 빌드 속도를 높입니다.
RUN mvn -f /app/pom.xml package -DskipTests=true

# --- 2단계: Tomcat으로 실행 ---
# Tomcat 9.0 이미지를 최종 이미지로 사용
FROM tomcat:9.0

# 1단계("build")에서 생성된 .war 파일을
# Tomcat의 webapps 폴더로 복사합니다.
# 이때 파일 이름을 ROOT.war로 변경하면 / (루트 경로)로 바로 접속됩니다.
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat 실행
CMD ["catalina.sh", "run"]
