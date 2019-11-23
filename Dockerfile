FROM maven:3-jdk-8 AS main
COPY src webapp
COPY pom.xml webapp
RUN cd webapp && mvn clean install


FROM tomcat:9-jre8-alpine
COPY --from=main webapp/target/webapp.war usr/local/tomcat/webapps/docker.war
WORKDIR /usr/local/tomcat
EXPOSE 8080