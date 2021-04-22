FROM debian:buster

RUN apt update
RUN apt install -y wget vim curl nginx php php-fpm php-mbstring php-xml php-mysqli mariadb-server

COPY srcs/init.sh init.sh
COPY srcs/default /etc/nginx/sites-available/default
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN tar xvf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages /var/www/html/phpmyadmin
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN tar xvf latest-fr_FR.tar.gz
RUN rm -rf latest-fr_FR.tar.gz
RUN mv wordpress/* /var/www/html/.
RUN rm -f /var/www/html/wp-config-sample.php
COPY srcs/wp-config.php /var/www/html/wp-config.php
CMD sh init.sh

EXPOSE 80
EXPOSE 443
