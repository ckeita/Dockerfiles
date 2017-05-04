#base image
FROM ubuntu:16.04

#maintainer of the image
MAINTAINER ckeita@e-biz.fr

#Add sql scripts
ADD 1-SCHEMA.sql 2-PRIVILEGES.sql 3-ENTRIES.sql /tmp/

#Installing mysql
RUN apt-get update && \
    apt-get install -y debconf-utils && \
    echo mysql-server-5.7 mysql-server/root_password password keitas88 | debconf-set-selections && \
    echo mysql-server-5.7 mysql-server/root_password_again password keitas88 | debconf-set-selections && \
    apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

#Bind anywhere
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/mysql.conf.d/mysqld.cnf 

#start mysql
RUN /etc/init.d/mysql start

#open mysql port
EXPOSE 3306

#run mysql
CMD ["mysqld"]
