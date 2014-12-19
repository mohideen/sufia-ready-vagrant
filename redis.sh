 #!/usr/bin/env bash

echo "Installing Redis..."

yum -y install epel-release
yum -y install redis
systemctl enable redis.service
systemctl start redis.service

echo "Done!"
