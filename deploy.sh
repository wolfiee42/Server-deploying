#!/bin/bash

set -e

APP_DIR="/home/boss/Server-deploying"

echo ">>>  Pulling latest code  <<<"
cd $APP_DIR
git pull origin main

echo ">>>  Installing dependencies  <<<"
pnpm install --frozen-lockfile

echo ">>>  Building the project  <<<"
pnpm build

echo ">>>  Restarting the project with pm2  <<<"
pm2 reload ecosystem.config.js 

echo ">>>  Deployment Finished  <<<"