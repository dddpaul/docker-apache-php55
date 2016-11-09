FROM phusion/baseimage:0.9.18

MAINTAINER Pavel Derendyaev <pderendyaev@smile-net.ru>

RUN apt-get update \
    && apt-get install -y apache2 libapache2-mod-php5 php5 php5-cli php5-gd php5-json php5-ldap php5-mysql php5-pgsql \
    && apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && a2enmod rewrite

ADD root /

VOLUME ["/var/www"]
EXPOSE 80

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
