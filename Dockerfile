FROM alpine:edge
MAINTAINER Hugh Pierce

# Default password
ENV mysql_root_pwd=p@ssw0rd

# Add packages
RUN apk upgrade -U && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing \
    add php7 php7-xml php7-xsl php7-pdo_mysql php7-mcrypt php7-curl \
    php7-json php7-fpm php7-phar php7-openssl php7-mysqli php7-ctype \
    php7-opcache php7-mbstring curl wget git mysql mysql-client bash \ 
    nginx ca-certificates

# Make directories
RUN mkdir -p /var/lib/mysql /etc/mysql/conf.d /etc/nginx/conf.d \
    /var/run/mysql/ /var/www/html /tmp/nginx /var/www/testdb /var/log/mysql \
    /var/log/nginx

# Fix php
RUN sed -i 's@mysqli.default_socket =@mysqli.default_socket = /var/run/mysql/mysql.sock@' /etc/php7/php.ini

# Copy files
COPY html /var/www/html
COPY test_db /var/www/test_db
COPY files/nginx.conf /etc/nginx/
COPY files/my.cnf /etc/mysql/
COPY files/default.conf /etc/nginx/conf.d/
COPY files/mysql.sh /
COPY files/run.sh /

# chmod executables
RUN chmod +x /mysql.sh /run.sh

# Change password from changeme to default
RUN sed -i "s/changeme/$mysql_root_pwd/" /var/www/html/db.php /mysql.sh

# Start mysql, load database, and verify database
RUN /mysql.sh

# Web port
EXPOSE 80

# Start services
ENTRYPOINT [ "/run.sh" ]

