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
COPY apache.crt /etc/ssl/apache.crt
COPY apache.key /etc/ssl/apache.key

# Activate SSL-Module 
RUN a2enmod ssl && a2ensite default-ssl.conf


RUN chgrp -R root /var/lib/apache2 && chmod -R g+w /var/lib/apache2 && \
	chgrp -R root /var/log/apache2 && chmod -R g+w /var/log/apache2 && \
	chgrp -R root /var/cache/apache2 && chmod -R g+w /var/cache/apache2

RUN mkdir -p /var/run/apache2 && chgrp -R root /var/run/apache2 && chmod -R g+w /var/run/apache2

#RUN chmod -R 777 /var/run/apache2

RUN adduser apachetest --gecos ""  --disabled-password
RUN usermod -aG root apachetest

RUN rm -rf /var/lock
RUN mkdir -p /var/lock/apache2 && chown root.root /var/lock/apache2 && chmod 777 /var/lock/apache2

RUN /usr/sbin/apachectl configtest

USER apachetest

ENTRYPOINT ["/tmp/docker-entrypoint.sh"]