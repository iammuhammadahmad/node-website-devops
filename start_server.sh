#!/bin/bash

echo "Start Application"

APPLICATION_NAME="node-website"

sudo pm2 describe "$APPLICATION_NAME"
if [ $? -eq 0 ]
then
    sudo pm2 restart "$APPLICATION_NAME"
else
    sudo pm2 start npm --name "$APPLICATION_NAME" -- run start
fi
sudo pm2 startup systemd
sudo pm2 save