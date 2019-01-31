FROM php:5.6-alpine

LABEL maintainer="Moisei Rabinovich @ gmail"
RUN apk --update add subversion
RUN mkdir -p /var/www
RUN svn export --username guest --password "" http://websvn.tigris.org/svn/websvn/trunk /var/www/html
WORKDIR /var/www/html
COPY config.php /var/www/html/include

RUN sed -i 's/--trust-server-cert/--trust-server-cert=cn-mismatch,unknown-ca,not-yet-valid/' 'include/configclass.php' 

EXPOSE 80
VOLUME /var/www/html/include
CMD php -S 0.0.0.0:80
