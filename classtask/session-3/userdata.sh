#!/bin/bash

sudo dnf install httpd -y
sudo echo 'Hello from ${env} environment' > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd