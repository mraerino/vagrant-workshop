#!/usr/bin/env bash

echo "Preinstall configuration"

export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'

echo "Installing dependencies"

apt-get -y -q update > /dev/null
apt-get -y -q install --no-install-recommends apache2 libapache2-mod-php5 php5 php5-mysql mysql-server > /dev/null

echo "Configuring services"

service mysql stop > /dev/null
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
service mysql start > /dev/null
echo "use mysql;update user set host='%' where user='root' and host='localhost';flush privileges;" | mysql -uroot -proot

# symlink sources into apache dir
rm -rf /var/www/html
ln -s /vagrant/public /var/www/html

echo "Install done"