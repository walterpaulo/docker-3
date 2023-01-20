FROM tomcat:8.0-alpine

LABEL maintainer=”walter”

ADD target/*.war /usr/local/tomcat/webapps/home.war 

EXPOSE 8080

# CMD [“catalina.sh”, “run”]