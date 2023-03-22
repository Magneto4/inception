FROM debian:buster
RUN apt update
RUN apt install -y nginx
RUN apt install -y openssl
EXPOSE 443/tcp
RUN mkdir -p /etc/nginx/
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/nginx_init.sh /etc/nginx/
ENTRYPOINT [ "sh", "etc/nginx/nginx_init.sh" ]