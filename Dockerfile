#Pull base  image.
FROM chegoujk/java8:java8

#MAINTAINER
MAINTAINER ckeita@e-biz.fr

# Install maven.
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get install -y maven 

CMD ["mvn"]

