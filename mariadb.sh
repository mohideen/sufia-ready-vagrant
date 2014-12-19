#!/usr/bin/env bash

echo "Installing MariaDB..."
yum -y install mariadb-server mariadb
systemctl enable mariadb
systemctl start mariadb

echo "Done!"
