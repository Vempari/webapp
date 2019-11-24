FROM maven:latest AS mainmaven
COPY lib webapp
COPY src webapp
COPY pom.xml webapp
RUN cd webapp && mvn clean install
RUN cd /webapp/target/ && ls

FROM tomcat:9-jre8-alpine
RUN cd /usr/local/tomcat/webapps && ls
RUN cd / && ls
COPY --from=mainmaven /webapp/target .
RUN cd / && ls
WORKDIR /usr/local/tomcat
EXPOSE 8080
