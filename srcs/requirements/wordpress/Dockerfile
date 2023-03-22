FROM debian:buster

EXPOSE 9000

RUN apt update
RUN apt-get -y install wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	mariadb-client
# COPY ./config/wp-config.php /tmp/
COPY ./config/entrypoint.sh /tmp/
COPY ./config/www.conf /etc/php/7.3/fpm/pool.d/
ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
CMD ["/usr/sbin/php-fpm7.3", "-F"]