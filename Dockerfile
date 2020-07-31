FROM tomcat:8
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/*.war /usr/local/tomcat/webapps/sparkjava-hello-world-1.0.war
CMD ["catalina.sh","run"]
