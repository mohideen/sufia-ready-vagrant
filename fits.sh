#!/usr/bin/env bash

echo "Installing fits..."
yum -y install unzip java
mkdir /opt/fits
wget https://fits.googlecode.com/files/fits-0.6.2.zip -O /tmp/fits.zip
unzip /tmp/fits.zip -d /opt/fits
chmod a+x /opt/fits/fits-0.6.2/fits.sh
echo "Done!"