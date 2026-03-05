#!/usr/bin/env bash

set -e

cd ~/ExampleApplication

git pull origin main

npm install

# Write certificate files safely
printf "%b" "$PRIVATE_KEY" > privatekey.pem
printf "%b" "$SERVER" > server.crt

# Restart PM2 app with correct port
if pm2 list | grep -q calculator-app; then
  PORT=8080 pm2 restart calculator-app
else
  PORT=8080 pm2 start bin/www --name calculator-app
fi
