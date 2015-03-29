FROM debian
MAINTAINER debug-ito <debug.ito@gmail.com>

RUN apt-get update
RUN apt-get install -y apache2 mysql-server php5 php5-snmp php5-mysql libapache2-mod-php5
RUN apt-get clean

ADD http://www.opendcim.org/packages/openDCIM-3.3.tar.gz /var/www/openDCIM-3.3.tar.gz
RUN tar -C /var/www -xzf /var/www/openDCIM-3.3.tar.gz
RUN ln -s /var/www/openDCIM-3.3 /var/www/opendcim

RUN mv /var/www/opendcim/db.inc.php-dist /var/www/opendcim/db.inc.php
## RUN mv /var/www/opendcim/install.php /var/www/opendcim/install.php.completed
RUN mkdir -p /home/opendcim
RUN htpasswd -cb /home/opendcim/htpasswd opendcim pass
ADD dot.htaccess /var/www/opendcim/.htaccess

ADD apache_opendcim.conf /etc/apache2/sites-enabled/apache_opendcim.conf
RUN rm /etc/apache2/sites-enabled/000-default

ADD run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 80

ENTRYPOINT ["/run.sh"]

## When you access the page for the first time, installation procedure
## runs. After it completes, you must remove install.php to start
## normal operation. This sucks...
