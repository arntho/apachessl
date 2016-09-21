#!/bin/bash
echo "Docker-entrypoint.sh is running ..."

#
# extract project
#sudo mkdir -p /var/lib/fit14/projects/_default/
#sudo tar -xzf /tmp/projects-allianz-vthp-mobile.tar.gz -C /var/lib/fit14/projects/_default/

#
# create SSL-certificate
#sudo /opt/sevenval/fit14/lib/fit/bin/createCertificate.sh shop.example.com

#
# Create configuration
#sudo /opt/sevenval/fit14/bin/fitadmin config generate

# Start Apache
#/usr/sbin/apache2 -k start -d '/etc/apache2' -f '/etc/apache2/sites-enabled/default-ssl.conf'
#service apache2 start
apachectl start

# Open ports
netstat -tulpen | grep -v 127.0.0.1 

bash