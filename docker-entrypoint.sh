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


# Modify listen.conf
#echo 'Listen *:8080 http' > /opt/sevenval/fit14/conf/include/listen.conf


# Start Apache
service apache2 start


bash