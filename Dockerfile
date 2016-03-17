FROM ubuntu:14.04

MAINTAINER Pavel Derendyaev <pderendyaev@smile-net.ru>

VOLUME ["/var/www"]

RUN apt-get update \
    && apt-get install -y apache2 libapache2-mod-php5 php5 php5-cli php5-gd php5-json php5-ldap php5-mysql php5-pgsql \
    && apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
