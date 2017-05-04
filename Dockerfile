#Pull base  image.
FROM chegoujk/java8:8u131

MAINTAINER ckeita@e-biz.fr

# Create tomcat user
RUN groupadd tomcat && \
    useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Download and install
RUN cd /tmp && \
    wget http://mirrors.standaloneinstaller.com/apache/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz && \
    mkdir /opt/tomcat && \
    tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

#Permissions
RUN cd /opt/tomcat && \
    chgrp -R tomcat /opt/tomcat && \
    chmod -R g+r conf && \
    chmod g+x conf && \
    chown -R tomcat webapps/ work/ temp/ logs/

#Configure tomcat management
ADD tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

#Expose
EXPOSE 8080

#Restart service
CMD ["/opt/tomcat/bin/catalina.sh","run"]
