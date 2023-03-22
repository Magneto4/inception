FROM debian:buster

EXPOSE 3306

RUN apt update
RUN apt install -y mariadb-common mariadb-server mariadb-client
RUN apt install -y procps

COPY tools/set_up.sql /tmp/
COPY tools/init.sh /tmp/

ENTRYPOINT ["sh", "/tmp/init.sh"]
CMD ["mysqld",  "--user=mysql", "--console"]