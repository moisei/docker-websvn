FROM php:5.6-alpine

LABEL maintainer="Moisei Rabinovich @ gmail"
RUN apk --update add subversion
RUN mkdir -p /var/www
RUN svn export --username guest --password "" http://websvn.tigris.org/svn/websvn/trunk /var/www/html
WORKDIR /var/www/html
COPY config.php /var/www/html/include

EXPOSE 80
VOLUME /var/www/html/include
# CMD php -S 0.0.0.0:80
