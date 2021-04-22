# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ztouzri <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/22 18:21:44 by ztouzri           #+#    #+#              #
#    Updated: 2021/04/22 18:21:45 by ztouzri          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

service nginx start
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8"
mysql -e "USE wordpress"
mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'changeme';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';"
mysql -e "FLUSH PRIVILEGES"
service php7.3-fpm start
bash
