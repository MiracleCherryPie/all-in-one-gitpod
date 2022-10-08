FROM debian as web-server
RUN apt update
RUN env DEBIAN_FRONTEND=noninteractive apt -yq upgrade \
    && apt -yq install apache2 mariadb-server php libapache2-mod-php php-mysql wget curl zip unzip
RUN service mariadb start
RUN echo "CREATE USER 'gitpod'@'localhost' IDENTIFIED BY 'password';" >> mysql.txt
RUN echo "GRANT ALL PRIVILEGES ON *.* TO 'gitpod'@'localhost';" >> mysql.txt
RUN echo "ALTER USER 'gitpod'@'localhost' IDENTIFIED BY 'passwd123';" >> mysql.txt
RUN service mariadb start && mysql -u root < mysql.txt
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.zip
RUN unzip phpMyAdmin-5.2.0-all-languages.zip
RUN mkdir /var/www/html/phpmyadmin && cp -r phpMyAdmin-5.2.0-all-languages/* /var/www/html/phpmyadmin
RUN rm /mysql.txt
CMD service apache2 start && service mariadb start && sleep infinity