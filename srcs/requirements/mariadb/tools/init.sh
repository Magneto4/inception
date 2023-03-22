mkdir -p /var/lib/mysql

/etc/init.d/mysql start
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysql < /tmp/set_up.sql

pkill mysql
echo "finished setting up mariadb"
exec $@