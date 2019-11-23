FROM tomcat:9-jre8-alpine
COPY ./target/webapp.war /usr/local/tomcat/webapps/docker.war
WORKDIR /usr/local/tomcat
EXPOSE 8080