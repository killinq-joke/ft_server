#!/bin/bash

service nginx start
service mysql start
mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'changeme';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'zak'@'localhost';"
#mysql -e "FLUSH PRIVILEGES"
service php7.3-fpm start
bash
