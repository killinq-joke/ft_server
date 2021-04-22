FROM debian:buster

RUN apt update && apt install -y wget vim curl nginx php php-fpm php-mbstring php-xml php-mysqli mariadb-server snapd

COPY srcs/init.sh init.sh
COPY srcs/default /etc/nginx/sites-available/default
COPY srcs/wordpress/ wordpress
RUN mv wordpress/* /var/www/html/.
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz && tar xvf phpMyAdmin-5.1.0-all-languages.tar.gz && rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz && mv phpMyAdmin-5.1.0-all-languages /var/www/html/phpmyadmin
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/public.csr -subj "/C=FR/ST=Alpes-Maritimes/L=Nice/O=42Nice /OU=42 Dherka/CN=localhost"
CMD sh init.sh

EXPOSE 80
EXPOSE 443
