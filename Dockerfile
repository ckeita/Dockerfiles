# Pull base  image.
FROM chegoujk/java8:java8

# MAINTAINER
MAINTAINER ckeita@e-biz.fr

WORKDIR /home/

# Download jenkins
RUN wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war

# Web interface port
EXPOSE 8080

# Agents port
EXPOSE 50000

# Install git
RUN apt-get update && apt-get -y install git

# RUN the .war
CMD ["java", "-jar", "/home/jenkins.war"]
