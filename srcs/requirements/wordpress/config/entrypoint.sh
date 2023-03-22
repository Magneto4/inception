while ! mariadb -h$MYSQL_HOSTNAME -u$MYSQL_USER -p$MYSQL_PASSWORD $WP_DATABASE; do
	echo Waiting for mariadb...
	sleep 3
done

if [ ! -d "/var/www/html/wp-config.php" ]; then
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod u+x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	mkdir -p /var/www/html/
	cd /var/www/html/
	# wget https://wordpress.org/latest.tar.gz
	# tar -zxvf latest.tar.gz
	# mv wordpress/* .
	# rm -rf wordpress
	# chown -R www-data:www-data *
	# chmod -R 755 *
	wp core download --path=/var/www/html --allow-root=yes
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME":3306"/g" wp-config-sample.php
	sed -i "s/database_name_here/$WP_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	# cp /tmp/wp-config.php /var/www/html/

	wp core install --allow-root=yes --path=/var/www/html/ --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email
	wp user create --allow-root=yes --path=/var/www/html/ $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
fi

echo "wordpress finished setting up"
mkdir /run/php
exec $@