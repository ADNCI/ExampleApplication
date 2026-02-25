#!/usr/bin/env bash

# Exit on any error
set -e

# Navigate to project directory
cd ~/ExampleApplication

# Pull latest code from GitHub
git pull origin main

# Install dependencies
npm install
echo "$PRIVATE_KEY" > privatekey.pem
echo "$SERVER" > server.crt

# Restart PM2 app with correct port
PORT=8080 pm2 restart calculator-app || PORT=8080 pm2 start bin/www --name calculator-app
