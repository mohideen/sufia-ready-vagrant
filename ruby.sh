#!/usr/bin/env bash

echo "Installing ruby..."
yum -y install ruby
yum -y install gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel
yum -y install ruby-rdoc ruby-devel
yum -y install rubygems
yes | gem update
yes | gem update --system
yes | gem install rails
echo "Done!"
