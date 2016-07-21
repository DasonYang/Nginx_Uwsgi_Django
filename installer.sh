#!/bin/sh

apt-get update
apt-get install python-dev python-pip python nginx -y

pip install -r `pwd`/requirements.txt
pip install uwsgi

sed -i 's?\(server unix\:\/\/\).*\(mysite/.*\)?\1'"$PWD"'/\2?' mysite_nginx.conf
sed -i 's?\(.* = \).*\(mysite/.*\)?\1'"$PWD"'/\2?' mysite_uwsgi.conf

cp `pwd`/mysite_nginx.conf /etc/nginx/sites-available
ln -s  /etc/nginx/sites-available/mysite_nginx.conf /etc/nginx/sites-enabled

chown www-data:www-data -R `pwd`/mysite

uwsgi --master --ini `pwd`/mysite_uwsgi.conf

service nginx restart