#Pull base  image.
FROM tomcat:8.0.43-jre8

MAINTAINER ckeita@e-biz.fr

#Configure tomcat management
ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

#Expose
EXPOSE 8080

#Restart service
CMD ["catalina.sh", "run"]
