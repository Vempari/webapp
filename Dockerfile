FROM maven:3.6.1-jdk-8-alpine AS mavenbuildfirst
COPY . webapp
RUN cd webapp && mvn clean install
EXPOSE 5555


FROM jboss/wildfly
COPY --from=mavenbuildfirst /webapp/target/webapp.war /opt/jboss/wildfly/standalone/deployments/
RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin#70365 --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
EXPOSE 9990
