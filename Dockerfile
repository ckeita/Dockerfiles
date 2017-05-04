#Pull base  image.
FROM chegoujk/java8:8u131

#MAINTAINER
MAINTAINER ckeita@e-biz.fr

#Add src files
ADD src /home/cdb/src

#Add POM
ADD pom.xml /home/cdb/pom.xml

# Install maven.
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get install -y maven 

WORKDIR /home/cdb

#Build cdb
RUN mvn clean package

#Running
#ADD run.sh /home/run.sh

CMD ["mvn"]

