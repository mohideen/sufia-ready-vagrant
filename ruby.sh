#!/usr/bin/env bash

echo "Installing ruby and nodejs..."
yum -y install ruby
yum -y install gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel
yum -y install patch nodejs
yum -y groupinstall 'Development Tools'
yum -y install ruby-rdoc ruby-devel
yum -y install rubygems
yes | gem update
yes | gem update --system
yes | gem install rails
# Remove version of json gem that causes conflicts for the multi_json gem
yes | gem uninstall -i /usr/local/share/gems json
echo "Done!"
