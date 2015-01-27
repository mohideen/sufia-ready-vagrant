#!/bin/bash -x

echo "Installing sufia..."

sudo mkdir /apps
user=$(whoami)
sudo chown $user:$user /apps
cd /apps
rails new sufia
cd sufia
cp /vagrant/sufia/Gemfile /apps/sufia/Gemfile
bundle install
rails generate sufia:install -f
rake db:migrate
cp /vagrant/sufia/solr.yml /apps/sufia/config/solr.yml
cp /vagrant/sufia/fedora.yml /apps/sufia/config/fedora.yml
cp /vagrant/sufia/development.rb /apps/sufia/config/environments/development.rb
cp /vagrant/sufia/application.css /apps/sufia/app/assets/stylesheets/application.css
cp /vagrant/sufia/application.js /apps/sufia/app/assets/javascripts/application.js
echo "Done!"