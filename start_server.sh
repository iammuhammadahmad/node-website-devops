#!/bin/bash
APPLICATION_NAME="node-website"
cd  /var/www/node-website

pm2 describe "$APPLICATION_NAME"
if [ $? -eq 0 ]
then
    pm2 restart "$APPLICATION_NAME"
else
    pm2 start npm --name "$APPLICATION_NAME" -- run start
fi
pm2 startup systemd
pm2 save
systemctl restart apache2