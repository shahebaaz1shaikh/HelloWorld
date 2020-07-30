FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapps/sparkjava-hello-world-1.0.war
CMD ["catalina.sh","run"]
