#Pull base  image.
FROM tomcat:8.0.43-jre8

MAINTAINER ckeita@e-biz.fr

# Configure tomcat management
COPY /home/ebiz/apache-tomcat-8.0.43/conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Copy war file
COPY /home/cdb/computer-database-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/computer-database-0.0.1-SNAPSHOT.war

# Expose
EXPOSE 8080

# Restart service
CMD ["catalina.sh", "run"]
