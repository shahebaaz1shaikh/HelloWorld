From tomcat:8.0.51-jre8-alpine
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/*.war /usr/local/tomcat/webapps/sparkjava-hello-world-1.0.war
CMD ["catalina.sh","run"]

