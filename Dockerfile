FROM ubuntu:14.04

# runtime environment
ENV HOME /tmp
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get update && apt-get upgrade -y \
  && apt-get install apache2 -y

COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh
RUN chmod -f 777 /tmp/docker-entrypoint.sh

# default Apache-SSL configuration
COPY default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

COPY ports.conf /etc/apache2/ports.conf



# Activate SSL-Module 
RUN a2enmod ssl
RUN a2ensite default-ssl.conf

ENTRYPOINT ["/tmp/docker-entrypoint.sh"]