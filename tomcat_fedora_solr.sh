#!/usr/bin/env bash

echo "Installing Java and Tomcat..."
yum -y install java tomcat tomcat-admin-webapps

echo "Installing Solr..."

wget -q http://mirror.csclub.uwaterloo.ca/apache/lucene/solr/4.10.2/solr-4.10.2.tgz -O /tmp/solr.tar.gz
tar xvf /tmp/solr.tar.gz -C /tmp
cp /tmp/solr-4.10.2/example/lib/ext/* /usr/share/tomcat/lib/
mkdir -p /var/solr
cp -R /tmp/solr-4.10.2/example/solr/* /var/solr
chown -R tomcat:tomcat /var/solr
cp /tmp/solr-4.10.2/dist/solr-4.10.2.war /usr/share/tomcat/webapps/solr.war

grep -q -F 'JAVA_OPTS="-Dsolr.solr.home=/var/solr"' /etc/tomcat/tomcat.conf || echo 'JAVA_OPTS="-Dsolr.solr.home=/var/solr"' >> /etc/tomcat/tomcat.conf

systemctl enable tomcat.service
systemctl start tomcat.service

echo "Done!"