FROM maven:3.6.1-jdk-8-alpine AS mavenbuildfirst
COPY . webapp
RUN cd webapp && mvn clean install
RUN cd /webapp/target/ && ls
EXPOSE 5555


FROM tomcat:9-jre8-alpine
RUN cd /usr/local/tomcat/webapps && ls
COPY --from=mavenbuildfirst /webapp/target/webapp.war /usr/local/tomcat/webapps/
RUN cd /usr/local/tomcat/webapps && ls
WORKDIR /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]