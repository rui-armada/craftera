#!/bin/bash
yum -y update
yum -y install httpd
echo "Hello World!" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
