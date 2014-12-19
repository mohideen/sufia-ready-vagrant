#!/usr/bin/env bash

echo "Installing Java and Tomcat..."
yum -y install java tomcat

echo "Installing Fedora 4..."
mkdir -p /var/fedora4/fedora-data
chown -R tomcat:tomcat /var/fedora4
wget -q http://repo1.maven.org/maven2/org/fcrepo/fcrepo-webapp/4.0.0/fcrepo-webapp-4.0.0.war -O /usr/share/tomcat/webapps/fcrepo.war

echo "Installing Solr..."
wget -q http://mirror.csclub.uwaterloo.ca/apache/lucene/solr/4.10.2/solr-4.10.2.tgz -O /tmp/solr.tar.gz
tar xvf /tmp/solr.tar.gz -C /tmp
cp /tmp/solr-4.10.2/example/lib/ext/* /usr/share/tomcat/lib/
mkdir -p /var/solr
cp -R /tmp/solr-4.10.2/example/solr/* /var/solr
cp -R /tmp/solr-4.10.2/contrib /var/solr
cp -R /tmp/solr-4.10.2/dist /var/solr
cp /vagrant/solrconfig.xml /var/solr/collection1/conf/solrconfig.xml
chown -R tomcat:tomcat /var/solr
cp /tmp/solr-4.10.2/dist/solr-4.10.2.war /usr/share/tomcat/webapps/solr.war

echo "Installing Message Consumer..."
wget -q http://repo1.maven.org/maven2/org/fcrepo/fcrepo-message-consumer-webapp/4.0.0/fcrepo-message-consumer-webapp-4.0.0.war -O /usr/share/tomcat/webapps/fcrepo-message-consumer.war

echo "Setting JAVA_OPTS..."
grep -q -F 'JAVA_OPTS="-Dfcrepo.home=/var/fedora4/fedora-data -Dsolr.solr.home=/var/solr"' /etc/tomcat/tomcat.conf || echo 'JAVA_OPTS="-Dfcrepo.home=/var/fedora4/fedora-data -Dsolr.solr.home=/var/solr"' >> /etc/tomcat/tomcat.conf

systemctl enable tomcat.service
systemctl start tomcat.service

echo "Installing Fuseki..."
wget -q http://www.apache.org/dist/jena/binaries/jena-fuseki-1.1.1-distribution.tar.gz -O /home/vagrant/jena-fuseki-1.1.1-distribution.tar.gz
tar xvfz /home/vagrant/jena-fuseki-1.1.1-distribution.tar.gz
cd /home/vagrant/jena-fuseki-1.1.1/
mkdir -p /var/fuseki
chown -R vagrant:vagrant /var/fuseki
nohup ./fuseki-server --update --loc /var/fuseki  /fcrepo &

while [ ! -f /usr/share/tomcat/webapps/fcrepo-message-consumer/WEB-INF/classes/spring/indexer-core.xml ]
do
  sleep 2
done
yes | cp /vagrant/indexer-core.xml /usr/share/tomcat/webapps/fcrepo-message-consumer/WEB-INF/classes/spring/indexer-core.xml
chown tomcat:tomcat /usr/share/tomcat/webapps/fcrepo-message-consumer/WEB-INF/classes/spring/indexer-core.xml

systemctl restart tomcat.service

sleep 20

/vagrant/fixfedora.sh

echo "Done!"
