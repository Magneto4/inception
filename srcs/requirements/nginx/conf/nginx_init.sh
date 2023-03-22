openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=FR/ST=Paris/L=Paris/O=wordpress/CN=nseniak.42.fr"
echo "nginx finished setting up"
nginx -g "daemon off;"